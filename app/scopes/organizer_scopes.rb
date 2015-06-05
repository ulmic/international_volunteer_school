module OrganizerScopes
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :confirmed, -> { where state: :confirmed }
    scope :banned, -> { where state: :banned }
    scope :unviewed, -> { where state: :unviewed }
  end
end
