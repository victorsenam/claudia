class SessionsController < ApplicationController
  def new
    @errors = flash['errors'] || []
    byebug
  end

  def create
  end

  def destroy
  end
end
