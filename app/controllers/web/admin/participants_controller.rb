class Web::Admin::ParticipantsController < Web::Admin::ApplicationController
  def index
    @participants = Participant.all.decorate
  end

  def new
    @participant_form = ParticipantForm.new_with_model
  end

  def create
    @participant_form = ParticipantForm.new_with_model
    @participant_form.submit params[:participant]
    if @participant_form.save
      redirect_to admin_participants_path
    else
      render action: :new
    end
  end

  def edit
    @participant_form = ParticipantForm.find_with_model params[:id]
  end

  def update
    @participant_form = ParticipantForm.find_with_model params[:id]
    @participant_form.submit params[:participant]
    if @participant_form.save
      redirect_to admin_participants_path
    else
      render action: :edit
    end
  end

  def destroy
    @participant = Participant.find params[:id]
    @participant.destroy
    redirect_to admin_participants_path
  end
end
