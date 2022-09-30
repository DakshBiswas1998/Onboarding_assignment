require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'browserstack/local'
require 'appium_lib'

BeforeAll do

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "#{CONFIG_NAME}.config.yml")))
$wait = Selenium::WebDriver::Wait.new(:timeout => 30)
caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])
caps['browserstack.user'] = ENV['BROWSERSTACK_USERNAME'] || caps['browserstack.user']
caps['browserstack.key'] = ENV['BROWSERSTACK_ACCESS_KEY'] || caps['browserstack.key']

$bs_local = nil

if ENV['BROWSERSTACK_APP_ID']
  caps['app'] = ENV['BROWSERSTACK_APP_ID']
end

desired_caps = {
  caps: caps,
  appium_lib: {
    server_url: "https://#{caps['browserstack.user']}:#{caps['browserstack.key']}@#{CONFIG['server']}/wd/hub"
  }
}

  $appium_driver = Appium::Driver.new(desired_caps, true)
  $driver = $appium_driver.start_driver
rescue Exception => e
  puts e.message
  Process.exit(0)
end

AfterAll do
  $driver.quit
end