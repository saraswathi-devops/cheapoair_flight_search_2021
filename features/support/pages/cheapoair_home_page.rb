class CheapoairHomePage
  include PageObject
  page_url "www.cheapoair.com"

  radio(:round_trip_tab, id: 'roundTrip')
  radio(:hotels_tab, id: 'roundTrip')

  def maximizing_window
    @browser.driver.manage.window.maximize
  end

  def select_round_trip
    round_trip_tab_element.click unless round_trip_tab_element.selected?
  end

  def search_dep_airport dep_city, dep_airport_code
    @browser.link(class: 'suggestion-box__clear icon').click if @browser.link(class: 'suggestion-box__clear icon').present?
    @browser.text_field(id: 'from0').set dep_city
    sleep 2
    @browser.ul(class: 'suggestion-box__list autoSuggest__list').lis.each do |all_dep_airports|
      if all_dep_airports.text.include? dep_airport_code
        all_dep_airports.click
        break
      end
    end
  end

  def search_arr_airport arr_city, arr_airport_code
    @browser.link(class: 'suggestion-box__clear icon is--hover').click if @browser.link(class: 'suggestion-box__clear icon is--hover').present?
    @browser.text_field(id: 'to0').set arr_city
    sleep 2
    @browser.ul(class: 'suggestion-box__list autoSuggest__list', index: 1).lis.each do |all_arr_airports|
      if all_arr_airports.text.include? arr_airport_code
        all_arr_airports.click
        break
      end
    end
  end

  def cal_date no_of_days
    (Time.now + 24 * 60 * 60 * no_of_days).strftime("%-d %B %Y")
  end

  def choose_dep_date(no_of_days)
    fut_date = cal_date no_of_days.to_i
    @browser.div(class: 'col-6 calendarDepart').click
    @browser.link(aria_label: fut_date).click
  end

  def choose_arr_date no_of_days
    fut_date = cal_date no_of_days.to_i
    @browser.div(class: 'col-6 calendarReturn').click
    @browser.link(aria_label: fut_date).click
    sleep 2
  end

  def search_flights
    @browser.button(id: 'searchNow').click
    sleep 2
  end

  def verify_flight_results
    no_of_reults = @browser.div(class: 'filters--content col-12 p-0').text
    fail "Flight results not found" unless @browser.div(class: 'filters--content col-12 p-0').text.include? 'results found'
    p "No of reuslts are #{no_of_reults}"
  end

end