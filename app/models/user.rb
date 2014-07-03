# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  
  validates :email, :password_digest, :session_token, :presence => true
  before_validation :ensure_session_token
  validates :password, length: {minimum: 6, allow_nil: true}
  
  has_many :circles,
  foreign_key: :owner_id, inverse_of: :owner
  
  has_many :circle_memberships,
  foreign_key: :friend_id
  
  has_many :friendships, through: :circle_memberships, source: :circle
  
  has_many :posts, inverse_of: :user
  #posts from circles I own
  has_many :my_circle_member_posts_shares, through: :circles, source: :post_shares
  #posts from circles I am in
  has_many :circle_member_posts_shares, through: :friendships, source: :post_shares
  
  has_many :circle_member_posts, 
  through: :circle_member_posts_shares, 
  source: :post
  
  has_many :my_circle_member_posts, through: 
  # has_many :friend_circles, through: :circle_memberships, source: :circle
 #
 #  has_many :friend_circle_posts, through: :friend_circles, source: :owner_posts
  
  
  
  def password=(secret)
    if secret.present?
      @password = secret
      self.password_digest = BCrypt::Password.create(secret)
    end
  end
  
  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
                   
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    return nil unless user
    user.is_password?(secret) ? user : nil
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
end 
