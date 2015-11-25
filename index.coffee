_     = require("underscore")
Iconv = require("iconv").Iconv
iconv = new Iconv 'gbk', 'utf8'

#仿php chr函数
chr = (codePt) ->
  # http://kevin.vanzonneveld.net
  # +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  # +   improved by: Brett Zamir (http://brett-zamir.me)
  # *     example 1: chr(75);
  # *     returns 1: 'K'
  # *     example 1: chr(65536) === '\uD800\uDC00';
  # *     returns 1: true
  if codePt > 0xFFFF # Create a four-byte string (length 2) since this code point is high
    #   enough for the UTF-16 encoding (JavaScript internal use), to
    #   require representation with two surrogates (reserved non-characters
    #   used for building other characters; the first is "high" and the next "low")
    codePt -= 0x10000
    return String.fromCharCode(0xD800 + (codePt >> 10), 0xDC00 + (codePt & 0x3FF))

  String.fromCharCode(codePt)


module.exports = (value) ->
  try
    return decodeURIComponent(value)
  catch e
    try
      splited = value.split '%'
      str = splited.shift()
      str += _.map(splited, (x)->
        "#{chr(parseInt(x.substr(0, 2), 16))}#{x.substr 2}"
      ).join('')

      buf = new Buffer(str, 'ascii')
      return iconv.convert(buf).toString()
    catch e
      console.error e, e.stack
      return buf.toString()
