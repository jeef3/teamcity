Locatable = require './locatable'
BuildLocator = require './locators/build-locator'

class BuildTypeBuilds extends Locatable
  @path '/builds'
  @locator BuildLocator

  constructor: (@client, @parent) ->
    super @client, @parent

  field: (field, cb) ->
    @client._get @getPath(field), cb

  startDate: (cb) ->
    @field 'startDate', cb

  endDate: (cb) ->
    @field 'endDate', cb

module.exports = BuildTypeBuilds
