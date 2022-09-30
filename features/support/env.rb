require 'rubygems'
require 'selenium-webdriver'
require 'browserstack/local'
require 'browserstack-automate'

Before do |scenario|
CONFIG = YAML.load(File.read("config.yml"))
browserstack_url = "https://#{CONFIG["username"]}:#{CONFIG["access_key"]}@hub.browserstack.com/wd/hub"

BUILD_NAME = "browserstack-build-1"
   caps = {
    "os" => "Windows",
    "osVersion" => "11",
    "browserName" => "Chrome",
    "browserVersion" => "103.0",
    "buildName" => BUILD_NAME,
    "sessionName" => "Flipkart"
   }

options = Selenium::WebDriver::Options.send "chrome"
 options.browser_name = caps["browserName"].downcase
 options.add_option('bstack:options', caps)
 $driver = Selenium::WebDriver.for(:remote,
   :url => browserstack_url,
   :capabilities => options)
$driver.manage.window.maximize
$driver.manage.timeouts.implicit_wait = 10 # seconds
 end

 After do |scenario|
    $driver.quit
end
