module Event
  module APIEntities
    class User < Grape::Entity
      expose :name, :username
    end

    class Token < Grape::Entity
      expose :token, :type
      expose :user, using: APIEntities::User
    end

    class ActivityOptionUser < Grape::Entity
      expose :user, using: APIEntities::User
    end

    class ActivityOption < Grape::Entity
      expose :id, :option
      expose :users, using: APIEntities::ActivityOptionUser
    end

    class ActivityUser < Grape::Entity
      expose :voted
      expose :user, using: APIEntities::User
    end

    class ActivityComment < Grape::Entity
      expose :comment
      expose :user, using: APIEntities::User
    end

    class SimpleActivity < Grape::Entity
      expose :id, :name, :activity_type
      expose :creator, using: APIEntities::User
    end

    class Activity < APIEntities::SimpleActivity
      expose :options, using: APIEntities::ActivityOption
      expose :invited_users, using: APIEntities::ActivityUser
      expose :comments, using: APIEntities::ActivityComment
    end

    class ActivityType < Grape::Entity
      expose :name, :type
    end
  end
end
