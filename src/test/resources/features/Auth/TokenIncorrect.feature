Feature: Verify the creation with incorrect credentials

  Background:
    * url 'https://restful-booker.herokuapp.com/auth'
    * def allData = read('classpath:json/data.json')


  @IncorrectUser
  Scenario: Verify token with incorrect username
    * def json = allData.AuthIncorrectUser
    Given request json
    When method post
    And match response.reason != null
    And match response.reason == "Bad credentials"
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)


  @AuthIncorrecPass
  Scenario: Verify token with incorrect password
    * def json = allData.AuthIncorrecPass
    Given request json
    When method post
    And match response.reason != null
    And match response.reason == "Bad credentials"
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)


  @AuthEmptyUser
  Scenario: Verify token with empty username
    * def json = allData.AuthEmptyUser
    Given request json
    When method post
    And match response.reason != null
    And match response.reason == "Bad credentials"
    And match response.reason != null
    And match response.reason == "Bad credentials"
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)


  @AuthEmptyPass
  Scenario: Verify token with empty password
    * def json = allData.AuthEmptyPass
    Given request json
    When method post
    And match response.reason != null
    And match response.reason == "Bad credentials"
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus))


  @AuthEmptyUserAndPass
  Scenario: Verify token with empty username and password
    * def json = allData.AuthEmptyUserAndPass
    Given request json
    When method post
    And match response.reason != null
    And match response.reason == "Bad credentials"
    Then if (responseStatus != 400) karate.log('Status code was not 400, it was:', responseStatus)


