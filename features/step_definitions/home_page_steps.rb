require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'pry'
include HomePage

Given('I am on Flipkart Home Page') do
    HomePage.visit_home
    HomePage.close_pop_up
end

Then('I should search for product {string} in the textbox') do |product_name|
    HomePage.enter_product(product_name)
end

When('I click on the search button') do
    HomePage.click_search_btn
end

Then('I should verify the search results') do
    expect(HomePage.is_search_results_shown).to eq true
    $driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Results shown"}}') if HomePage.is_search_results_shown
end