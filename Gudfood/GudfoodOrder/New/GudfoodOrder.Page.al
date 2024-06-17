page 50303 "PTE Gudfood Order"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Gudfood Order';
    PageType = Document;
    SourceTable = "PTE Gudfood Order Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Order date"; Rec."Order date")
                {
                    ToolTip = 'Specifies the value of the Order date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTip = 'Specifies the value of the Posting No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies the value of the Date Created field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specifies the value of the Total Qty field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                    ApplicationArea = All;
                }
            }

            group("Ordered Items")
            {
                Caption = 'Ordered Items';
                part("Order Items"; "PTE Gudfood Order Subpage")
                {
                    ApplicationArea = All;
                    SubPageLink = "Order No." = FIELD("No.");
                    UpdatePropagation = Both;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                ToolTip = 'Posts Gudfood order';

                trigger OnAction()
                begin
                    //PostOrder();
                    PostOrder();
                    Rec.Delete();
                end;
            }
        }
        area(Reporting)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ToolTip = 'Prints the order';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    if Rec.FindFirst() then
                        Report.Run(Report::"PTE Gudfood Order", true, true, Rec);
                end;
            }
        }
    }

    //Old Posting procedure
    // procedure PostOrder()
    // var
    //     OrderConverter: Codeunit "PTE Order To Posted Order";
    // begin
    //     OrderConverter.PostOrder(Rec);


    //     Message('Order Posted');
    // end;


    procedure PostOrder()
    var
        PostedOrderHeader: Record "PTE Posted GF Order Header";
        PostedOrderLine: Record "PTE Posted GF Order Line";
        OrderLine: Record "PTE Gudfood Order Line";
    begin
        PostedOrderHeader.Init();
        PostedOrderHeader.TransferFields(Rec);
        PostedOrderHeader."Posting No." := Rec."Posting No.";
        PostedOrderHeader.CheckAndAssignPostingNo();
        PostedOrderHeader."Posting Date" := Today;
        PostedOrderHeader.Insert();

        OrderLine.SetRange("Order No.", Rec."No.");

        if OrderLine.FindSet() then
            repeat
                PostedOrderLine.Init();
                PostedOrderLine.TransferFields(OrderLine);
                PostedOrderLine."Order No." := PostedOrderHeader."Posting No.";
                PostedOrderLine.Insert();
            until OrderLine.Next() = 0;
    end;
}
