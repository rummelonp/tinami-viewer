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
  end

  def logout
  end

end
