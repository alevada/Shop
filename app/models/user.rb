
class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains
  has_secure_password
  before_save {email.downcase! }
  validates :email, presence: true, uniqueness: true, length: {maximum: 100}
  validates :name, presence: true
  belongs_to :cart

  class Error < StandardError
  end

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
