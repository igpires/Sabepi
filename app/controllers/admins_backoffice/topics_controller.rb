class AdminsBackoffice::TopicsController < AdminsBackofficeController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params_topic)
    if @topic.save()
      redirect_to admins_backoffice_topics_path, notice: "topics cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @topic.update(params_topic)
      redirect_to admins_backoffice_topics_path, notice: "topics atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to admins_backoffice_topics_path, notice: "topics excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def params_topic
    params.require(:topic).permit(:name, :course)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
