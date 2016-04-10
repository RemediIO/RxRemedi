Firebase = require("firebase")
moment = require('moment')
glob = require("glob")
fs = require('fs')
datauri = require('datauri')
spawn = require('child_process').spawn
firebaseRef = new Firebase process.env.HUBOT_FIREBASE_APP_URL

module.exports = (robot) ->

  robot.router.get "/api/v0/firebase/camera-still", (req, res) ->
    timestamp = moment().unix()
    child = spawn('/bin/sh', ['-c', "raspistill --width 640 --height 480 --quality 100 --nopreview --output #{lastCapture}"])

    lastCapture = __dirname.replace('scripts', 'static/images/firebase/last-camera-still.jpg')

    setTimeout ->

      responseBody = {
        timestamp: timestamp,
        imageDataUri: new datauri(lastCapture).content
      }

      lastCaptureRef = firebaseRef.child("last-camera-still")
      lastCaptureRef.set(responseBody)

      res.end JSON.stringify(responseBody)
      child.stdin.end()
    , 5000

  robot.router.get "/api/v0/firebase/camera-still/latest", (req, res) ->
    lastCaptureRef = firebaseRef.child("last-camera-still")
    lastCaptureRef.on "value", (snapshot) ->
      res.end JSON.stringify(snapshot.val())
