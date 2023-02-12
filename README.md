# REST API Testing with Karate(BDD F/W)

이 문서에서는 REST API 테스트를 위한 BDD 프레이임워크인 [Karate](https://github.com/intuit/karate)를 소개한다.
Karate를 이용하면 자연어 수준의 [Gherkin](https://docs.cucumber.io/gherkin/reference/) 문법으로 feature/scenario를 작성하여 REST API를 테스트할 수 있다.

또한 이 문서에서는 BDD 스타일의 테스트에만 집중하기 위해 REST API 구축은 [WireMock](http://wiremock.org/) 을 사용한다.

## 1. Overview

Karate는 java를 위한 [BDD(Behavior Driven Development)](https://en.wikipedia.org/wiki/Behavior-driven_development) 테스팅 프레임워크이다.

Karate는 BDD 프레임워크인 Cucumber를 기반으로 구현하여 유사한 점들이 있다. 테스트 할 기능을 Gherkin 파일에 기술한다. 그런데 Cucumber와 달리 테스트를 Java로 작성하지 않고, Gherkin 파일에 텍스트로 작성한다.

```Gherkin
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
```

Gerkin 파일은 Feature 키워드로 시작하고 동일한 줄에 Feature 이름을 명시한다. Feature는 SW Feature에 대한 상위 레벨의 기술이고, 관련된 시나리오를 그룹핑한다.

Feature 이후에 해당 Feature에 속하는 다양한 시나리오를 기술한다. 시나리오에는 시나리오라는 키워드로 시작하여 Given, When, Then, And 및 But 키워드가 포함 된 여러 단계로 구성된다.

(애자일에서) Acceptance Test는 사용자 스토리로 작성되고, Cucumber에서는 Feature가 사용자 스토리를 기술하기 위해 사용된다.

사용자 스토리에 해당하는 Feature는 

 `As a [role] I want [feature] so that [benefit]`

의 형식을 따른다. 위의 예와 같이...
> **As a** github user

> **In order to** get user's repositories

> **I want to** look up a user's profile on github

보다 자세한 Feature, Scenario에 대한 자세한 설명은 [Gherkin](https://docs.cucumber.io/gherkin/reference/)를 참고하기 바란다.

Gherkin 파일은 한글로 작성해도 정상적으로 동작한다.

## 2. library 의존성

com.intuit.karate:karate-apache

com.intuit.karate:karate-junit4

2개의 의존성이 필요하다.

## 3. Validating Response Values with Markers

다음과 같은 경우에 대해 다양한 마커(marker)를 사용할 수 있다.

```
null 여부
	#null
	#notnull
    
필드의 값의 타입 매칭
	#boolean
	#number
	#string
    
JSON 객체나 array
	#array
	#object
    
형식, 정규식, js 표현식
	#uuid — value conforms to the UUID format
	#regex STR — value matches the regular expression STR
	#? EXPR — asserts that the JavaScript expression EXPR evaluates to true
```

## 4. Running Tests

Karate를 JUnit에서 `@RunWith` 어노테이션을 통해 실행할 수 있다.
`@CucumberOptions`을 사용해서 feature 파일의 위치를 명식한다. 

```java
@RunWith(Karate.class)
@CucumberOptions(features = "classpath:karate")
public class KarateUnitTest {
//...     
}
```

## 5. 예제

`src/test/resources/karate/user.feature` <-- gherkin feature 파일

`src/test/java/karate/KarateIntegrationTest.java` <-- Karate F/W를 이용한 테스트 실행 프로그램

## 참고

- [원문: REST API Testing with Karate](https://www.baeldung.com/karate-rest-api-testing)
- [Cucumeber와 Gerkin에 대한 보다 자세한 사항](http://bit.ly/2V12nTZ)
- [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development)
- [karate-demo](https://github.com/intuit/karate/tree/master/karate-demo)
- [karatelabs/karate: Test Automation Made Simple](https://github.com/karatelabs/karate)
- [IDE Support · karatelabs/karate Wiki](https://github.com/karatelabs/karate/wiki/IDE-Support)
