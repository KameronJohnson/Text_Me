class Message < ActiveRecord::Base
  before_create :send_message

  private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC890d0dbd96dd6bb1f21818fbb00460e3/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :From => from,
                    :To => to,
                    :Body => body }
    ).execute
  end

end
