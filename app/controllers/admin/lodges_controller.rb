class Admin::LodgesController < AdminController
  def index
    @lodges = Lodge.page(params[:page]).per(10)
    @grand_lodges = GrandLodge.all
  end

  def search
    search = Lodge.search do
      fulltext params[:query]
      paginate :page => params[:page], :per_page => 10
    end

    @grand_lodges = GrandLodge.all
    @lodges = search.results
    if request.xhr?
      render partial: 'table'
    else
      render 'index'
    end
  end

  def create
    @lodge = Lodge.new(post_params)
    if @lodge.save
      redirect_to [:admin, @lodge]
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
      redirect_to [:admin, @lodge]
    else
      render 'edit'
    end
  end

  def destroy
    @lodge = Lodge.find(params[:id])
    @lodge.destroy
    redirect_to admin_lodges_path
  end

  private
  def post_params
    params.require(:lodge).permit(
        :user_id,
        :name,
        :registration_number,
        :grand_lodge_id,
        :description,
        :image,
        :image_cache,
        :site_url,
        :published,
        :address,
        :address_2,
        :city,
        :country,
        :phone_number,
        :contact_mail
    )
  end
end
