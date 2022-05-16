class SearchController < ApplicationController
  
  def subjects_by_course
    @subjects = Subject.where(course_id: params[:id])
    unless @subjects.empty?
      render json: @subjects, status: 200
    else
      render json: {
        error: 'not found',
        status: 404
      }, status: 404
    end
  end

  def topics_by_subject
    @topics = Topic.where(subject_id: params[:id])
    unless @topics.empty?
      render json: @topics, status: 200
    else
      render json: {
        error: 'not found',
        status: 404
      }, status: 404
    end
  end
  
  def questions_by_topic
    @questions = Question.where(topic_id: params[:id]) 
    unless @questions.empty?
      render json: @questions, status: 200
    else
      render json: {
        error: 'not found',
        status: 404
      }, status: 404
    end
  end

end
