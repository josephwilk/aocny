Feature: Withdrawing cash

Scenario: Withdraw money
  Given I have a balance of $20
  When I withdraw $10
  Then I should have a balance of $10