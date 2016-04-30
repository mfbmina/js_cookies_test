class Cookie < ActiveRecord::Base
  validates :uid, presence: true
  validates :url, presence: true
  validates :access_time, presence: true
end
