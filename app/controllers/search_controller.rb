class SearchController < ApplicationController
  
  def subjects_by_course
    @subjects = Subject.where(course_id: params[:id])
    render json: @subjects
  end

  def topics_by_subject
    @topics = Topic.where(subject_id: params[:id])
    render json: @topics
  end
  
  def questions_by_topic
    @questions = Question.where(topic_id: params[:id])
    render json: @questions
  end

end
