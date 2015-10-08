class SessionsController < ApplicationController
  def new
    @errors ||= flash['errors'] || []
  end

  def create
  end

  def destroy
  end
end
