class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :options, :class_name => 'ActivityOption'
  has_many :invited_users, :class_name => 'ActivityUser'
  has_one :type, :class_name => 'ActivityType'
  belongs_to :creator, :class_name => 'User'

  field :name, type: String
  field :activity_type, type: String
  field :url, type: String
  field :option1, type: Time
  field :option2, type: Time
  field :option3, type: Time

  def push
    apns_list = Array.new
    gcm_list = Array.new

    invited_users.each do |u|
      u.user.tokens.each do |t|
        if t.type == 'ios'
          apns_list.push(APNS::Notification.new(t.token, self.push_message ))
        elsif t.type == 'android'
          gcm_list.push(t.token)
        end
      end
    end

    push_to_apns(apns_list)
    push_to_gcm(gcm_list)
  end

  def push_message
    "Event #{self.name} is created"
  end

  def push_to_apns(apns_list)
    APNS.host = Settings.apns_host
    # gateway.sandbox.push.apple.com is default

    APNS.pem  = Settings.apns_path
    # this is the file you just created

    APNS.port = 2195
    # this is also the default. Shouldn't ever have to set this, but just in case Apple goes crazy, you can.

    if apns_list.count > 0
      APNS.send_notifications(apns_list)
    end
  end

  def push_to_gcm(gcm_list)
    gcm = GCM.new(Settings.gcm_api_key)
    options = {data: {message: self.push_message}, collapse_key: "message"}

    if gcm_list.count > 0
      response = gcm.send_notification(gcm_list, options)
    end
  end

end
