PORT=$OPENSHIFT_NODEJS_PORT  BIND_ADDRESS=$OPENSHIFT_NODEJS_IP HEROKU_URL=$OPENSHIFT_APP_DNS FIREBASE_URL=$HUBOT_FIREBASE_APP_URL FIREBASE_SECRET=$HUBOT_FIREBASE_SECRET bin/hubot -n RxRemedi --adapter twitter