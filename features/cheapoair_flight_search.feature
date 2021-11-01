Feature: Cheapoair Flight search functionality

  Scenario:verify user is able to search for the available flights for a future dates
    Given user is on the Cheapoair homepage
    When user selects the Round Trip
    And user search the Columbus city and selects CMH airport for departure
    And user search for Cleveland city and selects CLE airport for arrival
    And user selects future dates for departure 11 days from today
    And user selects future dates for arrival 15 days from today
    And user searches for available for flights
    Then verify user should see the available flights results


#Declarative style
  Scenario:verify user is able to search for the available flights for a future dates in Declarative style
    Given  user is on the Cheapoair homepage
    When user searches for the available flights for the future dates
    Then verify user should see the available flights results

#    negative case:
  Scenario: Verify user is able to validate the mandatory search fields for fields for flight search
    Given user is on  the Cheapoair homepage
    When user selects the Round Trip
    When user leaves depature and arival city fields blank
    And user selects future dates for departure
    And user selects future dats for arrival
    And user searches for available for flights
    Then verify user should see the "Please enter a From city or airport" error message0
    Then verify user should see the "Please enter a To city or airport" error message
#    you can write like this for verifiying the messages or you can write like below.

  Scenario: Verify user is able to validate the mandatory search fields for ALL the fields for flight search
    Given user is on  the Cheapoair homepage
    When user selects the Round Trip
    When user leaves depature and arival city fields blank
    And user selects future dates for departure
    And user selects future dats for arrival
    And user searches for available for flights
    Then user should see the following error messages:
      | Please enter a From city or airport |
      | Please enter a To city or airport   |

  Scenario Outline:verify user is able to search for the available flights for a future dates for different locations
    Given  user is on  the Cheapoair homepage
    When user selects the Round Trip
    And user search for <dep_city_name> city  and selects <dep_airport_name> airport for departure
    And user search for  <arr_city_name> city and selects <arr_airport_name> airport for arrival
    And user selects future dates for departure
    And user selects future dats for arrival
    And user searches for available for flights
    Then verify user should see the available flights results
    Examples:
      | dep_city_name |  | dep_airport_name |  | arr_city_name |  | arr_airport_name |
      | Columbus      |  | CMH              |  | Cleveland     |  | CLE              |
      | Milwaukee     |  | MKE              |  | Los Angeles   |  | LAX              |



