codeunit 50303 "PTE Export Import Order"
{
    procedure ExportOrder(Rec: Record "PTE Gudfood Order Header")
    var
        OrderRec: Record "PTE GudFood Order Header";
        FileName: Text;
    begin
        FileName := Rec."No." + '_export.xml';
        TempBlob.CreateOutStream(OutStr);
        OrderRec.SetFilter("No.", Rec."No.");

        Xml.SetTableView(OrderRec);
        Xml.SetDestination(OutStr);
        Xml.Export();

        TempBlob.CreateInStream(InStr);
        File.DownloadFromStream(InStr, downloadTxt, '', FileManagement.GetToFilterText('', FileName), FileName);
    end;

    procedure ExportOrders(Rec: Record "PTE Gudfood Order Header"; SelectedOrders: Record "PTE Gudfood Order Header")
    var
        FileName: Text;
    begin
        FileName := 'selected_orders_export.xml';
        TempBlob.CreateOutStream(OutStr);

        Xml.SetTableView(SelectedOrders);
        Xml.SetDestination(OutStr);
        Xml.Export();

        TempBlob.CreateInStream(InStr);
        File.DownloadFromStream(InStr, downloadTxt, '', FileManagement.GetToFilterText('', FileName), FileName);
    end;

    procedure ImportOrder()
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
        FileManagement: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        Xml: XmlPort "PTE Export Gudfood Order";
        InStr: InStream;
        OutStr: OutStream;
        downloadTxt: Label 'Download', MaxLength = 999, Locked = false;
}