require_relative '../../spec/spec_helper'

describe 'Package with constants' do

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

  before(:all) do
    recreate_package_specification('some constant value')
  end

  after(:all) do
    drop_package_with_constants
  end

  it 'should raise ORA-04068 when another session has the package recompiled' do
    expect( plsql.package_with_constants.some_constant ).to eq('some constant value')

    recreate_package_specification( 'different constant value' )

    expect{ plsql.package_with_constants.some_constant }.to raise_exception(/ORA-04068/)
  end

  it 'should raise  ORA-06553 when accessing the constant from select statement' do
    expect{
      plsql.select_one('SELECT package_with_constants.some_constant FROM dual')
    }.to raise_exception(/ORA-06553/)
  end

end