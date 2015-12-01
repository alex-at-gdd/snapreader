class User < ActiveRecord::Base

  def self.authenticate(params)
    where(:email => params['email']).first
  end
end
