class Admin::UsersController < AdminController
  def index
    @users = User.all.page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end

  private
  def post_params
    params.require(:user).permit(:email, :password, :password_confirm, :is_admin)
  end
end