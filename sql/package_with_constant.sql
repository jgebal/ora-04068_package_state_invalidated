CREATE OR REPLACE PACKAGE package_with_constant AS
   some_constant_with_name CONSTANT VARCHAR2(30) := 'this is the meaningfull name';
END package_with_constant;