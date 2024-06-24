codeunit 50310 "PTE Picture Manager"
{
    procedure UploadFile(var ItemRec: Record "PTE Gudfood Item")
    var
        FileManagement: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        DialogTitleTxt: Label 'Select the file to upload...';
        PictureImportDescriptionTxt: Label 'I dont know for what this description is';

    begin
        FileManagement.BLOBImport(TempBlob, DialogTitleTxt);
        TempBlob.CreateInStream(InStream);
        ItemRec.Picture.ImportStream(InStream, PictureImportDescriptionTxt);
        SavePictureAsBase64(ItemRec);
        ItemRec.Modify();
    end;

    procedure SavePictureAsBase64(var ItemRec: Record "PTE Gudfood Item")
    var
        ItemTenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        InStream: InStream;
        OutStream: OutStream;
        Result: Text;
    begin
        ItemTenantMedia.Get(ItemRec.Picture.MediaId);
        ItemTenantMedia.CalcFields(Content);
        ItemTenantMedia.Content.CreateInStream(InStream, TextEncoding::UTF8);
        Result := Base64Convert.ToBase64(InStream, false);

        Clear(ItemRec.PictureBase64);
        ItemRec.PictureBase64.CreateOutStream(OutStream);
        OutStream.Write(Result);
        //ItemRec.Modify(true);
    end;

    procedure GetPictureBase64(ItemRec: Record "PTE Gudfood Item"): Text
    var
        InStream: InStream;
        StreamedText: Text;
    begin
        ItemRec.CalcFields(PictureBase64);
        ItemRec.PictureBase64.CreateInStream(InStream);
        InStream.Read(StreamedText);
        exit(StreamedText);
    end;

    procedure SetPictureBasedOnBase64(var ItemRec: Record "PTE Gudfood Item")
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        Filename: Text;
    begin
        Clear(ItemRec.Picture);
        Filename := ItemRec.Description + '.png';
        TempBlob.CreateOutStream(OutStream);
        Base64Convert.FromBase64(GetPictureBase64(ItemRec), OutStream);
        TempBlob.CreateInStream(InStream);
        ItemRec.Picture.ImportStream(InStream, Filename);
        ItemRec.Modify(true);
    end;
}