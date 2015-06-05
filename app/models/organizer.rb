class Organizer < User
  validates :first_name, presence: true,
                         human_name: true
  validates :patronymic, presence: true,
                         human_name: true
  validates :last_name, presence: true,
                        human_name: true
  validates :phone, presence: true,
                    phone: true
  validates :birth_date, presence: true
  validates :social_link, presence: true
  validates :home_adress, presence: true
  validates :experience, presence: true
  validates :reason, presence: true
  validates :activity_line, presence: true
  validates :deals, presence: true
  validates :pluses, presence: true
  validates :minuses, presence: true
  validates :accept_agreement, presence: true

  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first
  enumerize :locality, in: Localities.list, default: Localities.list.first

  include OrganizerScopes

  state_machine initial: :unviewed do
    state :unviewed
    state :confirmed
    state :banned
  end
end
