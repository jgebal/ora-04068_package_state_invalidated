require_relative '../../config/common_helper'

Given(/^"([^"]*)" exists$/) do |package_name|
  pending
end

And(/^I have accessed the "([^"]*)"$/) do |package_name|
  plsql.package_with_constant.some_constant
end


When(/^The package is recompiled in "([^"]*)" session$/) do |session|
  pending
end

Then(/^Accessing the package will raise ORA-04068 exception$/) do
  pending
end


