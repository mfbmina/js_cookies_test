class Cookie < ActiveRecord::Base
  belongs_to :contact

  validates :contact, presence: true
  validates :url, presence: true
  validates :access_time, presence: true
end
