page 50309 "PTE Posted GF Order"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Posted Gudfood Order';
    PageType = Document;
    SourceTable = "PTE Posted GF Order Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Posting No."; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                    ToolTip = 'Specifies the value of the Posting No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Order date"; Rec."Order date")
                {
                    Caption = 'Order Date';
                    ToolTip = 'Specifies the value of the Order date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Caption = 'Date Created';
                    ToolTip = 'Specifies the value of the Date Created field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    Caption = 'Total Quantity';
                    ToolTip = 'Specifies the value of the Total Qty field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                    ApplicationArea = All;
                }
            }

            group("Ordered Items")
            {
                Caption = 'Ordered Items';
                part("Order Items"; "PTE Posted GF Order Subpage")
                {
                    ApplicationArea = All;
                    SubPageLink = "Order No." = FIELD("Posting No.");
                    UpdatePropagation = Both;
                }
            }
        }
    }
}
