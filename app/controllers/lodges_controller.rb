class LodgesController < ApplicationController
  def index
    @lodges = Lodge.all
  end

  def create
    @lodge = Lodge.new(post_params)
    @lodge.save
    redirect_to @lodge
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
    @lodge.update(post_params)
    redirect_to @lodge
  end

  def destroy
    @lodge = Lodge.find(params[:id])
    @lodge.destroy
    redirect_to lodges_path
  end

  private
  def post_params
    params.require(:lodge).permit(:name, :description, :image, :image_cache, :published)
  end
end
