class Web::Admin::OrganizersController < Web::Admin::ApplicationController
  def index
    @organizers = Organizer.all.decorate
  end

  def new
    @organizer_form = OrganizerForm.new_with_model
  end

  def create
    @organizer_form = OrganizerForm.new_with_model
    @organizer_form.submit params[:organizer]
    if @organizer_form.save
      redirect_to admin_organizers_path
    else
      render action: :new
    end
  end

  def edit
    @organizer_form = OrganizerForm.find_with_model params[:id]
  end

  def update
    @organizer_form = OrganizerForm.find_with_model params[:id]
    @organizer_form.submit params[:organizer]
    if @organizer_form.save
      redirect_to admin_organizers_path
    else
      render action: :edit
    end
  end

  def destroy
    @organizer = Organizer.find params[:id]
    @organizer.destroy
    redirect_to admin_organizers_path
  end
end
