# team-up

Sorts players into equivalent teams based on performance rating

[![Build Status](https://travis-ci.org/nguyenchr/team-up.svg?branch=master)](https://travis-ci.org/nguyenchr/team-up)

[![Dependency Status](https://david-dm.org/nguyenchr/team-up.png?theme=shields.io)](https://david-dm.org/nguyenchr/team-up)
[![devDependency Status](https://david-dm.org/nguyenchr/team-up/dev-status.png?theme=shields.io)](https://david-dm.org/nguyenchr/team-up#info=devDependencies)

# using in your project

```javascript
teamUp = require('team-up');
```

Ever wanted a programatic way to sort players into teams?

team-up allows you to pass in an array of players and have them automatically sorted into teams

Players will be sorted using their `performance` attribute

## teamUp.sort(players, [options])
* players (*Array*): The array of players to sort.
* options Optional
  * numberOfTeams *Number*, Optional, Default: 2
  * sorter *String*, Optional, Default: schoolyard

Returns the sorted teams
```javascript
{
  teams: [{
    players: [...]
  },{
    players: [...]
  }]
}
```

# sorters

## schoolyard sort

Modeled after the old-fashioned method used by kids to divide into teams.
Where 2 captains are nominated who each take it in turn to choose the next best player
until there are no players remaining.

```javascript
players = [
  {id: 1, performance: 10},
  {id: 2, performance: 30},
  {id: 3, performance: 20},
  {id: 4, performance: 50}
]

teams = teamwork.sort(players, {sorter: 'schoolyard', numberOfTeams: 2});

teams.should.eql({
  teams: [{
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
})


```
