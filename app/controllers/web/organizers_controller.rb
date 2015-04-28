class Web::OrganizersController < Web::ApplicationController
  def new
    @organizer = OrganizerForm.new_with_model
  end

  def create
    @organizer = OrganizerForm.new_with_model
    @organizer.submit params[:organizer]
    if @organizer.save
      redirect_to root_path, flash: :success
    else
      render :new
    end
  end
end
