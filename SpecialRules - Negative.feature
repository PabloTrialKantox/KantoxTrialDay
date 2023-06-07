@SpecialRules @Negative
Feature: Special Rules
	As a user of the cashier system
	I want to validate special rules do not have any unwanted behaviour
	
	Background:
		Given configuration is set to default
		And user navigates to Cashier System page
		
	@Low
	Scenario Outline: Multiple Rules in same product
		When the user adds enough units of a single product to the cart
		And the user tries to apply "<Multiple>" discounts
		Then the product is added to cart with the right quantity
		And only the first discount is applied to the product
		And the price displays the discount correctly applied
		Examples:
			| Multiple        |
			| FirstAndSencond |
			| SecondAndThird  |
			| FirstAndThird   |
	
	# These following scenarios may not be necessary depending on implementation
	# but since from a logical point of view they are plausible, they have been included.
	
	@Mock @Low
	Scenario Outline: Impossible values for Buy In Bulk Fixed Price Rule
		When the user adds enough units of a single product to the cart
		And the user chooses "Buy In Bulk Fixed Price" discount
		And the user mocks the Fixed Price discount with "<Value>"
		Then the product is added to cart with the right quantity
		And no discount is applied
		And the proper error message appears
		Examples:
			| Value               |
			| Zero                |
			| Negative            |
			| GreaterThanOriginal |
	
	@Mock @Low
	Scenario Outline: Impossible values for Buy In Bulk Fixed Percentage Rule
		When the user adds enough units of a single product to the cart
		And the user chooses "Buy In Bulk Fixed Percentage" discount
		And the user mocks the Fixed Percentage discount with "<Value>"
		Then the product is added to cart with the right quantity
		And no discount is applied
		And the proper error message appears
		Examples:
			| Value           |
			| Zero            |
			| Negative        |
			| GreaterThan100% |