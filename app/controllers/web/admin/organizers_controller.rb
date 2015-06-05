class Web::Admin::OrganizersController < Web::Admin::ApplicationController
  def index
    @organizers = Organizer.confirmed

    respond_to do |format|
      format.html { @organizers.decorate }
      format.xls { send_data(@organizers.to_xls(only: [ :email, :first_name, :patronymic, :last_name, :birth_date, :phone, :social_link, :municipality, :locality, :home_adress, :experience, :reason, :activity_line, :deals, :pluses, :minuses ])) }
    end
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
