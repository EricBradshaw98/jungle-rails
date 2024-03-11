class User < ApplicationRecord

  before_save :downcase_email

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    
    user = User.find_by('lower(email) = ?', email.downcase.strip)
    puts "Found user: #{true}"
    
    user if user && user.authenticate(password)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
