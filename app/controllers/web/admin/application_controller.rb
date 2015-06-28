class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authenticate_admin!
  before_filter :counts
  layout 'web/admin/application'

  private

  def counts
    @organizers_count = Organizer.count
    @participants_count = Participant.count
  end
end
