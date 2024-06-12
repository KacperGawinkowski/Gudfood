page 50304 "PTE Posted GF Order Subpage"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order Subpage';
    PageType = ListPart;
    SourceTable = "PTE Posted GF Order Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    Caption = 'Item Type';
                    ToolTip = 'Specifies the value of the Item Type field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Caption = 'Date Created';
                    ToolTip = 'Specifies the value of the Date Created field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
