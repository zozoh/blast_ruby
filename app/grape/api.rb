#coding:utf-8
require "entities"
require "helpers"
module Event
  class API < Grape::API
    default_format :json
    prefix "api"

    helpers APIHelpers

    resource :activities do
      desc "Get Activity Types"
      desc "Get Activity List"
      get do
        required_attributes! [:type]
        @activities = Activity.where({})
        present @activities, :with => APIEntities::Activity
      end

      get "types" do
        @types = ActivityType.all
        present @types, :with => APIEntities::ActivityType
      end

      desc "Get one Activity"
      get "show" do
        required_attributes! [:id]
        @activity = Activity.find(params[:id])
        present @activity, :with => APIEntities::Activity
      end

      desc "Post New Activity"
      post do
        required_attributes! [:name, :option1, :option2, :option3]
        @activity = Activity.new
        @activity.name = params[:name]
        @activity.activity_type = params[:activity_type]
        @activity.option1 = params[:option1]
        @activity.option2 = params[:option2]
        @activity.option3 = params[:option3]

        ActivityOption.create(:option => @activity.option1, :activity_id => @activity.id)
        ActivityOption.create(:option => @activity.option2, :activity_id => @activity.id)
        ActivityOption.create(:option => @activity.option3, :activity_id => @activity.id)

        if @activity.save
          present @activity, :with => APIEntities::Activity
        end
      end

      desc "Vote for Activity with JSON request"
      post "vote" do
        required_attributes! [:options, :username]
        params[:options].each do |o|
          @option = ActivityOption.find(o.to_s)
          @user = User.where(:username => params[:username]).first
          @selection = ActivityOptionUser.new(:user_id => @user.id, :selected_option_id => @option.id)

          if @selection.save
            present @selection, :with => APIEntities::Activity
          end
        end
      end

      desc "Report for Activity"
      post "report" do
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
        present @users, :with => APIEntities::User
      end
    end

    resource :tokens do
      desc "Set token for push notification"
      post "ios" do
        required_attributes! [:token]
        @token = Token.new
        @token.token = params[:token];
        @token.type = 'ios'
        if @token.save
          present @token, :with => APIEntities::Token
        end
      end

      post "android" do
        required_attributes! [:token]
        @token = Token.new
        @token.token = params[:token];
        @token.type = 'android'
        if @token.save
          present @token, :with => APIEntities::Token
        end
      end
    end


  end
end
