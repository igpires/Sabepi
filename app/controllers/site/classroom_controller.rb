class Site::ClassroomController < SiteController
  before_action :params_answer_occurrence, only: [:answer_occurrence]
  def index
    @classroom = Classroom.find_by(access_code: params[:code])
  end
  
  def answer_occurrence
    @answer_occurrence = AnswerOccurrence.new(params_answer_occurrence)
    access_code = @answer_occurrence.class_occurrence.classroom.access_code
    if @answer_occurrence.save()
      redirect_to site_classroom_index_path(params[code: access_code])
    else
    end
      
  end
  
  private

  def params_answer_occurrence
    params.require(:answer_occurrence).permit(:class_occurrence_id, 
                                              :question_id,
                                              :answer_id,
                                              :student_id)
  end

end
