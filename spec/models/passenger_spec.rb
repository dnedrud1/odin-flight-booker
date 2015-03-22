require 'rails_helper'

describe Passenger do 
  it 'has a valid factory' do
    FactoryGirl.create(:passenger).should be_valid
  end
  it 'is invalid without a name' do
    FactoryGirl.build(:passenger, name: nil).should_not be_valid
  end
  it 'is invalid without an email' do
    FactoryGirl.build(:passenger, email: nil).should_not be_valid
  end
end