class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :email

  def email
    "admin@kevinmcphillips.ca"
  end

end
