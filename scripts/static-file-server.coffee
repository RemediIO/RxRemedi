
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
