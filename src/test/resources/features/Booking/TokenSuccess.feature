Feature: Verify the creation of a new auth token

  Background:
    * url 'https://restful-booker.herokuapp.com/auth'
    * def allData = read('classpath:json/data.json')

  @Success
  Scenario: Token Sucess
    * def json = allData.AuthSuccess
    Given request json
    When method post
    Then status 200
    And match response.token != null
    And assert response.token.length() > 1
    And def token = response.token
