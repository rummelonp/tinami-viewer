# -*- coding: utf-8 -*-
module ApplicationHelper
  module TagHelper
    def next_button_if_exists(data)
      if data.page && data.pages &&
          data.page.to_i < data.pages.to_i
        ('<div class="next">' + next_button(data) + '</div>').html_safe
      end
    end

    def next_button(data)
      button '次へ', params.merge(page: data.page.to_i + 1)
    end

    def button(text, url, options = {})
      link_to text, url, {'data-role' => 'button', 'data-theme' => 'c'}.merge(options)
    end

    def link_to_view(text, cont_id, options = {})
      link_to_external text, view_url(cont_id), options
    end

    def link_to_profile(text, prof_id, options = {})
      link_to_external text, profile_url(prof_id), options
    end

    def link_to_external(text, url, options = {})
      link_to text, url, {rel: 'external nofollow', target: '_blank'}.merge(options)
    end
  end

  module UrlHelper
    def content_url(cont_id)
      url_for(controller: :index, action: :content, cont_id: cont_id)
    end

    def view_url(cont_id)
      "http://www.tinami.com/view/#{cont_id}"
    end

    def profile_url(prof_id)
      "http://www.tinami.com/creator/profile/#{prof_id}"
    end
  end

  module Common
    def authenticated?
      session[:auth_key].present?
    end
  end

  module Constants
    def rankings
      {
        0 => '総合',
        1 => 'イラスト',
        2 => 'マンガ',
        3 => 'モデル',
        4 => '小説',
        5 => 'コスプレ'
      }
    end

    def categories
      {
        1 => 'イラスト',
        2 => 'マンガ',
        3 => 'モデル',
        4 => '小説',
        5 => 'コスプレ'
      }
    end

    def sort_options
      {
        new:   "新着順",
        score: "支援スコアの多い順",
        value: "支援数の多い順",
        view:  "閲覧数の多い順",
        rand:  "ランダム"
      }
    end
  end

  include TagHelper
  include UrlHelper
  include Common
  include Constants
end
