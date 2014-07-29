should     = require 'should'
teamwork   = require "#{SRC}/main"

describe 'Teamup', ->

  it 'should throw error if an invalid sorter is passed in', ->

    (-> teamwork.sort([], sorter: 'foo')).should.throw 'foo is not a valid sorter'

  it 'should by schoolyard sort into 2 teams by default', ->
    players = [
      {id: 1, performance: 10}
      {id: 2, performance: 30}
      {id: 3, performance: 20}
      {id: 4, performance: 50}
    ]

    teamwork.sort(players).should.eql teams: [
      players: [
        {id: 4, performance: 50}
        {id: 3, performance: 20}
      ]
    ,
      players: [
        {id: 2, performance: 30}
        {id: 1, performance: 10}
      ]
    ]
