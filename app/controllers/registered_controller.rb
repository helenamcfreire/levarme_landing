class RegisteredController < ApplicationController


  def new
    @registered = Registered.new
  end

  def create
    @registered = Registered.new(params[:registered])
    @registered.save
    redirect_to '/registered/new'
  end

end