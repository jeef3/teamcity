# TeamCity API

[![Build Status](https://travis-ci.org/jeef3/teamcity.svg?branch=master)](https://travis-ci.org/jeef3/teamcity)

[TeamCity REST API](http://confluence.jetbrains.com/display/TCD8/REST+API)

## Under Construction

This library is still under heavy construction.

## Installation

```
npm install teamcity
```

## Usage

``` JavaScript
var TeamCity = require('teamcity').TeamCity

// Set-up authentication
var teamcity = new TeamCity({
  username: 'myUsername',
  password: 'myPassword'
});

// Get some builds
teamcity.builds(1234, function (build) {
  // Do stuff with build
})
```

Also has support for TeamCity locators

``` JavaScript
var buildsSinceBuild = teamcity.changesLocator()
  .buildType({id: 'bt9'})
  .sinceChange(5678);

// http://teamcity:8111/app/rest/changes/?locator=buildType:(id:bt9),sinceChange:5678
teamcity.changes(buildsSinceBuild, function (changes) {
  // Do stuff with changes
});
```

And nested parameters

``` JavaScript
teamcity.projects('project-one').parameters('param-one', function (value) {
  // Do stuff with value
});
```
