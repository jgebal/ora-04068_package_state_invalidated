Feature: Package with constants in it

  Scenario: Is raising ORA-04068 if it was used by session and got recompiled
    Given Package with constants exists
      And I have accessed the package
     When The package is recompiled in another session
     Then Accessing the package will raise ORA-04068 exception

  Scenario: Does not allow select statements to access the constants
    Given Package with constants exists
     Then Accessing the constant from a package raises ORA-06553 exception