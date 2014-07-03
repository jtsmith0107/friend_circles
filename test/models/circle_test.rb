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

require 'test_helper'

class CircleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
