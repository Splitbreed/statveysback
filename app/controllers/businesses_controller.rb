class BusinessesController < ApplicationController
  before_action :set_profile, only: [:create, :index, :destroy]

  def set_profile
    @user = User.find(params[:user_id])
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

  def index
    business = @user.businesses

    render json: {status: 200, businesses: business}
  end

  def destroy
    Business.destroy(params[:id])

    render json: {status: 204}
  end

  private

  def business_params
    params.required(:business).permit(:name, :service)
  end

end
