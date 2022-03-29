class UsersBackoffice::SubjectsController < UsersBackofficeController
  def index
    @subjects = Subject.all
  end
end