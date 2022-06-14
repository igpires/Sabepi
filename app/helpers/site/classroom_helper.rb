module Site::ClassroomHelper
    def already_answered_last_question?(class_occurrence, student)
      last_question_id = class_occurrence.question.id
      student_id = student['id']

      class_occurrence.answer_occurrences.where(student_id: student_id, question_id: last_question_id).present?
    end
end
