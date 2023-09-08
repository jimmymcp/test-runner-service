xmlport 79150 "Export Code Coverage JP"
{
    Format = VariableText;

    schema
    {
        textelement(Coverage)
        {
            tableelement("Code Coverage"; "Code Coverage")
            {
                XmlName = 'CodeCoverage';
                SourceTableView = sorting("Object Type", "Object ID", "Line No.");

                fieldelement(ObjectType; "Code Coverage"."Object Type")
                {
                }
                fieldelement(ObjectID; "Code Coverage"."Object ID")
                {
                }
                fieldelement(LineType; "Code Coverage"."Line Type")
                {
                }
                fieldelement(LineNo; "Code Coverage"."Line No.")
                {
                }
                fieldelement(Hits; "Code Coverage"."No. of Hits")
                {
                }
            }
        }
    }
}

