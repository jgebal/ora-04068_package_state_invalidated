require_relative '../../config/common_helper'

Given(/^I have accessed a package containing constants$/) do
  plsql.package_with_constant.some_constant
end


When(/^The package is recompiled in "([^"]*)" session$/) do |session|
  pending
end

Then(/^Accessing the package will raise ORA-04068 exception$/) do
  pending
end

