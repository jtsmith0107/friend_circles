# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  circle_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PostShares < ActiveRecord::Base
  validates :post, :circle_id, presence: true
  # validates :post_id, uniqueness: { scope: :circle_id }
  
  belongs_to :post
  belongs_to :circle
end
