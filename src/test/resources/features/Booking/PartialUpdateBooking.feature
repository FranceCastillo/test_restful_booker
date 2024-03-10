Feature: Updates a current booking with a partial payload

  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def allData = read('classpath:json/data.json')

  @UpdateName
  Scenario: Update only name of current booking
    * def jsonCredencials = allData.AuthSuccess
    * def jsonUpdate = allData.PartialUpdate
    * def tokenSuccess = call read('TokenSuccess.feature')
    * def token = tokenSuccess.response.token
    * def createUser = call read('createToDelete.feature')
    * def id = createUser.response.bookingid
    Given url baseUrl + '/booking/:id'
    And path id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    And def beforeUpdate = response
    Given url baseUrl + '/booking/:id'
    And path id
    Given request jsonUpdate
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=' + token
    And header Authorizationopcional = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method patch
    Then status 200
    And def afterUpdate = response
    * match beforeUpdate != afterUpdate
