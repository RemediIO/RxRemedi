Datauri = require('datauri')

module.exports = (robot) ->

  robot.router.get "/snap", (req, res) ->
    # http://localhost:8080/snap?p=/Users/orie/OR13/Remedi/RxRemedi/files/test.gif
    path = req._parsedUrl.query.split('=')[1]
    datauri = new Datauri(path)
    res.end datauri.content

  robot.router.get "/xss", (req, res) ->
    xss = '''
    <script>alert('hello');</script>
    '''
    res.end xss

  robot.router.get "/demo", (req, res) ->

    dataURI = (new Datauri('/Users/orie/OR13/Remedi/RxRemedi/files/test.gif')).content
    xss = '''
    <script>window.location.href="''' + dataURI + '''";</script>
    '''
    res.end xss
