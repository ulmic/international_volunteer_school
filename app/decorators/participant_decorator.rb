class ParticipantDecorator < UserDecorator
  delegate_all

  def place
    if region == 'Ульяновская область'
      "#{object.municipality} #{object.locality}"
    else
      object.region
    end
  end
end
