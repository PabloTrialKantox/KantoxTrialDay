@Cashier
Feature: Cashier System
	As a user of the cashier system
	I want to validate that I can access elements in stock
	and see everything available in the page
	
	Background:
		Given configuration is set to default
	
	@Component @Fast  @Smoke @High
	Scenario: Product list is available
		When user navigates to Cashier System page
		Then Cashier System page is populated with Product List defined in configuration
	
	@Component @Fast  @Smoke @High
	Scenario: Special rules are available
		When user navigates to Cashier System page
		Then Cashier System page displays available Special Rules defined in configuration
		And they are available to be applied to orders in cart
		
	@Component @Data @Medium
	Scenario: All elements in list have mandatory all fields
		When user navigates to Cashier System page
		Then all entries in Cashier System page have all their fields populated correctly
		
	@Component @High
	Scenario: Cashier system elements are visible
		When user navigates to Cashier System page
		Then Cashier page elements are displayed properly
	
	@e2e @Fast @Smoke @High
	Scenario: A single product can be added
		When user navigates to Cashier System page
		And user adds a single unit of a random element
		Then cart displays the added element and its quantity correctly
	
	@e2e @Fast @Smoke @High
	Scenario: Multiple different products can be added
		When user navigates to Cashier System page
		And user adds a single unit of multiple random elements
		Then cart displays the added elements and its quantities correctly
	
	@e2e @Slow @High
	Scenario: User adds a random valid quantity of each available element
		When user navigates to Cashier System page
		And user adds a random valid quantity of each available element
		Then cart displays the added elements and its quantities correctly
	
	@Data @Slow @High
	Scenario: Items displayed in Cashier System match product list
		When user navigates to Cashier System page
		Then all products displayed in Cashier System are those from configuration
		And all products from configuration are those displayed in Cashier System
		# This last step is merely explanatory, code-wise it should be done in a single step.
	
	@Data @Medium
	Scenario Outline: Changes to configuration file are reflected
		When administrator alters configuration file by "<Change>"
		And user navigates to Cashier System page
		Then Cashier System displays information from updated configuration		
		Examples:
			| Change          |
			| ProductLocation |
			| RuleLocation    |
			| ProductContent  |
			| RuleContent     |
	
	@Data @High
	Scenario: Validate all products are in GBP
		When user navigates to Cashier System page
		Then Currency displayed in all prices is GBP