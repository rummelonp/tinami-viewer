class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
    @client ||= TINAMI.client
  end
end
