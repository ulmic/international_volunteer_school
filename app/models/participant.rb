class Participant < User
  validates :email, presence: true
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
  validates :reason, presence: true
  validates :activity_line, presence: true
  validates :accept_agreement, presence: true
  validates :school, presence: true
  validates :organization, presence: true
  validates :what_you_want, presence: true
  validates :block, presence: true

  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first
  enumerize :locality, in: Localities.list, default: Localities.list.first
  enumerize :activity_line, in: [
                                  :assistance_to_people_with_disabilities,
                                  :development_of_voluntary_donation,
                                  :adaptation_of_children_without_parental_care,
                                  :assistance_to_the_poor,
                                  :ecology,
                                  :art_volunteering,
                                  :another
                                ]
  enumerize :block, in: [
                          :help_for_children_with_disabilities,
                          :massive_volunteering
                        ]

  state_machine initial: :unviewed do
    state :unviewed
    state :confirmed
    state :banned
  end
end
