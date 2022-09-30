Feature: Google search

    @Test
  Scenario: Verify the title of the Google home page
    Given I open the app and enter the home screen
    When I enter the "google.com" URL in the text field
    Then Visit the website in browser

Examples:
|URL|
|google.com|