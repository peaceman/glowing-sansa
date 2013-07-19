class LodgesController < ApplicationController
  def index
    @lodges = current_user.lodges.page params[:page]
  end

  def show
    @lodge = current_user.lodges.find(params[:id])
  end

  def new
    @lodge = current_user.lodges.build
  end

  def create
    @lodge = current_user.lodges.build(post_params)
    if @lodge.save
      redirect_to lodges_path
    else
      render 'new'
    end
  end

  def edit
    @lodge = current_user.lodges.find(params[:id])
  end

  def update
    @lodge = current_user.lodges.find(params[:id])
    if @lodge.update(post_params)
      redirect_to @lodge
    else
      render 'edit'
    end
  end

  def destroy
    @lodge = current_user.lodges.find(params[:id])
    @lodge.destroy
    redirect_to lodges_path
  end

  private
  def post_params
    params.require(:lodge).permit(:name, :registration_number, :grand_lodge_id, :description, :image, :image_cache, :site_url, :published, :street, :street_nr, :city, :country, :phone_number, :contact_mail)
  end
end