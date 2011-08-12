class UserController < ApplicationController
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
  end

  def add_collection
  end

  def add_bookmark
  end

  def comments
  end

  def add_comment
  end

  def remove_comment
  end

end
