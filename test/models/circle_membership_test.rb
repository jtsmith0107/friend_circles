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

require 'test_helper'

class CircleMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
