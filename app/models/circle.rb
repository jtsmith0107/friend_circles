# == Schema Information
#
# Table name: circles
#
#  id          :integer          not null, primary key
#  owner_id    :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  circle_type :string(255)      not null
#

class Circle < ActiveRecord::Base
  validates :owner, presence: true
  
  belongs_to(:owner,
  foreign_key: :owner_id,
  class_name: "User")
  
  has_many(:circle_memberships, #@circle.circle_memberships, @circle.
  foreign_key: :circle_id)
  
  #user through join table circle_memberships
  has_many :circle_members, through: :circle_memberships, source: :friend
  
  has_many :post_shares, foreign_key: :circle_id, class_name: "PostShares"
  
  has_many :shared_posts, through: :post_shares, source: :post
  
end
