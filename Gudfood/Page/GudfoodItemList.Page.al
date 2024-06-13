page 50300 "PTE Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Lists;
    CardPageId = "PTE Gudfood Item Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    Caption = 'Shelf Life';
                    ToolTip = 'Specifies the value of the Shelf Life field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    Caption = 'Picture';
                    ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
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
