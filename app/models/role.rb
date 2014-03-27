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
  validates_format_of :code, with: /\A[A-Za-z]+[0-9A-Za-z_\-]+\z/, message: '先頭は半角英字、以降半角英数_-のみでお願いします'
end
