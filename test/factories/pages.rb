FactoryGirl.define do
  factory :page do
    title { generate :string }
    body { generate :string }
    slug { Page.count == 0 ? :about : generate(:string) }

    trait :docs do
      slug :docs
      title :docs
    end
  end
end
