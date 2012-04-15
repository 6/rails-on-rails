# == Schema Information
#
# Table name: users
#
#  id                           :integer         not null, primary key
#  email                        :string(255)
#  crypted_password             :string(255)
#  salt                         :string(255)
#  created_at                   :datetime        not null
#  updated_at                   :datetime        not null
#  remember_me_token            :string(255)
#  remember_me_token_expires_at :datetime
#  full_name                    :string(255)
#  failed_logins_count          :integer         default(0)
#  lock_expires_at              :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
