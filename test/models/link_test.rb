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

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
