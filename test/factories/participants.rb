FactoryGirl.define do
  factory :participant do
    email
    first_name { generate :name }
    patronymic { generate :name }
    last_name { generate :name }
    birth_date { generate :date }
    home_adress { generate :string }
    social_link { generate :string }
    municipality { Municipalities.list.first }
    locality { Localities.list.first  }
    region { RussiaRegions.name_list.first  }
    experience { generate :string }
    reason { generate :string }
    activity_line { 'another' }
    deals { generate :string }
    pluses { generate :string }
    minuses { generate :string }
    type { 'Participant' }
    state 'unviewed'
    phone { generate :phone }
    accept_agreement true
    school { generate :string }
    organization { generate :string }
    what_you_want { generate :string }
    block { 'massive_volunteering' }
  end
end
