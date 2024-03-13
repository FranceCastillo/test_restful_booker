Feature: Creates a new booking in the API

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * def allData = read('classpath:json/data.json')

  @Create
  Scenario: Create a new booking
    * def json = allData.Create
    * def valid = allData.ValidCreated
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then status 200
    And match response.bookingid != null
    * match response == valid
    * def id = response.bookingid
    # Validates if the booking was created
    Given path id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match response == json

  @CreateWithoutName
  Scenario: Create a new booking without name
    * def json = allData.CreateWithoutName
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)

  @CreateWithoutLastName
  Scenario: Create a new booking without lastname
    * def json = allData.CreateWithoutLastName
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)

  @CreateWithoutPrice
  Scenario: Create a new booking without price
    * def json = allData.CreateWithoutPrice
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)

  @CreateWithoutCheckin
  Scenario: Create a new booking without checkin
    * def json = allData.CreateWithoutCheckin
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)

  @CreateWithoutCheckout
  Scenario: Create a new booking without checkout
    * def json = allData.CreateWithoutCheckout
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)
