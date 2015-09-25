require 'rails_helper'

describe User, '#display_name' do
  it 'is invalid without first_name' do
    Factory.build(:user, first_name: nil).should_not be_valid
  end
  it 'is invalid without last_name' do
    Factory.build(:user, last_name: nil).should_not be_valid
  end
  it 'should return full name' do
    user = create(:user, first_name: 'Josh', last_name: 'Tan')
    expect(user.display_name) == 'Josh Tan'
  end
end
