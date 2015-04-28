FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    password_confirmation { password }
  end
end
