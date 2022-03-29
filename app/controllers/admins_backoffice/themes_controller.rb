class AdminsBackoffice::ThemesController < AdminsBackofficeController
  before_action :set_theme, only: [:edit, :update, :destroy]
  before_action :get_subjects, only: [:new, :edit,]

  def index
    @themes = Theme.includes(:subject)
  end
  
  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(params_theme)
    if @theme.save()
      redirect_to admins_backoffice_themes_path, notice: "Disciplina cadastrada com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @theme.update(params_theme)
      redirect_to admins_backoffice_themes_path, notice: "Disciplina atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @theme.destroy
      redirect_to admins_backoffice_themes_path, notice: "Disciplina excluida com sucesso!"
    else
      render :index
    end
  end

  private

  def params_theme
    params.require(:theme).permit(:description, :subject_id)
  end

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def get_subjects
    @subjects = Subject.all
  end

end
  