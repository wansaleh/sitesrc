# String extension: truncate
String::trunc = (n, useWordBoundary) ->
  toLong = @length > n
  s_ = (if toLong then @substr(0, n - 1) else this)
  s_ = (if useWordBoundary and toLong then s_.substr(0, s_.lastIndexOf(" ")) else s_)
  (if toLong then s_ + "&hellip;" else s_)

# String extension: trim
String::trim = ->
  @replace(/^\s+|\s+$/g,"");

# function debouncer
$.debounce = (func, wait, immediate) ->
  ->
    context = this
    args = arguments
    later = ->
      timeout = null
      func.apply context, args  unless immediate

    callNow = immediate and not timeout
    clearTimeout timeout
    timeout = setTimeout(later, wait)
    func.apply context, args  if callNow

$ ->
  # FastClick
  FastClick.attach document.body
