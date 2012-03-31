# == Schema Information
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  provider   :string(255)     not null
#  uid        :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
