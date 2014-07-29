_ = require 'lodash'

exports.sorters = require './sorters'

exports.sort = (players, opts={}) ->
  _.defaults opts,
    sorter: 'schoolyard'
    numberOfTeams: 2

  validate players, opts

  exports.sorters[opts.sorter] players, numberOfTeams: opts.numberOfTeams

validate = (players, opts) ->

  throw new Error("#{opts.sorter} is not a valid sorter") if not exports.sorters[opts.sorter]
