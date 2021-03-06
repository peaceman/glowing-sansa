class Admin::LodgeEventsController < AdminController
  def index
    @lodge_events = current_lodge.events.page(params[:page])
  end

  def show
    @lodge_event = current_lodge.events.find(params[:id])
  end

  def new
    @lodge_event = current_lodge.events.build
  end

  def create
    @lodge_event = current_lodge.events.build(post_params)
    if @lodge_event.save
      redirect_to admin_lodge_lodge_events_path(@lodge)
    else
      render 'new'
    end
  end

  def edit
    @lodge_event = current_lodge.events.find(params[:id])
  end

  def update
    @lodge_event = current_lodge.events.find(params[:id])
    if @lodge_event.update(post_params)
      redirect_to admin_lodge_lodge_events_path(@lodge)
    else
      render 'edit'
    end
  end

  def destroy
    @lodge_event = current_lodge.events.find(params[:id])
    @lodge_event.destroy

    redirect_to admin_lodge_lodge_events_path(@lodge)
  end

  private
  def current_lodge
    @lodge ||= Lodge.find(params[:lodge_id])
  end

  def post_params
    params.require(:lodge_event).permit(:lodge_event_category_id, :name, :description, :start_time, :recurrence_rule)
  end
end