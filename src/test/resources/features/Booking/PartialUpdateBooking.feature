Feature: Updates a current booking with a partial payload

  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com'
    * def allData = read('classpath:json/data.json')

  @UpdateName
  Scenario: Update only name of current booking
    * def jsonUpdate = allData.PartialUpdate
    * def tokenSuccess = call read('classpath:features/Auth/TokenSuccess.feature')
    * def token = tokenSuccess.response.token
    * def createUser = call read('create.feature')
    * def id = createUser.response.bookingid
    #Search id
    Given url baseUrl + '/booking'
    And path id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    And def beforeUpdate = response
    #Update name
    Given url baseUrl + '/booking'
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
