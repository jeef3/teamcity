# TeamCity API

[![Build Status](https://travis-ci.org/jeef3/teamcity.svg?branch=master)](https://travis-ci.org/jeef3/teamcity)

[TeamCity REST API](http://confluence.jetbrains.com/display/TCD8/REST+API)

## Under Construction

The TeamCity API is pretty big, so this library is largly incomplete.

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
teamcity.builds.get(1234, function (err, build) {
  // Do stuff with build
})l
```

Also has support for TeamCity locators. You can use the locator classes, or the supplied shortcuts:

``` JavaScript
var buildsSinceBuild = new BuildLocator()
  .buildType({id: 'bt9'})
  .sinceChange(5678);

// http://teamcity:8111/app/rest/changes/?locator=buildType:(id:bt9),sinceChange:5678
teamcity.changes.by(buildsSinceBuild, function (changes) {
  // Do stuff with changes
});

// With shortcuts
teamcity.changes.by({
    buildType: { id: 'bt9' },
    sinceChange: 5678
  }, function (changes) {
    // Do stuff with changes
  });
```

Nested API calls are also supported

``` JavaScript
// http://teamcity:8111/app/rest/projects/id:project1/buildTypes/id:bt1/builds/user:(id:1)
teamcity.projects.get('project1')
  .buildTypes.get('bt1')
  .builds.by({ user: { id: 1 } })
  // Do stuff with build
});
```
