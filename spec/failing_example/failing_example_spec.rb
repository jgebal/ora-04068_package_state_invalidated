require_relative '../../spec/spec_helper'

describe 'Package with constants' do

  it 'should raise ORA-04068 when another session has the package recompiled' do
    #given I have accessed the package
    x = plsql.failing_example.an_important_name
    #when a package is recompiled by another session
    plsql(:other).execute('alter package failing_example compile')
    #then accessing the package again should raise ORA-04068

  end

end