class Question < ApplicationRecord
  belongs_to :topic, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  has_many :answer_occurrences
end
