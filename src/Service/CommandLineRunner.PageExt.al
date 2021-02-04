pageextension 79150 "Command Line Runner JP" extends "Command Line Test Tool"
{
    layout
    {
        modify(ExtensionId)
        {
            trigger OnAfterValidate()
            var
                CodeCoverage: Codeunit "Code Coverage JP";
                CodeCoverageMgt: Codeunit "Code Coverage Mgt.";
            begin
                CodeCoverage.ClearCodeCoverage();
                CodeCoverageMgt.Clear();
                CodeCoverageMgt.Start(false);
            end;
        }
    }

    trigger OnClosePage()
    var
        CodeCoverage: Codeunit "Code Coverage JP";
        CodeCoverageMgt: Codeunit "Code Coverage Mgt.";
    begin
        CodeCoverageMgt.Refresh();
        CodeCoverage.SaveCodeCoverage();
    end;
}