Feature: Users
  As a Consumer of the GitHub Users endpoint,
  I can retrieve data about Users
  

  Scenario: Get User - Returns data matching a unique User
    Given the github api "https://api.github.com"
    When I get user "jukafah"
    Then the following data returns
        | Attribute | Value                                       |
        | Login     | jukafah                                     |
        | ID        | 7843737                                     |
        | Repos Url | https://api.github.com/users/jukafah/repos  | 
        | Bio       | I do stuff sometimes.                       |
        | Blog      |                                             |
        | Email     | null                                        |
        | Name      | Steve Momcilovic                            |
        | Url       | https://api.github.com/users/jukafah        |
        | Html Url  | https://github.com/jukafah                  |
    
  Scenario: Get User - Handles not found
    Given the github api "https://api.github.com"
    When I get user "blargblablargbla"
    Then the users endpoint returns not found
    
  Scenario: Get Users - Returns data for all Users
    Given the github api "https://api.github.com"
    When I get all users
    Then a list of users returns
    
  Scenario: Get Users - Returns data for all Users since specific user id
    Given the github api "https://api.github.com"
    When I get all users starting with id "5"
    Then a list of users returns starting with id "5"


#New tests for Starred Users

  @Stargazers
  Scenario: Get Users - List all starred users
    Given the github api "https://api.github.com"
    And Username "jukafah" and Repository "csharp-specflow-restease"
    When I get stargazers for repository
    Then all starred users are displayed