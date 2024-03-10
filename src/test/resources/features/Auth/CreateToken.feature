Feature: Verify the creation of a new auth token

  Background:
    * url 'https://restful-booker.herokuapp.com/auth'
    * def allData = read('classpath:json/data.json')

  @Success
  Scenario: Verify token with valid username and password
    * def json = allData.AuthSuccess
    Given request json
    When method post
    Then status 200
    And match response.token != null
    And assert response.token.length() > 1
    And def token = response.token

  @IncorrectUser
  Scenario: Verify token with incorrect username
    * def json = allData.AuthIncorrectUser
    Given request json
    When method post
    Then status 400
    And match response.reason != null
    And match response.reason == "Bad credentials"


  @AuthIncorrecPass
  Scenario: Verify token with incorrect password
    * def json = allData.AuthIncorrecPass
    Given request json
    When method post
    Then status 400
    And match response.reason != null
    And match response.reason == "Bad credentials"


  @AuthEmptyUser
  Scenario: Verify token with empty username
    * def json = allData.AuthEmptyUser
    Given request json
    When method post
    Then status 400
    And match response.reason != null
    And match response.reason == "Bad credentials"


  @AuthEmptyPass
  Scenario: Verify token with empty password
    * def json = allData.AuthEmptyPass
    Given request json
    When method post
    Then status 400
    And match response.reason != null
    And match response.reason == "Bad credentials"


  @AuthEmptyUserAndPass
  Scenario: Verify token with empty username and password
    * def json = allData.AuthEmptyUserAndPass
    Given request json
    When method post
    Then status 400
    And match response.reason != null
    And match response.reason == "Bad credentials"

