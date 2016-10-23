FactoryGirl.define do
  factory :receiver do
    title "Bring Me The Horizon"
    description "Awsome band article"
    association :user
  end
end
