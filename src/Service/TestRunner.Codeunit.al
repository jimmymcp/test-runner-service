codeunit 79151 "Test Runner JP"
{
    Subtype = TestRunner;
    TestIsolation = Codeunit;

    var
        TestName: Text;
        CodeunitId: Integer;

    trigger OnRun()
    begin
        Codeunit.Run(CodeunitId);
    end;

    trigger OnBeforeTestRun(CodeunitId: Integer; CodeunitName: Text; FunctionName: Text; Permissions: TestPermissions): Boolean
    begin
        if FunctionName = '' then
            exit(true);

        exit((FunctionName = TestName) or (TestName = ''));
    end;

    trigger OnAfterTestRun(CodeunitId: Integer; CodeunitName: Text; FunctionName: Text; Permissions: TestPermissions; Success: Boolean)
    begin
        if not Success then
            Error(GetLastErrorText() + '\ \' + GetLastErrorCallStack());
    end;

    procedure SetCodeunitId(CodeunitId2: Integer)
    begin
        CodeunitId := CodeunitId2;
    end;
    
    procedure SetTestName(TestName2: Text)
    begin
        TestName := TestName2;
    end;
}