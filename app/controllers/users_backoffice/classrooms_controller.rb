class UsersBackoffice::ClassroomsController < UsersBackofficeController
  before_action :set_classroom, only: [:edit, :update, :destroy, :switch_classroom]
  before_action :find_classrooms, only: [:index]
  before_action :get_params_classroom, only: [:edit, :new]

  def index
    unless @classrooms.blank?
      @classrooms
    else
      redirect_to new_users_backoffice_classroom_path , notice: "voce nao possui salas"
    end
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(params_classroom)
    if @classroom.save()
      redirect_to users_backoffice_classrooms_path, notice: "curso cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @classroom.update(params_classroom)
      redirect_to users_backoffice_classrooms_path, notice: "curso atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @classroom.destroy
      redirect_to users_backoffice_classrooms_path, notice: "curso excluido com sucesso!"
    else
      render :index
    end
  end

  def switch_classroom
    if @classroom != nil
      @classroom.is_active = !@classroom.is_active 
      @classroom.save
      render json: {
        status: 200
      }, status: 200
    else
      render json: {
        error: 'not found',
        status: 404
      }, status: 404
    end
  end
  
  private

  def params_classroom
    params.require(:classroom).permit(:name, :user_id, :subject_id)
  end

  def set_classroom
    begin
      @classroom = current_user.classrooms.find(params[:id])
    rescue ActiveRecord::RecordNotFound
     @classroom = nil
    end

  end

  def find_classrooms
      @classrooms = Classroom.includes(:subject).where(user_id: current_user.id).order(is_active: :desc) 
  end

  def get_params_classroom
    @topics = Topic.all
    @courses = Course.all
    @subjects = Subject.all
  end

end
