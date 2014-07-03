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

require 'test_helper'

class PostSharesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
