class LodgeEventsController < ApplicationController
  def index
    @lodge_events = current_lodge.events.page(params[:page])
  end

  def show

  end

  def new
    @lodge_event = current_lodge.events.build
  end

  def create
    @lodge_event = current_lodge.events.build(post_params)
    if @lodge_event.save
      redirect_to lodge_lodge_events_path(@lodge)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def current_lodge
    @lodge ||= Lodge.find(params[:lodge_id])
  end

  def post_params
    params.require(:lodge_event).permit(:name, :description, :schedule)
  end
end