Feature: Flipkart product search
Search for given product on Flipkart
@Test
    Scenario Outline: Verify the Flipkart product search results
        Given I am on Flipkart Home Page
        Then I should search for product "Iphone 13" in the textbox
        When I click on the search button
        Then I should verify the search results
Examples:
    | product |
    | Iphone 13  |