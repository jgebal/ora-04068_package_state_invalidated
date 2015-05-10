Feature: Package with constants in it

  Scenario: Is raising ORA-04068 if it was used by session and got recompiled
    Given "package with constants" exists
      And I have accessed the "package with constants"
     When The package is recompiled in "other" session
     Then Accessing the package will raise ORA-04068 exception