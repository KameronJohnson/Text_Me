class Message < ActiveRecord::Base
  before_create :send_message
  validates :from, presence: true
  validates :to, presence: true
  validates :body, presence: true
  belongs_to :user

private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC890d0dbd96dd6bb1f21818fbb00460e3/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :From => from,
                      :To => to,
                      :Body => body }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end

end
