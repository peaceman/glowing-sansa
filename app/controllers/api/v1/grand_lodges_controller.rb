class Api::V1::GrandLodgesController < ApiController
  def index
    @grand_lodges = GrandLodges.all
  end
end