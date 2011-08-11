class IndexController < ApplicationController
  def index
  end

  def ranking
    data = client.ranking(params[:category])
    @contents = data.contents
  end

  def search
  end

  def content
  end

  def auth
  end

  def logout
  end

end
