class AdminsBackoffice::UsersController < AdminsBackofficeController
  def index
    @users = User.all
  end
end
