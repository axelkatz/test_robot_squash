# language: en
Feature: Cas de test 2 Axel

	Scenario Outline: Cas de test 2 Axel
		Given I have <available> cucumbers
		When I eat <eatable> cucumbers
		Then I have <remaining> cucumbers

		@JDD1
		Examples:
		| available | eatable | remaining |
		| 20 | 5 | 15 |

		@JDD2
		Examples:
		| available | eatable | remaining |
		| 5 | 2 | 3 |