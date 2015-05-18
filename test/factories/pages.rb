FactoryGirl.define do
  factory :page do
    title { generate :string }
    body { generate :string }
    slug { Page.count == 0 ? :about : generate(:string) }
  end
end
