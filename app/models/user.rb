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
#

class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  
  attr_accessible :full_name, :email, :password, :password_confirmation, :authentications_attributes
  
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates_presence_of :full_name
end
