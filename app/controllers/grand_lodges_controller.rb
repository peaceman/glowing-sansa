class GrandLodgesController < ApplicationController
  def index
    @grand_lodges = GrandLodge.page(params[:page])
  end

  def show
    @grand_lodge = GrandLodge.find(params[:id])
  end

  def new
    @grand_lodge = GrandLodge.new
  end

  def create
    @grand_lodge = GrandLodge.new(post_params)
    if @grand_lodge.save
      redirect_to @grand_lodge
    else
      render 'new'
    end
  end

  def edit
    @grand_lodge = GrandLodge.find(params[:id])
  end

  def update
    @grand_lodge = GrandLodge.find(params[:id])
    if @grand_lodge.update(post_params)
      redirect_to grand_lodges_path
    else
      render 'edit'
    end
  end

  def destroy
    @grand_lodge = GrandLodge.find(params[:id])
    @grand_lodge.destroy

    redirect_to grand_lodges_path
  end

  private
  def post_params
    require(:grand_lodge).permit(:name)
  end
end