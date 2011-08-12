class UserController < ApplicationController
  before_filter :authenticate, except: [:comments]

  def bookmark_contents
    data = client.bookmark_contents(page_params)
    @contents = data.contents
  end

  def watchkeyword_contents
    data = client.watchkeyword_contents(page_params)
    @contents = data.contents
  end

  def friend_recommends
    data = client.friend_recommends(page_params)
    @contents = data.contents
  end

  def collections
    data = client.collections(page_params)
    @contents = data.contents
  end

  def bookmarks
    data = client.bookmarks
    @creators = data.creators
  end

  def support
    handle_remote do
      client.support(params[:cont_id])
      render text: nil
    end
  end

  def add_collection
    handle_remote do
      client.add_collection(params[:cont_id])
      render text: nil
    end
  end

  def add_bookmark
    handle_remote do
      client.add_bookmark(params[:prof_id])
      render text: nil
    end
  end

  def comments
  end

  def add_comment
  end

  def remove_comment
  end

  private
  def authenticate
    redirect_to :login unless authenticated?
  end

  def handle_remote
    begin
      yield
    rescue TINAMI::Error => e
      logger.info e
      render text: e.message, status: 400
    end
  end

end
