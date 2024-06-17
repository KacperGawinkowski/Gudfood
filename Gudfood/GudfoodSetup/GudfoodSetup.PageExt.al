pageextension 50395 "PTE Gudfood Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("PTE Gudfood Item Nos."; Rec."PTE Gudfood Item Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Gudfood Item Nos. value';
            }
            field("PTE Gudfood Header Nos."; Rec."PTE Gudfood Order Header Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Gudfood Order Header Nos. value';
            }

            field("PTE Posted Gudfood Header Nos."; Rec."PTE Posted Gudfood Order Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Gudfood Posted Order Nos. value';
            }
        }
    }
}