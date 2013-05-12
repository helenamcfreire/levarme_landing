class RegisteredController < ApplicationController


  def new
    @registered = Registered.new
  end

  def create
    @registered = Registered.new(params[:registered])
    if @registered.save
      flash[:success] = 'You have been subscribed!'
    else
      flash[:error] = 'Email is invalid. Please, enter valid email.'
    end
    redirect_to '/registered/new'
  end

end