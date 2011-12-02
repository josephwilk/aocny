Feature: Visitor indicates they want a workshop
  In order to organise a venue with sufficient capacity 
  I want users to indicate if they want to attend a workshop

  Background:
    Given a Workshop "The Art of Cucumber"

  Scenario: User expressing a want
    When I express a want for a Workshop
    Then I should be marked as tracking the Workshop

  Scenario: Bad email
    When I express a want for a Workshop with an invalid email
    Then I should see an error about my want saying my email is invalid

  Scenario: User has already expressed a want and tries again
    Given I have expressed a want for "The Art of Cucumber" Workshop
    When I express another want for the Workshop
	Then I should see an error about my want saying I'm already registered for this workshop