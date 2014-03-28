# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  authentication_token   :string(255)
#  role_id                :integer
#  deleted_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         # :registerable,
         :recoverable,
         :trackable,
         :validatable,
         :token_authenticatable
  belongs_to :role

  validates :email, presence: true
  validates_format_of :email, :with  => Devise.email_regexp, if: :email_changed?
  validates :password, presence: true, confirmation: true, length: {in: Devise.password_length}, on: :create
  validates :password, confirmation: true, length: {in: Devise.password_length}, allow_blank: true, on: :update
  validates_presence_of :role

  acts_as_paranoid
  # validates_as_paranoid
  # validates_uniqueness_of_without_deleted :email

end
