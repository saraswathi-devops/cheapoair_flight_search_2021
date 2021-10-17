Given(/^user is on the Cheapoair homepage$/) do
  visit CheapoairHomePageClass
  on(CheapoairHomePageClass).maximizing_window
#  nothing
end

When(/^user selects the Round Trip$/) do
  on(CheapoairHomePageClass).select_round_trip
  on(CheapoairHomePageClass).round_trip_tab_element.click if on(CheapoairHomePageClass).round_trip_tab_element.present?
  on(CheapoairHomePageClass).round_trip_tab.click if on(CheapoairHomePageClass).round_trip_tab_element.present?
end

And(/^user search the "([^"]*)" city and selects "([^"]*)" airport for departure$/) do |dep_city, dep_airport_code|
  on(CheapoairHomePageClass).search_dep_airport dep_city, dep_airport_code
end

And(/^user search for "([^"]*)" city and selects "([^"]*)" airport for arrival$/) do |arr_city, arr_airport_code|
  on(CheapoairHomePageClass).search_arr_airport arr_city, arr_airport_code
end

And(/^user selects future dates for departure (.*) days from today$/) do |no_of_days|
  on(CheapoairHomePageClass).choose_dep_date no_of_days
end

And(/^user selects future dates for arrival (.*) days from today$/) do |no_of_days|
  on(CheapoairHomePageClass).choose_arr_date no_of_days
end

And(/^user searches for available for flights$/) do
  on(CheapoairHomePageClass).search_flights
end

Then(/^verify user should see the available flights results$/) do
  on(CheapoairHomePageClass).verify_flight_results
end

