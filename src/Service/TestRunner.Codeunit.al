codeunit 79151 "Test Runner JP"
{
    Subtype = TestRunner;
    TestIsolation = Codeunit;

    var
        TestName: Text;
        CodeunitIDFilter: Text;
        TestCodeunitId: Integer;
        FailedTests: Integer;

    trigger OnRun()
    var
        AllObj: Record AllObjWithCaption;
    begin
        if TestCodeunitId <> 0 then
            Codeunit.Run(TestCodeunitId)
        else
            if CodeunitIDFilter <> '' then begin
                AllObj.SetRange("Object Type", AllObj."Object Type"::Codeunit);
                AllObj.SetRange("Object Subtype", 'Test');
                AllObj.SetFilter("Object ID", CodeunitIDFilter);
                if AllObj.FindSet() then
                    repeat
                        Codeunit.Run(AllObj."Object ID");
                    until AllObj.Next() = 0;
            end;

        if FailedTests > 0 then
            Error('');
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
            if (TestCodeunitId = CodeunitId) and (FunctionName = TestName) then
                Error(GetLastErrorText() + '\ \' + GetLastErrorCallStack());

        if not Success then
            FailedTests += 1;
    end;

    procedure SetCodeunitId(CodeunitId2: Integer)
    begin
        TestCodeunitId := CodeunitId2;
    end;

    procedure SetCodeunitIDFilter(CodeunitIDFilter2: Text)
    begin
        CodeunitIDFilter := CodeunitIDFilter2;
    end;

    procedure SetTestName(TestName2: Text)
    begin
        TestName := TestName2;
    end;
}