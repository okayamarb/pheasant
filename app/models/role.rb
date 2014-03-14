# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  memo       :text
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end
