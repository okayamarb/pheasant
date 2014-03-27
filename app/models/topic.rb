# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)      not null
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  acts_as_commentable
  belongs_to :user

  validates :title, presence: true
  validates_presence_of :user
end
