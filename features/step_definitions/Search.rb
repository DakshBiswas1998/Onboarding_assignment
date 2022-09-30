require './features/Page_object/Home_page.rb'

homepage = Home_page.new()

Given('I open the app and enter the home screen') do
    homepage.verify_button_visibility
end
  
  When('I enter the {string} URL in the text field') do |url|
    homepage.enter_url(url)
end
  
  Then('Visit the website in browser') do
homepage.click_button

end