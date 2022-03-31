class Topic < ApplicationRecord
  belongs_to :subjects
  has_many :questions
end
