Feature: Post endpoint test

  @AuthIUserValid
  Scenario: Verificar token con usuario y contraseña validos
    Given url 'https://restful-booker.herokuapp.com/auth'
    And param username = 'admin'
    And param password = 'password123'
    When method post
    Then status 200
    #And match responsseType == json
    #And assert responde.length > 1
