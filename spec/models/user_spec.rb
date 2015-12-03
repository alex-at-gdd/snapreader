require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new()
  end

  it 'validates presence of name' do
    @user.update(email: 'fake@email.com', name: nil)
    expect(@user).to_not be_valid
  end

  it 'validates presence of name' do
    @user.update(email: nil, name: 'Michael Boolean')
    expect(@user).to_not be_valid
  end

  it 'has many favorites' do
    expect(@user).to respond_to(:favorites)
  end
end
