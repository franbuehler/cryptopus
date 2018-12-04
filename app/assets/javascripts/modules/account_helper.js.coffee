# Copyright (c) 2008-2018, Puzzle ITC GmbH.
# This file is part of Cryptopus and licensed under
# the Affero General Public License version 3 or later.
# See the COPYING file at the top-level directory or at
# https://github.com/puzzle/cryptopus.

app = window.App ||= {}

class app.AccountHelper

  @showCopyMessage: (e, name) ->
    parent = $(e.target.closest(name)).parent()
    if $(parent).hasClass('result-password select-click')
      message = '<p class="copied">Password copied!</p>'
      div = '.result-password'
    else
      message = '<p class="copied">Username copied!</p>'
      div = '.result-username'
    $(message).appendTo div
    copyMessage = parent.find($('.copied'))
    copyMessage.fadeIn('fast')
    copyMessage.css('top', '32px')
    setTimeout (->
      copyMessage.fadeOut('fast')
      copyMessage.remove()
      return
    ), 2000
