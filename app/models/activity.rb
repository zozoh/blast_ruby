class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :options, :class_name => 'ActivityOption'
  has_one :type, :class_name => 'ActivityType'

  field :name, type: String
  field :activity_type, type: String
  field :url, type: String
  field :option1, type: Time
  field :option2, type: Time
  field :option3, type: Time

  def push
    if apk?
      push_to_gcm
    elsif ipa?
      push_to_apns
    end
  end

  def push_message
    "#{self.name} is updated to v#{self.version_name}"
  end

  def push_to_apns
    APNS.host = Settings.apns_host
    # gateway.sandbox.push.apple.com is default

    APNS.pem  = Settings.apns_path
    # this is the file you just created

    APNS.port = 2195
    # this is also the default. Shouldn't ever have to set this, but just in case Apple goes crazy, you can.

    notifications = Array.new

    @tokens = Token.where(:type => 'ios')
    @tokens.each do |t|
      notifications.push(APNS::Notification.new(t.token, self.push_message ))
    end
    if notifications.count > 0
      APNS.send_notifications(notifications)
    end
  end

  def push_to_gcm
    gcm = GCM.new(Settings.gcm_api_key)
    registration_ids = Array.new # an array of one or more client registration IDs
    @tokens = Token.where(:type => 'android')
    @tokens.each do |t|
      registration_ids.push(t.token)
    end
    options = {data: {message: self.push_message}, collapse_key: "message"}

    if registration_ids.count > 0
      response = gcm.send_notification(registration_ids, options)
    end
  end

end
