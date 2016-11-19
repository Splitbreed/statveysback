class UsersController < ApplicationController
  # before_action :authenticate, except: [:login, :create, :index]
  before_action :set_profile, only: [:update]

  def set_profile
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 200, message: "Registration Succesful"}
    else
      render json: {status: 422, user: user.errors}
    end
  end

  def index
    users = User.all

    render json: {status: 200, users: users}
  end

  def show
    user = User.find(params[:id])

    render json: {status: 200, user: user}
  end

  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.username)
      render json: {status: 201, token: token, user: user}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def update
    if @user.update(pass_params)
      render json: {status: 200, user: @user}
    else
      render json: {status: 204, message: @user.errors}
    end
  end


  private


  def token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
    {
      exp: (Time.now + 2.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
  end

  def user_params
    params.required(:user).permit(:username, :password, :email_address)
  end

  def pass_params
    params.required(:pass).permit(:password, :email_address)
  end

end
