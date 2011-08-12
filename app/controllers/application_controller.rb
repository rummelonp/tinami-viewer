class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper::Common

  def client
    return @client if @client
    if authenticated?
      @client = TINAMI.client(auth_key: session[:auth_key])
    else
      @client = TINAMI.client
    end

    @client
  end

  def page_params
    {'page' => 1, 'perpage' => 40}.merge(params)
  end
end
