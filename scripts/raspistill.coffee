moment = require('moment')
spawn = require('child_process').spawn

module.exports = (robot) ->


  robot.router.get "/raspistill", (req, res) ->

    timestamp = moment().unix()
    child = spawn('/bin/sh', ['-c', "raspistill --nopreview --output #{__dirname.replace('scripts', 'static/images/stills')}/#{timestamp}.jpg"])

    child.stdout.on 'data', (data) ->

      res.end "#{JSON.stringify(data)}"

      child.stdin.end()
