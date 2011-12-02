Given /^a (\w+) "([^\"]*)"$/ do |thing, name|
  Factory(thing.downcase.to_sym, :name => name)
end
