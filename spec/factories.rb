FactoryGirl.define do
  factory :user do
    id 1
    email    "michael@example.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"
    
    after(:create) do |user|
      create(:conn, user: user)
    end
  end

  factory :conn do
    id 1
    access_key "xxx"
    end_point "http://dummy.example.com/"
    secret_access_key "yyy"
    provider "CloudStack"
    user_id 1
  end
end
