table 79150 "Performance Profiler Data"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
        }
        field(10; Data; Blob)
        {
            Caption = 'Data';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    internal procedure SetData(InStream: InStream)
    var
        OutStream: OutStream;
    begin
        if not Get() then
            Insert();

        Data.CreateOutStream(OutStream);
        CopyStream(OutStream, InStream);
        Modify();
    end;

    internal procedure GetData(): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        InStream: InStream;
    begin
        Get();
        CalcFields(Data);
        Data.CreateInStream(InStream);
        exit(Base64Convert.ToBase64(InStream));
    end;
}