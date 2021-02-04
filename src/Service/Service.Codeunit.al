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

    procedure GetCodeCoverage() Result: Text;
    var
        CodeCoverage: Codeunit "Code Coverage JP";
    begin
        if IsolatedStorage.Contains(CodeCoverage.CodeCoverageIsolatedStorageKey()) then
            IsolatedStorage.Get(CodeCoverage.CodeCoverageIsolatedStorageKey(), Result);

        exit(Result);
    end;
}