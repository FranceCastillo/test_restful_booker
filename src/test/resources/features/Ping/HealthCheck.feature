Feature: Health check endpoint to confirm whether the API is up and running

  Background:
    * url 'https://restful-booker.herokuapp.com/ping'

  @Ping
  Scenario: Health check endpoint to confirm whether the API is up and running.
    When method get
    Then status 201
    * match response == "Created"
