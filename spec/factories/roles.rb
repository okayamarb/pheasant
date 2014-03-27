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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "管理者"
    code "admin"
    memo "メモ"
  end
  factory :role_seq, parent: :role do
    sequence(:name) {|n| "一般権限#{n}"}
    sequence(:code) {|n| "normal#{n}"}
  end
end
