#!/usr/bin/env bash

export HUBOT_AUTH_ADMIN=YOUR_NAME

#Secret
export HUBOT_FIREBASE_SECRET=YOUR_SECRET

#Database
export HUBOT_FIREBASE_APP_URL=https://YOUR_APP.firebaseio.com/hubot

#Chat room schema
export HUBOT_FIREBASE_ROOMS_PATH=/applicationStores/chatRooms
export HUBOT_FIREBASE_CHAT_PATH=/chatMessages

#Message schema
export HUBOT_FIREBASE_MSG_USERID_PATH=/userId
export HUBOT_FIREBASE_MSG_USERNAME_PATH=/userProfile/userName
export HUBOT_FIREBASE_MSG_CONTENT_PATH=/message


export HUBOT_TWITTER_KEY=XXX
export HUBOT_TWITTER_SECRET=XXX
export HUBOT_TWITTER_TOKEN=XXX
export HUBOT_TWITTER_TOKEN_SECRET=XXX

rhc env set HUBOT_FIREBASE_SECRET=$HUBOT_FIREBASE_SECRET -a YOUR_APP
rhc env set HUBOT_FIREBASE_APP_URL=$HUBOT_FIREBASE_APP_URL -a YOUR_APP
rhc env set HUBOT_FIREBASE_ROOMS_PATH=$HUBOT_FIREBASE_ROOMS_PATH  -a YOUR_APP
rhc env set HUBOT_FIREBASE_CHAT_PATH=$HUBOT_FIREBASE_CHAT_PATH -a YOUR_APP
rhc env set HUBOT_FIREBASE_MSG_USERID_PATH=$HUBOT_FIREBASE_MSG_USERID_PATH  -a YOUR_APP
rhc env set HUBOT_FIREBASE_MSG_USERNAME_PATH=$HUBOT_FIREBASE_MSG_USERNAME_PATH -a YOUR_APP
rhc env set HUBOT_FIREBASE_MSG_CONTENT_PATH=$HUBOT_FIREBASE_MSG_CONTENT_PATH -a YOUR_APP

rhc env set HUBOT_TWITTER_KEY=$HUBOT_TWITTER_KEY -a YOUR_APP
rhc env set HUBOT_TWITTER_SECRET=$HUBOT_TWITTER_SECRET -a YOUR_APP
rhc env set HUBOT_TWITTER_TOKEN=$HUBOT_TWITTER_TOKEN -a YOUR_APP
rhc env set HUBOT_TWITTER_TOKEN_SECRET=$HUBOT_TWITTER_TOKEN_SECRET -a YOUR_APP
