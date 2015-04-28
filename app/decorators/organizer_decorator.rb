class OrganizerDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{first_name} #{patronymic} #{last_name}"
  end
end
