require 'rails_helper'

describe Message, :vcr => true do

  it { should validate_presence_of :from }
  it { should validate_presence_of :to }
  it { should validate_presence_of :body }

  it "doesn't save the message if twilio gives an error" do
    message = FactoryGirl.build(:message, to: '1111111')
    message.save.should be false
  end

  it 'adds an error if the to number is invalid' do
    message = FactoryGirl.build(:message, to: '1111111')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end

  it 'sends a message if the from and to numbers are valid' do
    message = FactoryGirl.build(:message, from: '5032134556', to: '5037841301')
    message.save
    message[:body].should eq "Hey baby!"
  end

end
