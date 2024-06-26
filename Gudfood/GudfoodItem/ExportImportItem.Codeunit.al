codeunit 50301 "PTE Export Import Item"
{
    procedure ExportItem(Rec: Record "PTE Gudfood Item")
    var
        ItemRec: Record "PTE GudFood Item";
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

    procedure ExportSelectedItems(Rec: Record "PTE Gudfood Item"; SelectedItems: Record "PTE Gudfood Item")
    var
        FileName: Text;
    begin
        FileName := 'selected_items_export.xml';
        TempBlob.CreateOutStream(OutStr);

        Xml.SetTableView(SelectedItems);
        Xml.SetDestination(OutStr);
        Xml.SetBase64Picture(SelectedItems);
        Xml.Export();

        TempBlob.CreateInStream(InStr);
        File.DownloadFromStream(InStr, downloadTxt, '', FileManagement.GetToFilterText('', FileName), FileName);
    end;

    procedure ImportItem()
    var
        DialogTitleTxt: Label 'Select the file to import...';
    begin
        if FileManagement.BLOBImport(TempBlob, DialogTitleTxt) = '' then
            Error('File import was canceled.');

        TempBlob.CreateInStream(InStr);
        Xml.SetSource(InStr);
        Xml.Import();
    end;

    var
        TempBlob: Codeunit "Temp Blob";
        FileManagement: Codeunit "File Management";
        Xml: XmlPort "PTE Export Gudfood Item";
        InStr: InStream;
        OutStr: OutStream;
        downloadTxt: Label 'Download', MaxLength = 999, Locked = false;
}