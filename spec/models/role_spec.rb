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

require 'spec_helper'

describe Role do
  context '正しいデータを入れた場合' do
    subject { FactoryGirl.build(:role) }
    its(:name) { should == '管理者' }
    its(:code) { should == 'admin' }
    its(:memo) { should == 'メモ' }
    it { should be_valid }
    its(:save) { should be_true}
  end
  context "重複チェック" do
    before do
      FactoryGirl.create(:role)
    end
    subject { FactoryGirl.build(:role) }
    it "重複エラーが発生すること" do
      subject.should_not be_valid
      subject.should have(1).errors_on(:name)
      subject.should have(1).errors_on(:code)
    end
  end
end
