Given /^I have expressed a want for "([^\"]*)" Workshop$/ do |workshop_name|
  want_automator.submit_a_want(:name => workshop_name)
end

When /^I express a want for a Workshop$/ do
  want_automator.submit_a_want
end

When /^I express a want for a Workshop with an invalid email$/ do
  want_automator.submit_a_want(:email => 'blah')
end

When /^I express another want for the Workshop$/ do
  want_automator.submit_a_want(:email => want_automator.previous_wants_email)
end

Then /^I should be marked as tracking the Workshop$/ do
  want_automator.should_be_tracking_the_workshop
end

Then /^I should see an error about my want saying my email is invalid$/ do
  want_automator.should have_error("Email is invalid")
end

Then /^I should see an error about my want saying I'm already registered for this workshop$/ do
  want_automator.should have_error("Email has already been registered")
end
