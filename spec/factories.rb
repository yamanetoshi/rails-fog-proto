FactoryGirl.define do
  factory :user do
    id 1
    email    "michael@example.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"
  end

  factory :conn do
    id 1
    user_id 1
  end
end
