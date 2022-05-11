class Subject < ApplicationRecord
  belongs_to :course
  has_many :topics
  has_many :classrooms
end
