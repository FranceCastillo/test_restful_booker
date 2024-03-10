Feature: Delete a current booking
  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def allData = read('classpath:json/data.json')

  @Delete
  Scenario: Delete a current booking
    * def jsonCredencials = allData.AuthSuccess
    * def jsonCreateBeforeDelete = allData.CreateBeforeDelete
    * def tokenSuccess = call read('TokenSuccess.feature')
    * def token = tokenSuccess.response.token
    * def createUser = call read('createToDelete.feature')
    * def id = createUser.response.bookingid
    * print id
    # Search id before delete
    Given url baseUrl + '/booking'
    And path id
    When method get
    And def beforeDelete = response
    # Value is removed
    Given url baseUrl + '/booking'
    And path id
    And header Cookie = 'token=' + token
    And header Authorizationopcional = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method delete
    Then status 201
    And def afterDelete = response
    * match afterDelete == "Created"
    * match beforeDelete != afterDelete
    # Search id after delete
    And path id
    When method get
    Then status 404
    * match response == "Not Found"
