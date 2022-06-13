class Site::ClassroomController < SiteController
  before_action :verify_student
  before_action :params_answer_occurrence, only: [:answer_occurrence]
  def index
    #  session.delete(:student)
    @classroom = Classroom.find_by(access_code: params[:code])

    unless @classroom.present?
      redirect_to site_welcome_index_path,  alert: "Sala inexistente!"
    end


  end
  
  def create_answer_occurrence
    @answer_occurrence = AnswerOccurrence.new(params_answer_occurrence)
    access_code = @answer_occurrence.class_occurrence.classroom.access_code
    if @answer_occurrence.save()
      redirect_to site_classroom_index_path(params[code: access_code])
    else
    end
      
  end

  def create_student
    @student =  Student.find_by(registration_number: params[:registration_number])
    if Student.exists?(registration_number: params[:registration_number])
      session[:student] = @student 
      render json: {student: session[:student], status: 200}, status: 200
    else
      @student = Student.new(registration_number: params[:registration_number], name: params[:name])
      if @student.save()
        session[:student] = @student
        render json: {student: session[:student], status: 201}, status: 201
      else
        render json: {erro: 'could not create'}, status: 500
      end
    end  
  end

  def session_destroy
    session.delete(:student)
  end
  
  private

  def params_answer_occurrence
    params.require(:answer_occurrence).permit(:class_occurrence_id, 
                                              :question_id,
                                              :answer_id,
                                              :student_id)
  end

  def verify_student
    unless session[:student].present?
      session[:open_identification] = true
    else
      session[:open_identification] = false
    end
  end

end
