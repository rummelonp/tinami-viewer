# -*- coding: utf-8 -*-
module ApplicationHelper
  module UrlHelper
    def content_url(cont_id)
      url_for(controller: :index, action: :content, cont_id: cont_id)
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

  include UrlHelper
  include Constants
end
