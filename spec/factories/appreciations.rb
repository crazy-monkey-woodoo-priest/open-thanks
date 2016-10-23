FactoryGirl.define do
  factory :appreciation do
    association :user
    association :receiver
  end
end
