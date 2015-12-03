class User < ActiveRecord::Base
  has_many :favorites
  
  def self.authenticate(params)
    where(:email => params['email']).first
  end


  def favorites_include?(title)
    favorites.where(title: title).any?
  end
end
