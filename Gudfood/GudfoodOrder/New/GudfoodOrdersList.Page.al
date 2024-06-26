page 50306 "PTE Gudfood Orders List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order List';
    PageType = List;
    SourceTable = "PTE Gudfood Order Header";
    UsageCategory = Lists;
    CardPageId = "PTE Gudfood Order";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
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
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
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
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Export Order")
            {
                ApplicationArea = All;
                Caption = 'Export To XML';
                ToolTip = 'Export Order to XML file';
                Image = CreateXMLFile;

                trigger OnAction()
                begin
                    ExportImportOrder.ExportOrder(Rec);
                end;
            }

            action("Export Selected Orders")
            {
                ApplicationArea = All;
                Caption = 'Export Selected To XML';
                ToolTip = 'Export Selected Orders to XML file';
                Image = CreateXMLFile;

                trigger OnAction()
                var
                    SelectedOrders: Record "PTE Gudfood Order Header";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);
                    ExportImportOrder.ExportOrders(Rec, SelectedOrders);
                end;
            }

            action("Import Orders")
            {
                ApplicationArea = All;
                Caption = 'Import Orders';
                ToolTip = 'Imports Orders from the XML file';
                Image = Import;

                trigger OnAction()
                begin
                    ExportImportOrder.ImportOrder();
                end;
            }
        }
    }
    var
        ExportImportOrder: Codeunit "PTE Export Import Order";
}
