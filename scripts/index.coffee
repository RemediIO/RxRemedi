datauri = require('datauri')
fs = require('fs')
plates = require('plates')

module.exports = (robot) ->

  robot.router.get "/", (req, res) ->

    pathToTemplate =  __dirname.replace('scripts', "WebApp/dist/index.html")

    platesMap = plates.Map();

    templateVars = {
      piBaseRef: 'http://pi.remedi.io/'
      remediLogoImage: '/favicon.png',
    }

    platesMap.where('src').has('scripts/').insert('piBaseRef');


    fs.readFile pathToTemplate, 'utf8', (err, templateHtml) ->
      res.setHeader('Content-Type', 'text/html')
      renderedHtml = plates.bind(templateHtml, templateVars, platesMap);
      res.end renderedHtml
