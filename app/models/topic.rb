class Topic < ActiveRecord::Base
  acts_as_commentable
  belongs_to :user

  validates :title, presence: true
  validates_presence_of :user
end
