class Web::ParticipantsController < Web::ApplicationController
  def index
    @participants = {}
    @participants[:confirmed] = Participant.confirmed.decorate
    @participants[:unviewed] = Participant.unviewed.decorate
    @participants[:banned] = Participant.banned.decorate
  end

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
