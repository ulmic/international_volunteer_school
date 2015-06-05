class ParticipantForm < ApplicationForm
  self.main_model = :participant

  attributes :email, :first_name, :patronymic, :last_name, :phone, :birth_date, :social_link, :home_adress, :reason, :activity_line, :accept_agreement, :school, :organization, :what_you_want, :block, required: true
  attributes :another_line
end
