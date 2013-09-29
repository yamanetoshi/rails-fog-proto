FactoryGirl.define do
  factory :user do
#    id 1
    email    "michael@example.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"
    admin false
  end

  factory :adminuser, class: User do
#    id 2
    email    "fuga@example.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"
    admin true
  end

  factory :provider do
#    id 1
    name "CloudStack"
  end

  factory :conn do
    id 1
    access_key "xxx"
    end_point "http://dummy.example.com/"
    secret_access_key "yyy"
    name "idcf"
    user { FactoryGirl.create(:user) }
    provider { FactoryGirl.create(:provider) }
  end
end
