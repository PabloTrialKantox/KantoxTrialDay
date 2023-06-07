@Cashier @Negative
Feature: Cashier - Negative
	As a user of the cashier system
	I want to validate that the page does not perform unwanted actions
	
	Background:
		Given configuration is set to default
		
	@High
	Scenario: Products with more quantity than allowed can not be added to the cart
		Given user navigates to Cashier System page
		When the user tries to add to the cart a product with more quantity than allowed
		Then the proper error message appears
		And the product is not added to the cart
		
	@High
	Scenario: Same product can not be added twice
		Given user navigates to Cashier System page
		When the user tries to add the same product twice
		Then the proper error message appears
		And the product is not added to the cart
	
	@Medium
	Scenario Outline: Products missing mandatory fields do not appear
		Given the administrator modifies Configuration to add a product with "<MissingField>"
		When user navigates to Cashier System page
		Then the new element does not appear in Product List
		Examples:
			| MissingField |
			| ProductCode  |
			| Name         |
			| Price        |
	
	@Medium
	Scenario Outline: Products with invalid quantity can not be added to the cart
		Given user navigates to Cashier System page
		When the user tries to add to the cart a product with quantity set as "<InvalidQuantity>"
		Then the proper error message appears
		And the product is not added to the cart
		Examples:
			| InvalidQuantity |
			| Zero            |
			| Negative        |
	
	@Medium
	Scenario Outline: Products with invalid format quantity can not be added to the cart
		Given user navigates to Cashier System page
		When the user tries to add to the cart a product with quantity set as "<InvalidFormat>"
		Then the proper error message appears
		And the product is not added to the cart
		Examples: 
			| InvalidFormat |
			| NotInteger    |
			| NotANumber    |

	@Mock @Low
	Scenario: Products that do not appear in Cashier System can not be added to the cart
		Given user navigates to Cashier System page
		When the user mocks a request to add to the cart a product that is not in Configuration
		Then the proper error message appears
		And the product is not added to the cart
	
	@Mock @Low
	Scenario Outline: Products with invalid value for <Field> can not be added to the cart
		Given user navigates to Cashier System page
		When the user mocks a request to add to the cart an updated product missing "<MissingField>" 
		Then the proper error message appears
		And the product is not added to the cart
		Examples:
			| MissingField |
			| ProductCode  |
			| Name         |
			| Price        |
	
	@Mock @Low
	Scenario Outline: Products with wrong format can not be added to the cart
		Given user navigates to Cashier System page
		When the user mocks a request to add to the cart an updated product with invalid "<InvalidValue>" 
		Then the proper error message appears
		And the product is not added to the cart
		Examples:
			| InvalidValue |
			| ProductCode  |
			| Name         |
			| Price        |
			
	@Mock @Low
	Scenario: Products with different currency than GBP can not be added to the cart
		Given user navigates to Cashier System page
		When the user mocks a request to add to the cart a product with different currency than GBP
		Then the proper error message appears
		And the product is not added to the cart
	