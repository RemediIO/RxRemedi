moment = require('moment')

qr = require('qr-image')

module.exports = (robot) ->


  robot.router.get "/favicon.png", (req, res) ->
      png_string = qr.imageSync("RxRemedi says hello at #{moment()}", { type: 'png' })
      res.setHeader('Content-Type', "image/png" )
      res.end png_string, 'binary'
