should     = require 'should'
schoolyard = require "#{SRC}/sorting/schoolyard"

describe 'Schoolyard Sort', ->

  it 'should return an empty teams if no players are passed in', ->
    schoolyard.sort([], {numberOfTeams: 2}).should.eql teams: [
      players: []
    ,
      players: []
    ]

  it 'should return 2 teams with a single player each', ->
    players = [
      {id: 1, performance: 10}
      {id: 2, performance: 30}
    ]

    schoolyard.sort(players, {numberOfTeams: 2}).should.eql teams: [
      players: [
        {id: 2, performance: 30}
      ]
    ,
      players: [
        {id: 1, performance: 10}
      ]
    ]

  it 'should return 2 teams with multiple players', ->
    players = [
      {id: 1, performance: 10}
      {id: 2, performance: 30}
      {id: 3, performance: 20}
      {id: 4, performance: 50}
    ]

    schoolyard.sort(players, {numberOfTeams: 2}).should.eql teams: [
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

  it 'should return add a left over player to the first team', ->
    players = [
      {id: 1, performance: 10}
      {id: 2, performance: 30}
      {id: 3, performance: 20}
      {id: 4, performance: 50}
      {id: 5, performance: 5}
    ]

    schoolyard.sort(players, {numberOfTeams: 2}).should.eql teams: [
      players: [
        {id: 4, performance: 50}
        {id: 3, performance: 20}
        {id: 5, performance: 5}
      ]
    ,
      players: [
        {id: 2, performance: 30}
        {id: 1, performance: 10}
      ]
    ]

  it 'should return specified amount of teams', ->
    players = [
      {id: 1, performance: 10}
      {id: 2, performance: 30}
      {id: 3, performance: 20}
      {id: 4, performance: 50}
      {id: 5, performance: 90}
      {id: 6, performance: 70}
    ]

    schoolyard.sort(players, {numberOfTeams: 3}).should.eql teams: [
      players: [
        {id: 5, performance: 90}
        {id: 2, performance: 30}
      ]
    ,
      players: [
        {id: 6, performance: 70}
        {id: 3, performance: 20}
      ]
    ,
      players: [
        {id: 4, performance: 50}
        {id: 1, performance: 10}
      ]
    ]
