#coding:utf-8
require "entities"
require "helpers"
module Event
  class API < Grape::API
    default_format :json
    prefix "api"

    helpers APIHelpers

    resource :activities do
      desc "Get Activity List"
      get do
        required_attributes! [:type]
        @activities = Activity.where({})
        present @activities, :with => APIEntities::Activity
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
