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

require 'spec_helper'

describe Topic do
  let!(:user) { create_user }
  context '正しいデータを入れた場合' do
    subject { FactoryGirl.build(:topic, user: user) }
    its(:title) { should == '今後について' }
    its(:content) { should == 'どのように開発していこうか？' }
    it { should be_valid }
    its(:save) { should be_true }
  end

  context '必須項目チェック' do
    subject { Topic.new }
    it 'エラー数が正しいこと' do
      subject.should_not be_valid
      subject.should have(1).errors_on(:title)
      subject.should have(1).errors_on(:user)
    end
  end
end
