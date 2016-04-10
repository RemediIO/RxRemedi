moment = require('moment')
glob = require("glob")
spawn = require('child_process').spawn

module.exports = (robot) ->


  robot.router.get "/raspistill", (req, res) ->

    timestamp = moment().unix()
    child = spawn('/bin/sh', ['-c', "raspistill --nopreview --output #{__dirname.replace('scripts', 'static/images/stills')}/#{timestamp}.jpg"])

    setTimeout ->
      res.end "check /raspistill/latest"
      child.stdin.end()
    , 2000 

  robot.router.get "/raspistill/latest", (req, res) ->
    pathToStills = __dirname.replace('scripts', 'static/images/stills/*.jpg')
    glob pathToStills, (er, files) ->
      res.end "#{JSON.stringify(files)}"
