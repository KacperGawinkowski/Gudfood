page 50301 "PTE Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    Caption = 'Shelf Life';
                    ToolTip = 'Specifies the value of the Shelf Life field.', Comment = '%';
                    ApplicationArea = All;
                }

                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    Caption = 'Qty. Ordered';
                    ToolTip = 'Specifies the value of the Qty. Ordered field.', Comment = '%';
                    ApplicationArea = All;
                }

                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    Caption = 'Qty. in Order';
                    ToolTip = 'Specifies the value of the Qty. in Order field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            part(FactBox; "PTE Photo Fact Box") { }
        }
    }
}
