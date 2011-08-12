class TINAMI
  constructor: () ->
    tinami = this
    $(document).bind('mobileinit', tinami.mobileinit)
    $(document).bind('pageshow', () ->
      $('.hfeed .content .thumbnail img').
        each(tinami.setImagePosition).
        bind('load', tinami.setImagePosition))
    $(document).ready () ->
      remote_actions = $('a[data-remote]')
      user_actions = $('.support a, .collection-add a, .bookmark-add a')
      remote_actions.bind('ajax:' + eventName, callback) for eventName, callback of tinami.defaultHandler
      user_actions.bind('ajax:' + eventName, callback) for eventName, callback of tinami.actionHandler

  mobileinit: () ->
    $m = $.mobile
    $m.ajaxEnabled = false
    $m.hashListeningEnabled = false
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
      $.mobile.pageLoading()
    success: (event, data) ->
      $.mobile.pageLoading(true)
    complete: (event, data) ->
      $.mobile.pageLoading(true)
    error: (event, data) ->
      $.mobile.pageLoading(true)
      alert(data.responseText)

  actionHandler:
    success: (event, data) ->
      $(this).remove()

new TINAMI(jQuery)
