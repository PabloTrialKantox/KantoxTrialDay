@SpecialRules
Feature: Special Rules
	As a user of the cashier system
	I want to validate that I can benefit from special rules
	and they are properly applied
	
	Background:
		Given configuration is set to default
		And user navigates to Cashier System page
	
	@High
	Scenario: Buy One Get One Free Rule
		When the user adds "<Amount>" units of the same product to the cart
		And the user chooses "Buy One Get One Free" discount
		Then the product is added to cart with the right quantity
		And the price displays the discount correctly applied
		Examples:
			| Amount |
			| Two    |
			| Three  |
	
	@High
	Scenario: Buy In Bulk Fixed Price Rule
		When the user adds enough units of the same product to the cart
		And the user chooses "Buy In Bulk Fixed Price" discount
		Then the product is added to cart with the right quantity
		And the price displays the discount correctly applied
	
	@High
	Scenario: Buy in Bulk Percentage Price Rule
		When the user adds enough units of the same product to the cart
		And the user chooses "Buy in Bulk Percentage Price" discount
		Then the product is added to cart with the right quantity
		And the price displays the discount correctly applied
	
	@High
	Scenario Outline: Multiple Rules in multiple products
		When the user adds two products with enough units to be elligible for discounts
		And the user chooses "<DiscountType>" discounts for them
		Then the products are added to cart with the right quantity
		And the price displays the discount correctly applied to each product
		Examples:
			| DiscountType   |
			| FirstAndSecond |
			| SecondAndThird |
			| FirstAndThird  |
	
	@Limits @Medium
	Scenario: Buy In Bulk Fixed Price Rule - One unit below limit
		When the user adds one product with one fewer unit than necessary for the discount to be applied
		And the user tries to choose "Buy In Bulk Fixed Price"
		Then the products are added to cart with the right quantity
		And they are not allowed to pick the discount
		And the price displays the price without discount
	
	@Limits @Medium
	Scenario: Buy in Bulk Percentage Price Rule - One unit below limit
		When the user adds one product with one fewer unit than necessary for the discount to be applied
		And the user tries to choose "Buy in Bulk Percentage Price"
		Then the products are added to cart with the right quantity
		And they are not allowed to pick the discount
		And the price displays the price without discount
	
	@Limits @Medium
	Scenario: Buy One Get One Free - One unit below limit
		When the user adds "One" unit of a product to the cart
		And the user tries to choose "Buy One Get One Free" discount
		Then the product is added to cart with the right quantity
		And they are not allowed to pick the discount
		And the price displays the price without discount