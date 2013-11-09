module Event
  module APIEntities
    class Token < Grape::Entity
      expose :token, :type
    end

    class User < Grape::Entity
      expose :name, :username
    end

    class ActivityOption < Grape::Entity
      expose :id, :option
    end

    class ActivityUser < Grape::Entity
      expose :voted
      expose :user, using: APIEntities::User
    end

    class Activity < Grape::Entity
      expose :id, :name, :activity_type, :creator
      expose :creator, using: APIEntities::User
      expose :options, using: APIEntities::ActivityOption
      expose :invited_users, using: APIEntities::ActivityUser
    end

    class ActivityType < Grape::Entity
      expose :name, :type
    end
  end
end
