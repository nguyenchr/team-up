# team-up

Sorts players into equivalent teams based on performance rating

[![NPM](http://img.shields.io/npm/v/team-up.svg?style=flat)](https://npmjs.org/package/team-up)

[![Build Status](http://img.shields.io/travis/nguyenchr/team-up.svg?style=flat)](http://travis-ci.org/nguyenchr/team-up)
[![Dependencies](http://img.shields.io/david/nguyenchr/team-up.svg?style=flat)](https://david-dm.org/nguyenchr/team-up)
[![Dev dependencies](http://img.shields.io/david/dev/nguyenchr/team-up.svg?style=flat)](https://david-dm.org/nguyenchr/team-up)
# using in your project

```javascript
teamUp = require('team-up');
```

Ever wanted a programatic way to sort players into teams?

team-up allows you to pass in an array of players and have them automatically sorted into teams

Players will be first sorted in descending order by their `performance` attribute.
Then distributed into teams

## teamUp.sort(players, [options])
* players (*Array*): The array of players to sort.
* options Optional
  * numberOfTeams *Number*, Optional, Default: 2
  * sorter *String*, Optional, Default: schoolyard
  * field *String*, Optional, Default: performance
  * sortBy *Function*, Optional

Returns the sorted teams

### Default sort
```javascript

var players = [
  {id: 1, performance: 10, gamesPlayed: 3},
  {id: 2, performance: 30, gamesPlayed: 1},
  {id: 3, performance: 20, gamesPlayed: 4},
  {id: 4, performance: 50, gamesPlayed: 2}
]

var teams = teamUp.sort(players);

teams.should.eql(
  [{
    players: [
      {id: 4, performance: 50},
      {id: 3, performance: 20}
    ]
  },{
    players: [
      {id: 2, performance: 30},
      {id: 1, performance: 10}
    ]
  }]
)

```

### Specifying field to sort by
```javascript

var players = [
  {id: 1, performance: 10, gamesPlayed: 3},
  {id: 2, performance: 30, gamesPlayed: 1},
  {id: 3, performance: 20, gamesPlayed: 4},
  {id: 4, performance: 50, gamesPlayed: 2}
]

var teams = teamUp.sort(players, {field: 'gamesPlayed'});

teams.should.eql(
  [{
    players: [
      {id: 3, performance: 20, gamesPlayed: 4},
      {id: 4, performance: 50, gamesPlayed: 2}
    ]
  },{
    players: [
      {id: 1, performance: 10, gamesPlayed: 3},
      {id: 2, performance: 30, gamesPlayed: 1}
    ]
  }]
)

```

### Specifying sortBy function
```javascript

var players = [
  {id: 1, performance: 10, gamesPlayed: 3},
  {id: 2, performance: 30, gamesPlayed: 1},
  {id: 3, performance: 20, gamesPlayed: 4},
  {id: 4, performance: 50, gamesPlayed: 2}
]

var sortBy = function(player, index) {
  return player.id + player.gamesPlayed
}

var teams = teamUp.sort(players, {field: 'gamesPlayed'});

teams.should.eql(
  [{
    players: [
      {id: 3, performance: 20, gamesPlayed: 4},
      {id: 1, performance: 10, gamesPlayed: 3}
    ]
  },{
    players: [
      {id: 4, performance: 50, gamesPlayed: 2},
      {id: 2, performance: 30, gamesPlayed: 1}
    ]
  }]
)

```

### Specifying numberOfTeams
```javascript

var players = [
  {id: 1, performance: 10, gamesPlayed: 3},
  {id: 2, performance: 30, gamesPlayed: 1},
  {id: 3, performance: 20, gamesPlayed: 4},
  {id: 4, performance: 50, gamesPlayed: 2}
]

var teams = teamUp.sort(players, {numberOfTeams: 4});

teams.should.eql(
  [{
    players: [
      {id: 4, performance: 50}
    ]
  },{
    players: [
      {id: 2, performance: 30}
    ]
  },{
    players: [
      {id: 3, performance: 20}
    ]
  },{
    players: [
      {id: 1, performance: 10}
    ]
  }]
)

```

# sorters

Currently only supports schoolyard sort.

## schoolyard sort

Modeled after the old-fashioned method used by kids to divide into teams.
Where 2 captains are nominated who each take it in turn to choose the next best player
until there are no players remaining.
