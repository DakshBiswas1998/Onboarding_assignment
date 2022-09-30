require 'rubygems'

class Home_page

def verify_button_visibility()
    $wait.until { $driver.find_element(:id, "gotoURL").displayed? }
end

def enter_url(url)
    $wait.until { $driver.find_element(:id, "txtview").displayed? }
    search_box = $driver.find_element(:id, "urltxt")
    search_box.send_key(url)
    sleep 3
end

def click_button()
    $driver.find_element(:id, "gotoURL").click
    sleep 2
    results = $driver.find_elements(:id, "gotoURL")
if results.count <= 0
    puts "Found results - Test Passed"
else
    puts "No results found - Test Failed"
end
end
end