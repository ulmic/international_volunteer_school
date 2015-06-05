class Web::ParticipantsController < Web::ApplicationController
  def new
    @participant = ParticipantForm.new_with_model
  end

  def create
    @participant = ParticipantForm.new_with_model
    @participant.submit params[:participant]
    if @participant.save
      redirect_to root_path, flash: :success
    else
      render :new
    end
  end
end
