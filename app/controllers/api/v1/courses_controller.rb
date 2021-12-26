class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: @courses, each_serializer: CourseSerializer
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :ok
    else
      render json: { errors: @course.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :credit,
                                   tutors_attributes: %i[first_name last_name email])
  end
end
