class ClassOccurrence < ApplicationRecord
  belongs_to :classroom
  belongs_to :question
  has_many :answer_occurrences
end
