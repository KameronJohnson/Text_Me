require 'rails_helper'

describe Contact, vcr: true do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should have_many :messages}

end
