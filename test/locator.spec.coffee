expect = require('chai').expect

Locator = require '../src/locators/locator'

describe 'Locator', ->
  locator = null

  beforeEach ->
    class MyLocator extends Locator
      @dimensions ['dim', 'sum']

    locator = new MyLocator()

  it 'should be able to add dimensions', ->
    expect(locator.dim).to.be.a('function')
    expect(locator.sum).to.be.a('function')
    expect(locator.non).to.not.be.a('function')
    expect(locator.dim('val')).to.equal(locator)

  it 'should be able to set values on dimensions', ->
    locator.dim('val1')
    locator.sum(id: 123)
    expect(locator.locators.dim).to.equal('val1')
    expect(locator.locators.sum.id).to.equal(123)

  it 'should be able to compile dimensions', ->
    locator.dim('val1')
    locator.sum(id: 123)
    expect(locator.compile()).to.equal('dim:(val1),sum:(id:123)')
