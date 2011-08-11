class TINAMI
  constructor: () ->
    tinami = this
    $(document).bind('mobileinit', tinami.mobileinit)
    $(document).bind('pageshow', () ->
      $('.hfeed .content .thumbnail img').
        each(tinami.setImagePosition).
        bind('load', tinami.setImagePosition))

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

new TINAMI(jQuery)
