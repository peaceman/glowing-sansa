class LodgesController < ApplicationController
  def index
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
  end

  def show
    @lodge = Lodge.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:lodge).permit(:name, :description, :published)
  end
end
