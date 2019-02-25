Feature: Testing a REST API with Karate
  As a github user
  In order to get user's repositories
  I want to look up a user's profile on github

  Scenario: Testing valid GET endpoint
    Given url 'http://localhost:8080/user/get'
    When method GET
    Then status 200

  Scenario: Testing an invalid GET endpoint - 404
    Given url 'http://localhost:8080/user/wrong'
    When method GET
    Then status 404

  Scenario: Testing the exact response of a GET endpoint
    Given url 'http://localhost:8080/user/get'
    When method GET
    Then status 200
    And match $ == {id:"1234",name:"John Smith"}

  Scenario: Testing the exact response field value of a GET endpoint
    Given url 'http://localhost:8080/user/get'
    When method GET
    Then status 200
    And match $.id == "1234"

  Scenario: Testing that GET response contains specific field
    Given url 'http://localhost:8080/user/get'
    When method GET
    Then status 200
    And match $ contains {id:"1234"}

  Scenario: Test GET response using markers
    Given url 'http://localhost:8080/user/get'
    When method GET
    Then status 200
    And match $ == {id:"#notnull",name:"John Smith"}

  Scenario: POST를 request body를 가지고 테스트
    Given url 'http://localhost:8080/user/create'
    And request { id: '1234' , name: 'John Smith'}
    When method POST
    Then status 200
    And match $ contains {id:"#notnull"}
