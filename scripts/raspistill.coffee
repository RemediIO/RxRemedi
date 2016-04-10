moment = require('moment')
glob = require("glob")
spawn = require('child_process').spawn

module.exports = (robot) ->


  robot.router.get "/raspistill", (req, res) ->

    timestamp = moment().unix()
    child = spawn('/bin/sh', ['-c', "raspistill --nopreview --output #{__dirname.replace('scripts', 'static/images/stills')}/#{timestamp}.jpg"])

    child.stdout.on 'data', (data) ->

      res.end "#{JSON.stringify(data)}"

      child.stdin.end()

  robot.router.get "/raspistill/latest", (req, res) ->
    pathToStills = __dirname.replace('scripts', 'static/images/stills/*.gif')
    glob pathToStills, (er, files) ->
      res.end "#{JSON.stringify(files)}"
