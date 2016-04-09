datauri = require('datauri')
fs = require('fs')
plates = require('plates')

module.exports = (robot) ->

  robot.router.get "/demo", (req, res) ->

    # path = req._parsedUrl.query

    pathToTemplate =  __dirname.replace('scripts', "static/templates/demo.html")

    platesMap = plates.Map();

    templateVars = {
      dataUri:  (new datauri(__dirname.replace('scripts', 'static/images/spiral.gif'))).content
    }

    platesMap.where('id').is('dataUri').use('dataUri').as('src');

    fs.readFile pathToTemplate, 'utf8', (err, templateHtml) ->
      res.setHeader('Content-Type', 'text/html')
      renderedHtml = plates.bind(templateHtml, templateVars, platesMap);
      res.end renderedHtml
