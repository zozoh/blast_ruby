#coding:utf-8
require "entities"
require "helpers"
module Event
  class API < Grape::API
    default_format :json
    prefix "api"

    helpers APIHelpers

    resource :blasts do
      desc "Get Blast List"
      get do
        required_attributes! [:lon, :lat, :n]
        result = []
        Blast.limit(params[:n].to_i).geo_near([params[:lon].to_f, params[:lat].to_f]).max_distance(0.005).each do |blast|
          result << blast
          # binding.pry
        end
        good_request!(present result, :with => APIEntities::Blast)
      end

      desc "Upload image"
      post "new" do
        image = params[:image]

        attachment = {
          :filename     => image[:filename],
          :type         => image[:type],
          :headers      => image[:head],
          :tempfile     => image[:tempfile]
        }

        @picture = Picture.new

        @picture.attachment = attachment[:tempfile]

        @picture.attachment_file_name = attachment[:filename]

        # binding.pry

        if @picture.save
          good_request!(present @picture, :with => APIEntities::Picture)
        end
      end
    end

    resource :activities do
      desc "Get Activity List"
      get do
        required_attributes! [:type]
        @activities = Activity.where({}).desc(:created_at)
        good_request!(present @activities, :with => APIEntities::SimpleActivity)
      end

      desc "Get Activity Types"
      get "types" do
        @types = ActivityType.all
        good_request!(present @types, :with => APIEntities::ActivityType)
      end

      desc "Get one Activity"
      get "show" do
        required_attributes! [:id]
        @activity = Activity.find(params[:id])
        good_request!(present @activity, :with => APIEntities::Activity)
      end

      desc "Post New Activity"
      post do
        required_attributes! [:name, :activity_type, :option1, :option2, :option3, :creator, :usernames]
        @activity = Activity.new
        @activity.name = params[:name]
        @activity.activity_type = params[:activity_type]
        @activity.option1 = params[:option1]
        @activity.option2 = params[:option2]
        @activity.option3 = params[:option3]

        @user = User.where(:username => params[:creator]).first
        @activity.creator = @user

        ActivityOption.create(:option => @activity.option1, :activity_id => @activity.id)
        ActivityOption.create(:option => @activity.option2, :activity_id => @activity.id)
        ActivityOption.create(:option => @activity.option3, :activity_id => @activity.id)

        if @activity.save
          params[:usernames].split(',').each do |u|
            user = User.where(:username => u.to_s).first
            unless user.nil?
              ActivityUser.create(:activity_id => @activity.id, :user_id => user.id, :voted => false)
            end
          end

          good_request!(present @activity, :with => APIEntities::Activity)
        end
      end

      desc "Vote for Activity with JSON request"
      post "vote" do
        required_attributes! [:activity_id, :options, :username]
        @user = User.where(:username => params[:username]).first

        @activity = Activity.find(params[:activity_id])
        @activity.options.each do |old|
          ActivityOptionUser.where(:user_id => @user.id, :selected_option_id => old.id).delete
        end

        params[:options].each do |o|
          @option = ActivityOption.find(o.to_s)
          ActivityOptionUser.create(:user_id => @user.id, :selected_option_id => @option.id)
        end

        @invited_user = ActivityUser.where(:activity_id => params[:activity_id], :user_id => @user.id).first
        @invited_user.voted = true
        if @invited_user.save
          good_request!(present @invited_user, :with => APIEntities::ActivityUser)
        end
      end

      desc "Comment for Activity with JSON request"
      post "comment" do
        required_attributes! [:activity_id, :comment, :username]
        @user = User.where(:username => params[:username]).first

        @comment = ActivityComment.new(:activity_id => params[:activity_id], :user_id => @user.id, :comment => params[:comment])

        if @comment.save
          good_request!(present @comment, :with => APIEntities::ActivityComment)
        end
      end

      desc "Report for Activity"
      get "report" do
      end

      desc "Like other participants of the same Activity"
      post "like" do
      end
    end

    resource :users do
      desc "Get the user list of the selected activity"
      get do
        required_attributes! [:activity_id]
        @users = User.all
        good_request!(present @users, :with => APIEntities::User)
      end
    end

    resource :tokens do
      desc "Set token for push notification"
      post "ios" do
        required_attributes! [:token, :username]
        @user = User.where(:username => params[:username]).first
        @token = Token.new
        @token.token = params[:token]
        @token.user = @user
        @token.type = 'ios'
        if @token.save
          good_request!(present @token, :with => APIEntities::Token)
        else
          no_change!
        end
      end

      post "android" do
        required_attributes! [:token, :username]
        @user = User.where(:username => params[:username]).first
        @token = Token.new
        @token.token = params[:token]
        @token.user = @user
        @token.type = 'android'
        if @token.save
          good_request!(present @token, :with => APIEntities::Token)
        else
          no_change!
        end
      end
    end


  end
end
