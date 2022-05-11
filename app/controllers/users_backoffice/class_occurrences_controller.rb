class UsersBackoffice::ClassOccurrencesController < UsersBackofficeController
  before_action :set_class_occurrence, only: [:edit, :update, :destroy]

  def index
    @class_occurrences = current_user.classrooms.find_by(id: params[:id]).class_occurrences.order(created_at: :desc)
  end

  def new
    @class_occurrence = ClassOccurrence.new
  end

  def create
    @class_occurrence = ClassOccurrence.new(params_class_occurrence)
    if @class_occurrence.save()
      redirect_to admins_backoffice_class_occurrences_path, notice: "curso cadastrado com sucesso!"
    else
      render :edit
    end
  end

  private

  def params_class_occurrence
    params.require(:class_occurrence).permit(:classroom_id, :question_id)
  end

end
