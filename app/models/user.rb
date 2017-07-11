class User < ActiveRecord::Base
  validates :password, length: {minimum: 6}
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, length: {minimum:1}
  validates :last_name, length: {minimum: 1}

  def self.authenticate_with_credentials(email,pw)
    email = email.split.join.downcase
    user = User.where(email: email).first
    ret = nil
    if user && user.authenticate(pw)
      ret = user
    else
    end
    ret
  end
end
