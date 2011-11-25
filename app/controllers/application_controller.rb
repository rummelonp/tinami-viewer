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

  rescue_from TINAMI::Error do |e|
    logger.info e
    if request.xhr?
      render text: e.message, status: 400
    else
      @notice = e.message
      render template: 'error/index', status: 400
    end
  end
end
