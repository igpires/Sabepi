class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :get_topics, only: [:edit, :new]

  def index
    @questions = Question.includes(:topic => :subject)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save()
      redirect_to admins_backoffice_questions_path, notice: "questoes cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path, notice: "questoes atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path, notice: "questoes excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def params_question
    params.require(:question).permit(:description, :topic_id, 
                                      answers_attributes:[
                                        :id, :description, :is_correct, :done, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_topics
    @topics = Topic.all
  end
end
