Feature: Returns the ids of all the bookings that exist

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * def allData = read('classpath:json/data.json')

  @AllId
  Scenario: Returns all id
    When method get
    Then status 200
    * match each response == { bookingid: '#? _ != null && _ > 0' }

  @SearchByName
  Scenario: Returns booking by name
    * def json = allData.SearchByName
    And param firstname = json.firstname
    And param lastname = json.lastname
    When method get
    Then status 200
    * match each response == { bookingid: '#? _ != null && _ > 0' }

  @SearchbyDate
  Scenario: Returns booking by date
    * def json = allData.Bookingdates
    And param checkin = json.checkin
    And param checkout = json.checkout
    When method get
    Then status 200
    * match each response == { bookingid: '#? _ != null && _ > 0' }
