class TINAMI
  constructor: () ->
    tinami = this
    $(document).bind('mobileinit', tinami.mobileinit)

  mobileinit: () ->
    $m = $.mobile
    $m.ajaxEnabled = false
    $m.hashListeningEnabled = false
    $m.loadingMessage = '読み込み中...'
    $m.pageLoadErrorMessage = '読み込みに失敗しました'

new TINAMI(jQuery)
