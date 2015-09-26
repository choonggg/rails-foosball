require 'rails_helper'

describe User, type: :model do

  subject(:user) { create(:user) }

  it "should have a valid factory do" do
    subject.should be_valid
  end

end

describe User, 'validation' do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end

describe User, '#display_name' do
  it 'should return full name' do
    user = create(:user, first_name: 'John', last_name: 'Doe')
    expect(user.display_name).to eq 'John Doe'
  end
end
