page 50307 "PTE Posted GF Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order List';
    PageType = List;
    SourceTable = "PTE Posted GF Order Header";
    UsageCategory = Lists;
    CardPageId = "PTE Posted GF Order";
    RefreshOnActivate = true;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Posting No."; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                    ToolTip = 'Specifies the value of the Posting No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Customer Card";

                    trigger OnDrillDown()
                    var
                        CustomerRec: Record Customer;
                        CustomerCard: Page "Customer Card";
                    begin
                        if CustomerRec.Get(Rec."Sell-to Customer No.") then begin
                            CustomerCard.SetRecord(CustomerRec);
                            CustomerCard.Run();
                        end;
                    end;
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
                    Caption = 'Total Qty';
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
        }
    }
}
