module Event
  module APIEntities
    class Token < Grape::Entity
      expose :token, :type
    end

    class ActivityOption < Grape::Entity
      expose :option
    end

    class Activity < Grape::Entity
      expose :id, :name, :activity_type
      expose :options, using: APIEntities::ActivityOption
    end

    class User < Grape::Entity
      expose :name, :username
    end
  end
end
