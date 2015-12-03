class User < ActiveRecord::Base
  has_many :favorites
  validates_presence_of :email, :name
  
  def self.authenticate(params)
    where(email: params['email']).first
  end


  def favorites_include?(title)
    favorites.where(title: title).any?
  end
end
