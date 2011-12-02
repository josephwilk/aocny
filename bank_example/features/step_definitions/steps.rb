Given /^I have a balance of (#{MONEY})$/ do |balance|
  cash_machine.set_balance(balance)
end

When /^I withdraw (#{MONEY})$/ do |balance|
  cash_machine.withdraw(balance)
end

Then /^I should have a balance of (#{MONEY})$/ do |balance|
  cash_machine.balance.should == balance
end