((window, document, ProJ, $) ->
  'use strict'

  turbo = window.Turbolinks?
  Turbolinks.supported = no if turbo and navigator.userAgent.match /Firefox\/(\d+)\./


  NAVBAR_HEGHT = 46

  $win = $ window
  $doc = $ document


  aligns = -> ProJ('.aligns').aligns('.align')


  onload = ->
    aligns()
    ProJ
    .lazyload '.mdl-layout__content'
    .ymaps()


  navbar = ->
    $navbar = $ '.navbar'
    $.extend $navbar,
      wrapper: $navbar.find '.wrapper'
      collapse: $navbar.find '.collapse'
    $win.scroll ->
      fix = $navbar.collapse.hasClass('collapsing') or $navbar.collapse.hasClass('in')
      if $win.scrollTop() > NAVBAR_HEGHT
        if not $navbar.hasClass 'navbar-fixed'
          if fix
            $navbar.addClass 'navbar-fixed'
          else
            $navbar.hide ->
              $navbar.wrapper.addClass 'container'
              $navbar
              .addClass 'navbar-fixed'
              .slideDown 200
      else
        if $navbar.hasClass 'navbar-fixed'
          if fix
            $navbar.removeClass 'navbar-fixed'
          else
            $navbar.slideUp 200, ->
              $navbar.wrapper.removeClass 'container'
              $navbar
              .removeClass 'navbar-fixed'
              .fadeIn 500


  ready = ->
    (new WOW offset: 0).init()
    $win.resize aligns
    navbar()
    ProJ('a.active, .active > a').deactive()
    ProJ('[data-ymet]').ymet()
    ProJ('[data-w3c]').w3c()
    $('.dropdown-toggle').dropdown() if turbo
    $('.panel .collapse').on 'shown.bs.collapse', -> ProJ.toobj @parentNode, NAVBAR_HEGHT + 8
    # autosize document.querySelectorAll 'textarea.autosize'
    ProJ
    .base64()
    .mailto()
    .scroll()
    .lightbox()
    $('.preloader').fadeOut 'slow'


  $ ->
    ready()
    $win.load onload


  if turbo
    $doc.on 'turbolinks:visit', ->
      turbo = 'visit'
    $doc.on 'turbolinks:load', ->
      if turbo is 'visit'
        ready()
        onload()
    $doc.on 'turbolinks:before-cache', ->
      $('.wow').css opacity: 0
      ProJ.Lazyload.reset()

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ, jQuery
