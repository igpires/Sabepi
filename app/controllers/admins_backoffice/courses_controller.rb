class AdminsBackoffice::CoursesController < AdminsBackofficeController
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.includes(:subjects)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params_course)
    if @course.save()
      redirect_to admins_backoffice_courses_path, notice: "curso cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @course.update(params_course)
      redirect_to admins_backoffice_courses_path, notice: "curso atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admins_backoffice_courses_path, notice: "curso excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def params_course
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
