# This now works on at least npm v5.x, but still requires harmony-proxies flag
# To run `coffee --nodejs --harmony-proxies .play/es6Proxy.coffee`

class ObjectLike
  constructor: (obj) ->
    unless obj?
      obj = {}
    @dummy = obj

    interceptor =
      set: (receiver, key, value) =>
        @dummy[key] = value

      get: (receiver, key) =>
        return @dummy[key]

    return Proxy.create(interceptor, @dummy)

a = new ObjectLike()
a['something long'] = 10
console.log(a['something long'])