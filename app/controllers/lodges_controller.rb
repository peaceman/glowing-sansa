class LodgesController < ApplicationController
  def index
    @lodges = Lodge.page params[:page]
  end

  def create
    @lodge = Lodge.new(post_params)
    if @lodge.save
      redirect_to @lodge
    else
      render 'new'
    end
  end

  def new
    @lodge = Lodge.new
  end

  def edit
    @lodge = Lodge.find(params[:id])
  end

  def show
    @lodge = Lodge.find(params[:id])
  end

  def update
    @lodge = Lodge.find(params[:id])
    if @lodge.update(post_params)
      redirect_to @lodge
    else
      render 'edit'
    end
  end

  def destroy
    @lodge = Lodge.find(params[:id])
    @lodge.destroy
    redirect_to lodges_path
  end

  private
  def post_params
    params.require(:lodge).permit(:name, :registration_number, :grand_lodge_id, :description, :image, :image_cache, :site_url, :published, :street, :street_nr, :city, :country, :phone_number)
  end
end
