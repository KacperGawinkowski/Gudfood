page 50300 "PTE Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Lists;
    CardPageId = "PTE Gudfood Item Card";
    Editable = false; //for some reason it stopped disabling New,Edit,Delete actions on the list page
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    //And for some reason disallowing the inserting, deleting and modifying the list doesnt work also


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
                var
                    ItemRec: Record "PTE GudFood Item";
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    Xml: XmlPort "PTE Export Gudfood Item";
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    FileName := Rec."No." + '_export.xml';
                    TempBlob.CreateOutStream(OutStr);
                    ItemRec.SetFilter("No.", Rec."No.");

                    Xml.SetTableView(ItemRec);
                    Xml.SetDestination(OutStr);
                    xml.SetBase64Picture(Rec);
                    Xml.Export();

                    TempBlob.CreateInStream(InStr);
                    File.DownloadFromStream(InStr, downloadTxt, '', FileManagement.GetToFilterText('', FileName), FileName);
                end;
            }

            action("Export Selected Items")
            {
                ApplicationArea = All;
                Caption = 'Export Selected Items To XML';
                ToolTip = 'Export Selected Items to XML file';
                Image = CreateXMLFile;
                //Promoted = true;
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    ItemRec: Record "PTE GudFood Item";
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    Xml: XmlPort "PTE Export Gudfood Item";
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    CurrPage.SetSelectionFilter(ItemRec);
                    FileName := 'selected_items_export.xml';
                    TempBlob.CreateOutStream(OutStr);

                    Xml.SetTableView(ItemRec);
                    Xml.SetDestination(OutStr);
                    xml.SetBase64Picture(Rec);
                    Xml.Export();

                    TempBlob.CreateInStream(InStr);
                    File.DownloadFromStream(InStr, downloadTxt, '', FileManagement.GetToFilterText('', FileName), FileName);
                end;
            }

            action("Import Items")
            {
                ApplicationArea = All;
                Caption = 'Import Items';
                ToolTip = 'Imports items from the XML file';
                Image = Import;

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    PictureManager: Codeunit "PTE Picture Manager";
                    Xml: XmlPort "PTE Export Gudfood Item";
                    Base64Text: BigText;
                    InStr: InStream;
                    DialogTitleTxt: Label 'Select the file to import...';
                begin
                    if FileManagement.BLOBImport(TempBlob, DialogTitleTxt) = '' then
                        Error('File import was canceled.');

                    TempBlob.CreateInStream(InStr);
                    Xml.SetSource(InStr);
                    Xml.Import();
                    Base64Text := xml.GetBase64Picture();
                    if Base64Text.Length > 0 then
                        PictureManager.ConvertBase64ToPicture(Rec, Base64Text);
                end;
            }
        }
    }
    var
        downloadTxt: Label 'Download', MaxLength = 999, Locked = false;
}
