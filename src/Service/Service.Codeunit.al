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

    procedure GetTableIDFromName(TableName: Text): Integer
    var
        AllObj: Record AllObj;
    begin
        AllObj.SetRange("Object Type", AllObj."Object Type"::Table);
        AllObj.SetFilter("Object Name", StrSubstNo('@%1', TableName));
        AllObj.FindFirst();

        exit(AllObj."Object ID");
    end;
}