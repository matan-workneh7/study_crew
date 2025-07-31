class AssistantCoursesController < ApplicationController
  before_action :set_assistant_course, only: [:show, :destroy]
  #before_action :authorize_assistant, only: [:index, :create, :destroy]
  #before_action :authorize_user, only: [:show]

  # GET /assistant_courses
  def index
    @assistant_courses = AssistantCourse.includes(:assistant, :course).all
    render json: @assistant_courses.as_json(include: [:assistant, :course])
  end

  # GET /assistant_courses/:id
  def show
    if @assistant_course.nil?
      render json: { error: 'Assistant course assignment not found.' }, status: :not_found
    else
      render json: @assistant_course.as_json(include: [:assistant, :course])
    end
  end

  # POST /assistant_courses
  def create
    @assistant_course = AssistantCourse.new(assistant_course_params)
    
    # Check if the user is actually an assistant
    assistant = User.find_by(id: params[:assistant_course][:assistant_id])
    unless assistant&.assistant?
      render json: { error: 'User must be an assistant to be assigned to a course.' }, status: :unprocessable_entity
      return
    end

    # Check if assignment already exists
    existing_assignment = AssistantCourse.find_by(
      assistant_id: params[:assistant_course][:assistant_id],
      course_id: params[:assistant_course][:course_id]
    )
    
    if existing_assignment
      render json: { error: 'Assistant is already assigned to this course.' }, status: :unprocessable_entity
      return
    end

    if @assistant_course.save
      render json: @assistant_course.as_json(include: [:assistant, :course]), status: :created
    else
      render json: { errors: @assistant_course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /assistant_courses/:id
  def destroy
    if @assistant_course.nil?
      render json: { error: 'Assistant course assignment not found.' }, status: :not_found
    else
      @assistant_course.destroy
      render json: { message: 'Assistant course assignment was successfully removed.' }
    end
  end

  # GET /assistant_courses/by_assistant/:assistant_id
  def by_assistant
    assistant = User.find_by(id: params[:assistant_id])
    if assistant.nil?
      render json: { error: 'Assistant not found.' }, status: :not_found
    else
      @assistant_courses = AssistantCourse.includes(:course).where(assistant_id: params[:assistant_id])
      render json: @assistant_courses.as_json(include: [:course])
    end
  end

  # GET /assistant_courses/by_course/:course_id
  def by_course
    course = Course.find_by(id: params[:course_id])
    if course.nil?
      render json: { error: 'Course not found.' }, status: :not_found
    else
      @assistant_courses = AssistantCourse.includes(:assistant).where(course_id: params[:course_id])
      render json: @assistant_courses.as_json(include: [:assistant])
    end
  end

  private

  def set_assistant_course
    @assistant_course = AssistantCourse.find_by(id: params[:id])
  end

  def assistant_course_params
    params.require(:assistant_course).permit(:assistant_id, :course_id)
  end

  def authorize_assistant
    unless current_user&.assistant?
      render json: { error: 'Access denied. Only assistants can perform this action.' }, status: :forbidden
    end
  end

  def authorize_user
    unless current_user&.assistant? || current_user&.user?
      render json: { error: 'Access denied. You need proper authorization to perform this action.' }, status: :forbidden
    end
  end
end 