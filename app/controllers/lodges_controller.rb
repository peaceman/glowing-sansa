class LodgesController < ApplicationController
  def index
    @lodges = Lodge.all
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
    params.require(:lodge).permit(:name, :description, :image, :image_cache, :published, :street, :city, :country)
  end
end
