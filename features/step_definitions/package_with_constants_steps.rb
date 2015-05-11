require_relative '../../config/common_helper'

def recreate_package_specification( constant_value )
  plsql(:other).execute <<-SQL
    CREATE OR REPLACE PACKAGE package_with_constants AS
       some_constant    CONSTANT VARCHAR2(30) := '#{constant_value}'||'';
    END;
  SQL
end

def drop_package_with_constants
  plsql.execute <<-SQL
   DROP PACKAGE package_with_constants
  SQL
end

Given(/^Package with constants exists$/) do
  recreate_package_specification( 'some constant value' )
end

And(/^I have accessed the package$/) do
  expect( plsql.package_with_constants.some_constant ).to eq('some constant value')
end


When(/^The package is recompiled in another session$/) do
  recreate_package_specification( 'different constant value' )
end

Then(/^Accessing the package will raise ORA-04068 exception$/) do
  expect{
    plsql.package_with_constants.some_constant
  }.to raise_exception(/ORA-04068/)
end


Then(/^Accessing the constant from a package raises ORA-06553 exception$/) do
  expect{
    plsql.select_one('SELECT package_with_constants.some_constant FROM dual')
  }.to raise_exception(/ORA-06553/)
end

After do |s|
  drop_package_with_constants
end