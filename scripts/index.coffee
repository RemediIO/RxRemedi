datauri = require('datauri')
fs = require('fs')
plates = require('plates')

module.exports = (robot) ->

  robot.router.get "/", (req, res) ->

    pathToTemplate =  __dirname.replace('scripts', "static/templates/index.html")

    platesMap = plates.Map();

    templateVars = {
      remediLogoImage: '/favicon.png',
    }

    platesMap.where('class').is('remedi-logo-image').use('remediLogoImage').as('src');


    fs.readFile pathToTemplate, 'utf8', (err, templateHtml) ->
      res.setHeader('Content-Type', 'text/html')
      renderedHtml = plates.bind(templateHtml, templateVars, platesMap);
      res.end renderedHtml
