class CoursesController < ApplicationController
  before_action :authenticate!, only: [ :create, :update ]

  def index
    @courses = Course.all

    render json: @courses
  end

  def show
    @course = Course.find(params[:id])

    render json: @course
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course
    else
      render json: { errors: @course.errors.full_messages, status: 400 }
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }, status: 400
    end
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
