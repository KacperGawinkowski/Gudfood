page 50300 "PTE Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Lists;
    CardPageId = "PTE Gudfood Item Card";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;


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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(FactBox; "PTE Photo Fact Box")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Export Item")
            {
                ApplicationArea = All;
                Caption = 'Export Item to XML';
                ToolTip = 'Export Item to XML file';
                Image = CreateXMLFile;

                trigger OnAction()
                begin
                    ExportImportItem.ExportItem(Rec);
                end;
            }

            action("Export Selected Items")
            {
                ApplicationArea = All;
                Caption = 'Export Selected Items To XML';
                ToolTip = 'Export Selected Items to XML file';
                Image = CreateXMLFile;

                trigger OnAction()
                var
                    SelectedItems: Record "PTE Gudfood Item";
                begin
                    CurrPage.SetSelectionFilter(SelectedItems);
                    ExportImportItem.ExportSelectedItems(Rec, SelectedItems);
                end;
            }

            action("Import Items")
            {
                ApplicationArea = All;
                Caption = 'Import Items';
                ToolTip = 'Imports items from the XML file';
                Image = Import;

                trigger OnAction()
                begin
                    ExportImportItem.ImportItem();
                end;
            }
        }
    }
    var
        ExportImportItem: Codeunit "PTE Export Import Item";
}
