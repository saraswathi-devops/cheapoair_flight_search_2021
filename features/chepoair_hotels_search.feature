Feature: Hotels search functionality

  Scenario: Verify user is able to search for the hotels
    Given user is on the Cheapoair homepage
    When user selects the Hotels tab
    And user search the "Columbus" city and selects "CMH" airport for searching hotels
    And User selects the Checkin date
    And  User selects the Checkout date
    And  user provides the Room, Adults and Child details
    And user searches for the Hotels
    Then  verify user should see the available Hotel details


