class IndexController < ApplicationController
  def index
  end

  def ranking
    data = client.ranking(params[:category])
    @contents = data.contents
  end

  def search
    query_string = client.send(:keys_params).merge(page_params).map {|k, v|
      if v.is_a? Array
        v.map {|w| "#{k.to_s}[]=#{CGI.escape(w.to_s)}"}.join('&')
      else
        "#{k.to_s}=#{CGI.escape(v.to_s)}"
      end
    }.join('&')
    data = client.get("/content/search?#{query_string}")
    @contents = data.contents
  end

  def content
  end

  def auth
    return unless request.post?
    begin
      auth = TINAMI.auth params[:email], params[:password]
      session[:auth_key] = auth.auth_key
      redirect_to :index
    rescue TINAMI::Error => e
      flash[:notice] = e.message
    end
  end

  def logout
    begin
      TINAMI.logout auth_key: session.delete(:auth_key)
    rescue TINAMI::Error => e
      logger.info e
    end
    redirect_to :index
  end

end
