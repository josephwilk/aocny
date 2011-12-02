MONEY = Transform /\$(\d+)/ do |money|
  money.to_i
end