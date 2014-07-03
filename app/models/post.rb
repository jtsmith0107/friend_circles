# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  title      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :post_shares, foreign_key: :post_id, class_name: "PostShares"
  
  has_many :shared_circles, through: :post_shares, source: :circle
  
end
