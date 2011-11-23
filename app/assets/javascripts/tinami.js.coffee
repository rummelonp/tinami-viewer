class TINAMI
  constructor: () ->
    tinami = this
    d = $(document)
    d.bind('mobileinit', tinami.mobileinit)
    d.bind('pageshow', () ->
      $('.hfeed .content .thumbnail img').
        each(tinami.setImagePosition).
        bind('load', tinami.setImagePosition))
    remote_actions = $('a[data-remote]')
    for eventName, callback of tinami.defaultHandler
      remote_actions.live('ajax:' + eventName, callback)
    user_actions = $('.support a, .collection-add a, .bookmark-add a')
    for eventName, callback of tinami.actionHandler
      user_actions.live('ajax:' + eventName, callback)
    comments_actions = $('.comments-load a')
    for eventName, callback of tinami.commentsHandler
      comments_actions.live('ajax:' + eventName, callback)

  mobileinit: () ->
    $m = $.mobile
    $m.loadingMessage = '読み込み中...'
    $m.pageLoadErrorMessage = '読み込みに失敗しました'

  setImagePosition: () ->
    img = $(this)
    height = img.height()
    width = img.width()
    return if height == 0 || width == 0
    img.css {
      position: 'relative',
      top: ((130 - height) / 2) + 'px',
      left: ((130 - width) / 2) + 'px'
    }

  defaultHandler:
    beforeSend: (event) ->
      $.mobile.showPageLoadingMsg()
    success: (event, data) ->
      $.mobile.hidePageLoadingMsg()
    complete: (event, data) ->
      $.mobile.hidePageLoadingMsg()
    error: (event, data) ->
      $.mobile.hidePageLoadingMsg()
      alert(data.responseText)

  actionHandler:
    success: (event, data) ->
      self = $(this)
      self.fadeOut 'fast', () ->
        self.remove()

  commentsHandler:
    success: (event, data) ->
      self = $(this)
      self.fadeOut 'fast', () ->
        self.remove()
        return unless $.isPlainObject(data)
        comments = $('.comments').hide()
        data = data.comment
        if $.isArray(data)
          comments.append('<div class="comment">' + d + '</div>') for d in data
        else
          comments.append('<div class="comment">' + data + '</div>')
        comments.fadeIn 'fast'


new TINAMI(jQuery)
