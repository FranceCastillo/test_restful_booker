Feature: Creates a new booking to then Delete it

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * def allData = read('classpath:json/data.json')

  Scenario: Create a new booking
    * def json = allData.Create
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    Given request json
    When method post
    Then status 200
    And match response.bookingid != null