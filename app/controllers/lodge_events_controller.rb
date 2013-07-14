class LodgeEventsController < ApplicationController
  def index
    @lodge_events = current_lodge.events.page(params[:page])
  end

  def show

  end

  def new

  end

  def create

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
end