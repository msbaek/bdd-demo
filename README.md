원문: https://www.baeldung.com/karate-rest-api-testing

> 이 프로젝트를 참조하면 Rest API 서버를 쉽게 테스트할 수 있다.

## src/test/resources/karate/user.feature

Gerkin Style의 REST Test Specification

## src/test/java/karate/KarateIntegrationTest.java

WireMock을 띄우고, 위의 Karate Specification을 실행시키는 테스트


## src/test/resources/logback-test.xml

반드시 있어야 동작함