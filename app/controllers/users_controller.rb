class UsersController < ApplicationController
  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.nil?
      @user = User.new(params[:user])
      @user.save
    elsif @user.password == params[:user][:password]

    end
  end

  def new

  end

  def destroy
  end
end
