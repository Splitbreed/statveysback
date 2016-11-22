class BusinessesController < ApplicationController
  before_action :set_profile, only: [:create, :index, :destroy, :update]
  before_action :set_business, only: [:destroy, :update]

  def set_business
    if params[:business_id]
      @business = Business.find(params[:business_id])
    end
  end

  def set_profile
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end

  def create
    business = Business.new(business_params)
    business.user_id = @user.id

    if business.save
      render json: {status: 200, message: "Business created"}
    else
      render json: {status: 422, business: business.errors}
    end
  end

  def show
    business = Business.find(params[:id])
    render json: {status: 200, business: business}
  end

  def index
    business = @user.businesses

    render json: {status: 200, businesses: business}
  end

  def destroy
    Business.destroy(params[:id])

    render json: {status: 204}
  end

  def update
    business = Business.find(params[:id])
    if business.update(update_params)
      puts update_params
      render json: {status: 200, business: @business}
    else
      render json: {status: 204, message: @business.errors}
    end
  end

  def all
    allBus = Business.all
    render json: {status: 200, all: allBus}
  end

  private

  def business_params
    params.required(:business).permit(:name, :service)
  end

  def update_params
    params.required(:business).permit(:overall_score)
  end
end
