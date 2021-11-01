Given(/^user is on the Cheapoair homepage$/) do
  visit CheapoairHomePage
  on(CheapoairHomePage).maximizing_window
end

When(/^user selects the Round Trip$/) do
  on(CheapoairHomePage).select_round_trip
  on(CheapoairHomePage).round_trip_tab_element.click if on(CheapoairHomePage).round_trip_tab_element.present?
  on(CheapoairHomePage).round_trip_tab.click if on(CheapoairHomePage).round_trip_tab_element.present?
end

And(/^user search the (.*) city and selects (.*) airport for departure$/) do |dep_city, dep_airport_code|
  on(CheapoairHomePage).search_dep_airport dep_city, dep_airport_code
end

And(/^user search for (.*) city and selects (.*) airport for arrival$/) do |arr_city, arr_airport_code|
  on(CheapoairHomePage).search_arr_airport arr_city, arr_airport_code
end

And(/^user selects future dates for departure (.*) days from today$/) do |no_of_days|
  on(CheapoairHomePage).choose_dep_date no_of_days
end

And(/^user selects future dates for arrival (.*) days from today$/) do |no_of_days|
  on(CheapoairHomePage).choose_arr_date no_of_days
end

And(/^user searches for available for flights$/) do
  on(CheapoairHomePage).search_flights
end

 Then(/^verify user should see the available flights results$/) do
  on(CheapoairHomePage).verify_flight_results
end

When(/^user searches for the available flights for the future dates$/) do
  on(CheapoairHomePage) do |page|
    page.select_round_trip
    page.round_trip_tab_element.click if page.round_trip_tab_element.present?
    page.round_trip_tab.click if page.round_trip_tab_element.present?
    page.search_dep_airport "Columbus", "CMH"
    page.search_dep_airport "Cleveland", "CLE"
    page.choose_dep_date 2
    page.choose_arr_date 2
    page.search_flights
  end
  #   step "user is on the Cheapoair homepage"
  #   step "user selects the Round Trip"
  #   step "user search the Columbus city and selects CMH airport for departure"
  #   step "user search for Cleveland city and selects CLE airport for arrival"
  #   step "user selects future dates for departure 11 days from today"
  #   step "user selects future dates for arrival 15 days from today"
  #   step "user searches for available for flights"
  #  end
  # #
  # # steps %Q{
  # # Given  user is on the Cheapoair homepage
  # #     When user selects the Round Trip
  # #     And user search the Columbus city and selects "CMH" airport for departure
  # #     And user search for Cleveland" city and selects "CLE" airport for arrival
  # #     And user selects future dates for departure 11 days from today
  # #     And user selects future dates for arrival 15 days from today
  # #     And user searches for available for flights
  # #       }
  #
end