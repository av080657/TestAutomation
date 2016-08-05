@estore
Feature: New Customer - Iphone 6S PostPaid Mobile Service in Cart
  Scenario: New Customer - Iphone 6S PostPaid Mobile Service in Cart
    Given I load www.vodafone.com.au webpage
    And I click on "SHOP" link in the Home Page Global Header
    And I click on "MOBILE PHONES" in the Bundles Shop Menu
    When I select "APPLE" from filter
    And I click on shop button of Handset "purchaseiphone6s"
    And I click to select plan extras "Small"
    And I click to select insurance and warranty

    Then I click on checkout button
    And I select the type of customer "Join"
    And I click on continue
    And I enter all basic "customerdetails" details
    And I enter address for service and validate
    And I enter personal details