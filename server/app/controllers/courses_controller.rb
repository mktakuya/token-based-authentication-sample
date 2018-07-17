class CoursesController < ApplicationController
  def index
    @courses = Course.all

    render json: @courses
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }
    end
  end

  def update
  end

  private

  def course_params
    params.permit(
      :name,
      :code,
      :credit,
      :instructor,
      :content
    )
  end
end
