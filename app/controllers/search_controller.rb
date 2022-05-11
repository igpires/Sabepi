class SearchController < ApplicationController
  
  def subjects_by_course
    @subjects = Subject.where(course_id: params[:id])
    render json: @subjects
  end

  def topics_by_subject
    @topics = Topic.where(subject_id: params[:id])
    render json: @topics
  end
  
end
