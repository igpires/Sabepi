class Classroom < ApplicationRecord
  # =========== Hook =============
  before_create :set_access_code

  # ========= References =========
  belongs_to :user
  belongs_to :subject
  has_many :class_occurrences
  # ======== Private Method =======
  private

  def set_access_code
    self.access_code = generate_code
  end

  def generate_code
    loop do
      code = SecureRandom.base64(3.5)
      break code unless Classroom.where(access_code: code).exists?
    end
  end
end
