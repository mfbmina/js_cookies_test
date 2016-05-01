class Contact < ActiveRecord::Base
  has_many :cookies

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: I18n.t('activerecord.errors.models.contact.attributes.email.format')
  }
end
