FactoryGirl.define do
  factory :organizer do
    email
    first_name { generate :name }
    patronymic { generate :name }
    last_name { generate :name }
    birth_date { generate :date }
    home_adress { generate :string }
    social_link { generate :string }
    municipality { Municipalities.list.first }
    locality { Localities.list.first  }
    experience { generate :string }
    reason { generate :string }
    activity_line { generate :string }
    deals { generate :string }
    pluses { generate :string }
    minuses { generate :string }
    type { 'Organizer' }
    state 'unviewed'
    phone { generate :phone }
    accept_agreement true
  end
end
