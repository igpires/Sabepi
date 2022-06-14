class AnswerOccurrence < ApplicationRecord
  belongs_to :class_occurrence
  belongs_to :answer
  belongs_to :student
  belongs_to :question
end
