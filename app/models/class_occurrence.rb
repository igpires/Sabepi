class ClassOccurrence < ApplicationRecord
  belongs_to :classroom
  belongs_to :question
end
