module Event
  module APIHelpers
    def authenticate!
      error!({ "error" => "401 Unauthorized" }, 401) unless current_user
    end

    def attributes_for_keys(keys)
      attrs = {}
      keys.each do |key|
        attrs[key] = params[key] if params[key].present?
      end
      attrs
    end

    def not_found!(resource = nil)
      message = ["404"]
      message << resource if resource
      message << "Not Found"
      render_api_error!(message.join(' '), 404)
    end
    # Checks the occurrences of required attributes, each attribute must be present in the params hash
    # or a Bad Request error is invoked.
    #
    # Parameters:
    #   keys (required) - A hash consisting of keys that must be present
    def required_attributes!(keys)
      keys.each do |key|
        bad_request!(key) unless params[key].present?
      end
    end

    def bad_request!(attribute)
      message = ["400 (Bad request)"]
      message << "\"" + attribute.to_s + "\" not given"
      render_api_error!(message.join(' '), 400)
    end

    def render_api_error!(message, status)
      error!({'message' => message}, status)
    end

    def good_request!(attribute)
      body({ status: true, message: 'Success', data: attribute })
    end

    def no_change!
      body({ status: true, message: 'No change' })
    end
  end
end
