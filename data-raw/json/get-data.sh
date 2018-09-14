#!/bin/sh

URL=https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website

wget $URL/bart-segments.json
wget $URL/bart-stations.json
wget $URL/sf-bike-parking.json
