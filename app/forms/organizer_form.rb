class OrganizerForm < ApplicationForm
  self.main_model = :organizer

  attributes :email, :first_name, :patronymic, :last_name, :birth_date, :phone, :social_link, :municipality, :locality, :home_adress, :experience, :reason, :activity_line, :deals, :pluses, :minuses, :type
end
