class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]
  before_action :get_themes, only: [:show]
  
  def show
  end

  def index
    @subjects = Subject.all
  end
  
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save()
      redirect_to admins_backoffice_subjects_path, notice: "Disciplina cadastrada com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: "Disciplina atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Disciplina excluida com sucesso!"
    else
      render :index
    end
  end
  
  def show_themes
    :get_themes
  end

  private

  def params_subject
    params.require(:subject).permit(:description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
  
  def get_themes
    @themes = Theme.where("subject_id = ?", params[:id])
  end

end
  