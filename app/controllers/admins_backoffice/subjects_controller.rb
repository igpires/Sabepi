class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]
  before_action :get_courses, only: [:edit, :new]

  def index
    @subjects = Subject.includes(:course)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save()
      redirect_to admins_backoffice_subjects_path, notice: "disciplina cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: "disciplina atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "disciplina excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def params_subject
    params.require(:subject).permit(:name, :course)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
  
  def get_courses
    @courses = Course.all
  end
end
