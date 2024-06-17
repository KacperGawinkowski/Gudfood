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
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order date"; Rec."Order date")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
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
