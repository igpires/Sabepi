class UsersBackoffice::ClassOccurrencesController < UsersBackofficeController
  before_action :set_class_occurrence, only: [:change_question, :show_occurrence]

  def index
    subject_id = current_user.classrooms.find_by(id: params[:classroom_id]).subject_id

    @class_occurrences = current_user.classrooms.find_by(id: params[:classroom_id]).class_occurrences.order(created_at: :desc)
    @topics = Topic.where(subject_id: subject_id)
  end

  def create
    @class_occurrence = ClassOccurrence.new(params_class_occurrence)
    class_id = @class_occurrence.classroom_id
    if occurrence_on_day?(class_id)
      redirect_to users_backoffice_class_occurrences_path(classroom_id: class_id), alert: "Voce nao pode criar mais de uma aula no dia!"
    elsif @class_occurrence.save()
      redirect_to users_backoffice_class_occurrences_path(classroom_id: class_id), notice: "Aula criada com sucesso!"
    else
      redirect_to users_backoffice_class_occurrences_path(classroom_id: class_id), alert: "Erro ao criar sala!"
    end
  end

  def change_question
    class_id = @class_occurrence.classroom_id
    occurrence_id = @class_occurrence.id
    if @class_occurrence.update(params_class_occurrence)
      redirect_to users_backoffice_show_class_occurrence_path(class_id, occurrence_id), notice: "Atualizado com sucesso!"
    else
      redirect_to users_backoffice_show_class_occurrence_path(class_id, occurrence_id), alert: "Erro ao atualizar!"
    end
  end

  def show_occurrence
    subject_id = @class_occurrence.question.topic.subject_id
    @topics = Topic.where(subject_id: subject_id)

    @statistic = statistics_answer_occurrence(@class_occurrence)
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

  def set_class_occurrence
    @class_occurrence =  current_user.classrooms.find_by(id: params[:classroom_id]).class_occurrences.find_by(id: params[:class_occurrence_id])
  end

  def statistics_answer_occurrence(class_occurrence)
    
    question_id = class_occurrence.question_id

    statistics = {
      total_answers: 0,
      total_correct_answers: 0,
      total_incorrect_answers: 0,
      percentage_correct_answers: 0
    }
    answer_occurrences = class_occurrence.answer_occurrences.where(question_id: question_id)
    statistics[:total_answers] = answer_occurrences.count
    class_occurrence.answer_occurrences.where(question_id: question_id).each do  |answer_occurrence|
      if answer_occurrence.answer.is_correct?
        statistics[:total_correct_answers] += 1
      else
        statistics[:total_incorrect_answers] += 1
      end
    end

    if statistics[:total_answers] > 0
      statistics[:percentage_correct_answers] = (statistics[:total_correct_answers] * 100) / statistics[:total_answers]
    end

    statistics
  end

end
