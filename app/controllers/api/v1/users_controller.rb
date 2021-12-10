class Api::V1::UsersController < ApiController
  before_action :set_user, only: [:show]

  rescue_from Exception, with: :render_status500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status404

  def index
    users = User.select(:id, :email, :name, :deleted_at, :created_at, :updated_at)
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:email, :password, :accepted, :name, :self_introduction, :avatar)
  end

  def render_status404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status500(exception)
    render json: { errors: [exception] }, status: 500
  end
end
