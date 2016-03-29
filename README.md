# RxRemedi

#### Twitter Hubot on Openshift and Firebase

[@RxRemedi](https://twitter.com/RxRemedi)

Examples:

```
@RxRemedi pug me
```

## Getting Started From Scratch

Clone Find Replace "RxRemedi" with "MyCoolAppName"...

### OpenShift RHC Setup

Signup for an openshift account: https://www.openshift.com/app/account/new

Intall RHC: https://developers.openshift.com/en/managing-client-tools.html

### Create Your Hubot App

```
rhc app create Haoma nodejs-0.10 http://cartreflect-claytondev.rhcloud.com/reflect?github=smarterclayton/openshift-redis-cart --from-code=https://github.com/codemiller/hubot-openshift
```

### Testing locally

Install hubot:

```
npm install -g hubot coffee-script
```

Run locally:

```
$ ./bin/hubot --name Haoma
```

There are several included scripts that will be loaded. Try running a few commands, such as the following:

```
Haoma> Haoma help
Haoma> Haoma ping
Haoma> Haoma the rules
Haoma> Haoma map me sydney
Haoma> Haoma pug me
Haoma> Haoma ship it
```

### Install Twitter Adapter

Install the hubot twitter adapter.

```
npm install hubot-twitter --save
```

### Setup Your Twitter Account

- Create a new twitter account named Haoma.
- Add a mobile number so you can create an app.
- Consider using google voice if you need a new number.
- Create a new app named Haoma here: https://apps.twitter.com/app/new.
- Use  'rhc app show' to find your app url.
- Enter this app url for website and callback fields, add description, agree to TOS (after reading) and save.
- Go ahead and create an Access Token.

### Set Your Environment Variables

Export some variables for local testing (all these fields are visible from the Access Token view in twitter).

```
export HUBOT_TWITTER_KEY=XXX
export HUBOT_TWITTER_SECRET=XXX
export HUBOT_TWITTER_TOKEN=XXX
export HUBOT_TWITTER_TOKEN_SECRET=XXX
```

You must run this command to make the variables available in openshift.

```
rhc env set HUBOT_TWITTER_KEY=XXX HUBOT_TWITTER_SECRET=XXX HUBOT_TWITTER_TOKEN=XXX HUBOT_TWITTER_TOKEN_SECRET=XXX -a Haoma
```

### Testing Twitter Locally

You can test the twitter adapter locally (assuming environment variables have been exported).

```
$ ./bin/hubot --name Haoma --adapter twitter
```

### Update package.json

Make these changes so OpenShift knows to use the twitter adapter:

```
"start": "PORT=$OPENSHIFT_NODEJS_PORT BIND_ADDRESS=$OPENSHIFT_NODEJS_IP HEROKU_URL=$OPENSHIFT_APP_DNS REDIS_URL=redis://:$REDIS_PASSWORD@$OPENSHIFT_REDIS_HOST:$OPENSHIFT_REDIS_PORT bin/hubot -n Haoma -a twitter"
```

### Deploying to OpenShift

Deploy via git as usual:

```
git add -A
git commit -m "Adding Twitter adapter and other changes..."
git push
```

### Deploying to Github

Create a new repo on github with the same name.

```
git remote add github git@github.com:RemediIO/HaomaHubotOpenShift.git
git push -u github master

```

I like to rename the origin to openshift.

```
git remote rename origin openshift
```

Now we can:

```
git push github
git push openshift
```

### Adding More Scripts


Lets say you want to add some more scripts to your hubot, say google images and youtube.

For Google images, we can just:

```
npm install hubot-google-images --save
```

Don't forget to add to your external deps file:

```
"hubot-google-images"
```

For Youtube, we need to get some access keys first:

See: https://github.com/hubot-scripts/hubot-youtube

Then make sure that OpenShift can access the key:

```

rhc env set HUBOT_YOUTUBE_API_KEY=XXX -a Haoma

```

### Setting a Password

```

rhc env set HUBOT_USER=XXX HUBOT_PASSWORD=XXX -a Haoma

```


### Credits

These instructions were adopted from this wonderful blog post:

https://blog.openshift.com/hitchhikers-guide-to-tweetbots-hosting-a-hubot-on-openshift/
