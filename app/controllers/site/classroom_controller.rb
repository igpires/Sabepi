class Site::ClassroomController < SiteController
  before_action check_student
  def index
  end

  def check_student
    @student = Student.find(where: matricula: paarams[:matricula])
    if student.nil? 
      Student.create()
    else {
      classroom = Classroom.find(where: codigo: params[code])
      if classroom.nil? 
        render error: forbidden
      else 
        render 

    }
  end
end
