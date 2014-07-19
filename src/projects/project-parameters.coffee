ParameterSet = require '../parameter-set'

class ProjectParameters extends ParameterSet
  @path '/parameters'

  @parameters [
    'startDate'
    'finishDate'
  ]

  constructor: (@client, @parent) ->
    super @client, @parent

module.exports = ProjectParameters
