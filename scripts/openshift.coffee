
module.exports = (robot) ->
  robot.router.get "/", (req, res) ->
    res.setHeader('Content-Type', 'text/html')
    res.end "<script>window.location.href='/help';</script>"
