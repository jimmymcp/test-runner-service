codeunit 79150 "Test Runner Service JP"
{
    procedure RunTest(CodeunitId: Integer; TestName: Text)
    var
        TestRunner: Codeunit "Test Runner JP";
    begin
        TestRunner.SetCodeunitId(CodeunitId);
        TestRunner.SetTestName(TestName);
        TestRunner.Run();
    end;
}