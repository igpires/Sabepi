class UsersBackoffice::ClassOccurrencesController < UsersBackofficeController
  before_action :set_class_occurrence, only: [:edit, :update, :destroy]

  def index
    subject_id = current_user.classrooms.find_by(id: params[:id]).subject_id
    @class_occurrences = current_user.classrooms.find_by(id: params[:id]).class_occurrences.order(created_at: :desc)
    @topics = Topic.where(subject_id: subject_id)
  end

  def create
    @class_occurrence = ClassOccurrence.new(params_class_occurrence)
    class_id = @class_occurrence.classroom_id
    if occurrence_on_day?(class_id)
      redirect_to users_backoffice_class_occurrences_path(id: class_id), alert: "Voce nao pode criar mais de uma aula no dia!"
    elsif @class_occurrence.save()
      redirect_to users_backoffice_class_occurrences_path(id: class_id), notice: "Aula criada com sucesso!"
    else
      redirect_to users_backoffice_class_occurrences_path(id: class_id), alert: "Erro ao criar sala!"
    end
  end

  private

  def params_class_occurrence
    params.require(:class_occurrence).permit(:classroom_id, :question_id)
  end

  def occurrence_on_day?(classroom_id)    
    last_occurrence = ClassOccurrence.where(classroom: classroom_id).last
    if last_occurrence.present?
      last_date = last_occurrence.created_at.strftime("%d-%m-%y")  
      date_now = Time.now.strftime("%d-%m-%y")

      last_date.eql? date_now
    else
      false
    end
  end

end
