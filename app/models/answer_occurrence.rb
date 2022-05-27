class AnswerOccurrence < ApplicationRecord
  belongs_to :class_occurrence
  belongs_to :answers
  belongs_to :student
  belongs_to :question
end
