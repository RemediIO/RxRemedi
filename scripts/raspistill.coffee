moment = require('moment')
glob = require("glob")
fs = require('fs')
spawn = require('child_process').spawn

module.exports = (robot) ->


  robot.router.get "/raspistill/take", (req, res) ->

    timestamp = moment().unix()
    child = spawn('/bin/sh', ['-c', "raspistill --width 640 --height 480 --quality 100 --nopreview --output #{__dirname.replace('scripts', 'static/images/stills')}/#{timestamp}.jpg"])

    setTimeout ->
      pathToStills = __dirname.replace('scripts', 'static/images/stills/*.jpg')
      glob pathToStills, (er, files) ->
        res.end "#{JSON.stringify(files)}"
        child.stdin.end()
    , 5 * 1000

  robot.router.get "/raspistill/latest", (req, res) ->
    pathToStills = __dirname.replace('scripts', 'static/images/stills/*')
    glob pathToStills, (er, files) ->
      pathToImage = files.sort()[0]
      fs.readFile pathToImage, (err, data) ->
        res.setHeader('Content-Type', "image/#{pathToImage.split('.')[1]}" )
        res.end data, 'binary'
