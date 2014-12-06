class Session
  include ActiveModel::Model
  attr_accessor :username, :password, :user

  validate :authorized
  validates :username,
    presence: true

  validates :password,
    presence: true

  def persisted?
    false
  end

  def authorized
    user = User.find_by(username: self.username)
    unless user && user.authenticate(self.password)
      errors.add(:base, "Access Denied")
    else
      @user = user
    end
  end
end
