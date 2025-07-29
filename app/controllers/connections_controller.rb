class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :update, :destroy]

  # GET /connections
  def index
    @connections = Connection.all
    render json: @connections
  end

  # GET /connections/:id
  def show
    if @connection
      render json: @connection
    else
      render json: { error: 'Connection not found.' }, status: :not_found
    end
  end

  # POST /connections
  def create
    @connection = Connection.new(connection_params)
    if @connection.save
      render json: @connection, status: :created
    else
      render json: { errors: @connection.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /connections/:id
  def update
    if @connection&.update(connection_params)
      render json: @connection
    else
      render json: { errors: @connection ? @connection.errors.full_messages : ['Connection not found.'] }, status: :unprocessable_entity
    end
  end

  # DELETE /connections/:id
  def destroy
    if @connection
      @connection.destroy
      render json: { message: 'Connection was successfully deleted.' }
    else
      render json: { error: 'Connection not found.' }, status: :not_found
    end
  end

  private

  def set_connection
    @connection = Connection.find_by(id: params[:id])
  end

  def connection_params
    params.require(:connection).permit(:user_id, :assistant_id, :status, :telegram_username, :course_ids, :problem_description)
  end
end
