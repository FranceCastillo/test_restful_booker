Feature: Returns a specific booking based upon the booking id provided

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * def allData = read('classpath:json/data.json')

  @ValidID
  Scenario: Returns booking by valid ID
    * def json = allData.ValidID
    And path 11
    And header Content-Type = 'application/json; charset=utf-8'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match response == json

  @IDNoExist
  Scenario: Verify that doesn't return booking if ID not exist
    And path 0258
    And header Content-Type = 'application/json; charset=utf-8'
    And header Accept = 'application/json'
    When method get
    Then status 404
    * match response == "Not Found"
