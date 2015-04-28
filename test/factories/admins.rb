FactoryGirl.define do
  factory :admin do
    email
    password { generate :string }
    password_confirmation { password }
  end
end
