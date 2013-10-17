# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resavation do
    operation "MyString"
    hour "12"
    min "00"
    vmid 1
    conn_id 1
  end
end
