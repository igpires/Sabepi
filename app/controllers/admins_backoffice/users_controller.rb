class AdminsBackoffice::UsersController < AdminsBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save()
      redirect_to admins_backoffice_users_path, notice: "Professor cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to admins_backoffice_users_path, notice: "Professor atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admins_backoffice_users_path, notice: "Professor excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def password_verify
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end



