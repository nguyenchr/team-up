_ = require 'lodash'

exports.sort = (players, opts) ->

  sortedByPerformance = _.chain players
   .sortBy sortByPerformance
   .reverse()
   .valueOf()

  return teams: [0...opts.numberOfTeams].map (team, teamIndex) ->
    players: _.filter sortedByPerformance, (player, playerIndex) ->
      playerIndex%opts.numberOfTeams is teamIndex

sortByPerformance = (player) ->
  Math.min 100, player.performance
