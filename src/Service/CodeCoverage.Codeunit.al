codeunit 79152 "Code Coverage JP"
{
    procedure SaveCodeCoverage()
    var
        CodeCoverage: Record "Code Coverage";
        TempBlob: Codeunit "Temp Blob";
        BigT: BigText;
        OutStr: OutStream;
        InStr: InStream;
        Result: Text;
    begin
        CodeCoverage.SetFilter("Object ID", '%1..%2|%3..%4', 50000, 99999, 1000000, 74999999);

        TempBlob.CreateOutStream(OutStr);
        Xmlport.Export(Xmlport::"Export Code Coverage JP", OutStr, CodeCoverage);
        TempBlob.CreateInStream(InStr);
        BigT.Read(InStr);
        BigT.GetSubText(Result, 1);

        IsolatedStorage.Set(CodeCoverageIsolatedStorageKey(), Result);
    end;

    procedure ClearCodeCoverage()
    var
    begin
        if IsolatedStorage.Contains(CodeCoverageIsolatedStorageKey()) then
            IsolatedStorage.Delete(CodeCoverageIsolatedStorageKey());
    end;

    procedure CodeCoverageIsolatedStorageKey(): Text
    var
        CodeCoverageLbl: Label 'CodeCoverage', Locked = true;
    begin
        exit(CodeCoverageLbl);
    end;
}