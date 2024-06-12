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
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
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
                //Promoted = true;
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    OrderRec: Record "PTE GudFood Order Header";
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    XmlExport: XmlPort "PTE Export Gudfood Order";
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    FileName := Rec."No." + '_export.xml';
                    TempBlob.CreateOutStream(OutStr);
                    OrderRec.SetFilter("No.", Rec."No.");

                    XmlExport.SetTableView(OrderRec);
                    XmlExport.SetDestination(OutStr);
                    XmlExport.Export();

                    TempBlob.CreateInStream(InStr);
                    File.DownloadFromStream(InStr, 'Download &FileName', '', FileManagement.GetToFilterText('', FileName), FileName);
                end;
            }

            action("Export Selected Orders")
            {
                ApplicationArea = All;
                Caption = 'Export Selected To XML';
                ToolTip = 'Export Selected Orders to XML file';
                Image = CreateXMLFile;
                //Promoted = true;
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    OrderRec: Record "PTE GudFood Order Header";
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    XmlExport: XmlPort "PTE Export Gudfood Order";
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    CurrPage.SetSelectionFilter(OrderRec);
                    FileName := 'selected_orders_export.xml';
                    TempBlob.CreateOutStream(OutStr);

                    XmlExport.SetTableView(OrderRec);
                    XmlExport.SetDestination(OutStr);
                    XmlExport.Export();

                    TempBlob.CreateInStream(InStr);
                    File.DownloadFromStream(InStr, 'Download &FileName', '', FileManagement.GetToFilterText('', FileName), FileName);
                end;
            }
        }
    }
}
