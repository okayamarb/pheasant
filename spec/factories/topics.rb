# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "今後について"
    content "どのように開発していこうか？"
  end
  factory :topic_seq, parent: :topic do
    sequence(:title) {|n| "タイトル#{n}"}
    content "本文です"
  end
end
