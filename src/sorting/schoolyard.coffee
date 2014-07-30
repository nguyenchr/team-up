_ = require 'lodash'

exports.sort = (players, opts) ->

  buckets = _.chain players
   .sortBy opts.sortBy or opts.field or 'performance'
   .reverse()
   .groupBy (item, index) -> index % opts.numberOfTeams
   .values()
   .map (bucket) -> players: bucket
   .valueOf()

  buckets.push(players:[]) for [0...(opts.numberOfTeams - buckets.length)]
  buckets
