ParameterSet = require '../parameter-set'

class ProjectParameters extends ParameterSet
  @path '/parameters'

  @parameters [
    'startDate'
    'finishDate'
  ]

module.exports = ProjectParameters
