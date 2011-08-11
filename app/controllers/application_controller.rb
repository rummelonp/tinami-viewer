class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
    @client ||= TINAMI.client
  end

  def page_params
    {'page' => 1, 'perpage' => 40}.merge(params)
  end
end
