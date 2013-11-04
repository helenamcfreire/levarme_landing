require 'open-uri'

class RegisteredController < ApplicationController

  def new
    @registered = Registered.new
  end

  def create



    @registered = Registered.new(params[:registered])
    @registered.location = user_country

    if @registered.save
      flash[:success] = I18n.t :success
    else
      flash[:error] = I18n.t :error
    end
    redirect_to root_url

  end

end