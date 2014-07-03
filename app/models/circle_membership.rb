# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  friend_id  :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class CircleMembership < ActiveRecord::Base
  validates :friend_id, :circle_id, presence: true
  validates_uniqueness_of :friend_id, :scope => :circle_id
  
  belongs_to(:friend,
  foreign_key: :friend_id,
  class_name: "User")
  
  belongs_to(:circle,
  foreign_key: :circle_id)
  
end
