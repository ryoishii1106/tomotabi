class Api::V1::UsersController < ApiController
  before_action :set_, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: '404 not found' }, status: 404
  end

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
