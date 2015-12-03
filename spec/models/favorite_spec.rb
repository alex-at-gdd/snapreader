require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before(:each) do
    @user = User.new()
    @favorite = Favorite.create(user: @user)
  end

  it 'belongs to a user' do
    expect(@favorite.user).to eql(@user)
  end

  it 'responds to recent_first correctly' do
    generate_favorites
    expect(@user.favorites.recent_first.last).to eql(@user.favorites.order('created_at DESC').last)
  end


  private

    def generate_favorites
      @user.update(name: 'chet', email: 'c@boolean.com')
      @user.save
      5.times do
        @user.favorites.create()
      end
    end

end