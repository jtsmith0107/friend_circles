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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
