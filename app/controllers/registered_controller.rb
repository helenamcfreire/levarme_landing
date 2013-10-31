class RegisteredController < ApplicationController

  def new
    @registered = Registered.new
  end

  def create

    geolocation = open('http://freegeoip.net/json/'+public_ip).read

    @registered = Registered.new(params[:registered])
    @registered.location = JSON.parse(geolocation)['country_name']

    if @registered.save
      flash[:success] = 'You have been subscribed!'
    else
      flash[:error] = 'Email is invalid. Please, enter valid email.'
    end
    redirect_to '/registered/new'

  end

end