datauri = require('datauri')
fs = require('fs')

module.exports = (robot) ->

  robot.router.get "/styles/:styleSheetPath", (req, res) ->
    pathToStyleSheet =  __dirname.replace('scripts', "static/styles/#{req.params.styleSheetPath}")
    fs.readFile pathToStyleSheet, 'utf8', (err, data) ->
      res.setHeader('Content-Type', 'text/css')
      res.end data

  robot.router.get "/templates/:templatePath", (req, res) ->
    pathToStyleSheet =  __dirname.replace('scripts', "static/templates/#{req.params.templatePath}")
    fs.readFile pathToStyleSheet, 'utf8', (err, data) ->
      res.setHeader('Content-Type', 'text/html')
      res.end data

  robot.router.get "/scripts/:scriptPath", (req, res) ->
    pathToStyleSheet =  __dirname.replace('scripts', "static/scripts/#{req.params.scriptPath}")
    fs.readFile pathToStyleSheet, 'utf8', (err, data) ->
      res.setHeader('Content-Type', 'text/javascript')
      res.end data

  robot.router.get "/stills/binary/:timestamp", (req, res) ->
    pathToImage =  __dirname.replace('scripts', "static/images/stills/#{req.params.timestamp}")
    fs.readFile pathToImage, (err, data) ->
      res.setHeader('Content-Type', "image/#{pathToImage.split('.')[1]}" )
      res.end data, 'binary'

  robot.router.get "/stills/base64/:timestamp", (req, res) ->
    imagePath =  __dirname.replace('scripts', "static/images/stills/#{req.params.timestamp}")
    res.setHeader('Content-Type', 'text/plain')
    res.end (new datauri(imagePath)).content
