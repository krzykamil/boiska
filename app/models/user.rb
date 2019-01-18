class User < ApplicationRecord

  has_many :reservations
  has_many :supervisored_courts, foreign_key: "supervisor_id", class_name: "Court"
  has_many :administrated_courts, foreign_key: "administrator_id", class_name: "Court"
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, length: { is: 9 }, numericality: true
  has_secure_password

end
