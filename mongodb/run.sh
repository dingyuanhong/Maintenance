#!/bin/sh

MONGODB=/usr/local/mongodb/bin/mongod

MONGODB_DATA=/data/wwwroot/mongodb/

mkdir $MONGODB_DATA/logs
mkdir $MONGODB_DATA/mongodb_27017
mkdir $MONGODB_DATA/mongodb_27018
mkdir $MONGODB_DATA/mongodb_27019
mkdir $MONGODB_DATA/mongodb_27020

MONGODB_PATH=/data/mongodb
sudo $MONGODB --config $MONGODB_PATH/conf/mongo_27017.conf
sudo $MONGODB --config $MONGODB_PATH/conf/mongo_27018.conf
sudo $MONGODB --config $MONGODB_PATH/conf/mongo_27019.conf
sudo $MONGODB --config $MONGODB_PATH/conf/mongo_27020.conf
