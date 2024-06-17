tableextension 50395 "PTE Gudfood Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50300; "PTE Gudfood Item Nos."; Code[20])
        {
            Caption = 'Gudfood Item Nos.';
            ToolTip = 'Specify the Gudfood Item Nos. value';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(50305; "PTE Gudfood Order Header Nos."; Code[20])
        {
            Caption = 'Gudfood Order Header Nos.';
            ToolTip = 'Specify the Gudfood Order Header Nos. value';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50310; "PTE Posted Gudfood Order Nos."; Code[20])
        {
            Caption = 'Posted Gudfood Order Nos.';
            ToolTip = 'Specify the Gudfood Posted Order Nos. value';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}