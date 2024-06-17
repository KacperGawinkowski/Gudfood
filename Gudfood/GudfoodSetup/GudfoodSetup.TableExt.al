tableextension 50395 "PTE Gudfood Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50300; "PTE Gudfood Item Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Gudfood Item Nos.';
            TableRelation = "No. Series";
        }

        field(50305; "PTE Gudfood Order Header Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Gudfood Order Header Nos.';
            TableRelation = "No. Series";
        }
        field(50310; "PTE Posted Gudfood Order Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Posted Gudfood Order Nos.';
            TableRelation = "No. Series";
        }
    }
}