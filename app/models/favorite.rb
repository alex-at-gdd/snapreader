class Favorite < ActiveRecord::Base
  belongs_to :user

  def self.recent_first
    order('created_at DESC')
  end
end
