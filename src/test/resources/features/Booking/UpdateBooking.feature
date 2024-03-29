Feature: Updates a current booking

  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com'
    * def allData = read('classpath:json/data.json')

  @Update
  Scenario: Update a current booking
    * def jsonUpdate = allData.Update
    * def tokenSuccess = call read('classpath:features/Auth/TokenSuccess.feature')
    * def token = tokenSuccess.response.token
    * def createUser = call read('create.feature')
    * def id = createUser.response.bookingid
    # Search id before update
    Given url baseUrl + '/booking'
    And header Accept = 'application/json'
    And path id
    When method get
    And def beforeUpdate = response
    # Update booking
    Given url baseUrl + '/booking'
    And path id
    Given request jsonUpdate
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=' + token
    And header Authorizationopcional = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method put
    Then status 200
    And def afterUpdate = response
    * match beforeUpdate != afterUpdate
    * match afterUpdate == jsonUpdate

  @UpdateIdNotExist
  Scenario: Update id not exist
    * def jsonUpdate = allData.Update
    * def tokenSuccess = call read('classpath:features/Auth/TokenSuccess.feature')
    * def token = tokenSuccess.response.token
    Given url baseUrl + '/booking'
    And path 99999
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    Then status 404
    * match response == "Not Found"
    Given url baseUrl + '/booking'
    And path 99999
    Given request jsonUpdate
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=' + token
    And header Authorizationopcional = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method put
    Then status 405
    * match response == "Method Not Allowed"
