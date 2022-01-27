class ApplicationController < ActionController::API

  attr_reader :current_user
  respond_to :json

end
