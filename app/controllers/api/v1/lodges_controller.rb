class Api::V1::LodgesController < ApiController
  def index
    @lodges = Lodge.all
  end

  def show
    @lodge = Lodge.find(params[:id])
  end
end