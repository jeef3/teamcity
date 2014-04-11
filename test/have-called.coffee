Assertion = require('chai').Assertion

Assertion.addMethod 'haveCalled', (verb, path, data) ->
  client = this.__flags.object

  this.assert(
    verb == client.verb(),
    'expected verb to be #{exp} but was #{act}',
    'expected verb to not be #{exp}',
    verb,
    client.verb()
  )

  this.assert(
    path == client.path(),
    'expected path #{exp} to have been called but was #{act}',
    'expected path #{exp} to have not been called',
    path,
    client.path()
  )

  # Check data
  clientData = client.data()
  for own key, value of data
    this.assert(
      clientData[key]?,
      "expected data to contain '#{key}'",
      "expected data to not contain '#{key}'",
      value
      null
    )

    this.assert(
      clientData[key] == value,
      "expected key '#{key}' to be '#{value}' but was '#{clientData[key]}'",
      "expected key '#{key}' to not be '#{value}'",
      value,
      null
    )
