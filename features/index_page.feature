Feature: Starting the OilTrader Game
			As a human player
			I want to start a new game


						Scenario: Visiting the homepage
							Given I am on the homepage
							Then I should see "Hello. Welcome to Oiltrader!"

            Scenario: Entering a name
              Given I am on the homepage
              Given I enter a name
              When I click the button
              Then I should redirect to trader page