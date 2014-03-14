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
#

require 'spec_helper'

describe User do
  let!(:role) { FactoryGirl.create(:role) }
  context '正しいデータを入れた場合' do
    subject { FactoryGirl.build(:user, role: role) }
    its(:email) { should == 'admin@email.com' }
    its(:password) { should == 'password' }
    it { should be_valid }
    its(:save) { should be_true }
  end
  context '必須項目チェック' do
    subject {User.new}
    it '必須項目が空欄だとエラーになること' do
      subject.should_not be_valid
      subject.should have(2).errors_on(:email)
      subject.should have(3).errors_on(:password)
      subject.should have(1).errors_on(:role)
    end
  end
end
