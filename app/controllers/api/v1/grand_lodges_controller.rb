class Api::V1::GrandLodgesController < ApiController
  def index
    @grand_lodges = GrandLodge.all
  end

  def show
    @grand_lodge = GrandLodge.find(params[:id])
  end
end