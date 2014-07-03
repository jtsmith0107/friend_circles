# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :post, :url, presence: true
  belongs_to :post
end
