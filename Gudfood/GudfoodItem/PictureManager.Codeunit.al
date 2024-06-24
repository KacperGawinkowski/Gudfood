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
        ConvertMediaToBase64(ItemRec);
        ItemRec.Modify();
    end;

    procedure ConvertMediaToBase64(var ItemRec: Record "PTE Gudfood Item")
    var
        ItemTenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        InStream: InStream;
        OutStream: OutStream;
        Result: Text;
        TempBlob: Codeunit "Temp Blob";
    begin
        ItemTenantMedia.Get(ItemRec.Picture.MediaId);
        ItemTenantMedia.CalcFields(Content);
        ItemTenantMedia.Content.CreateInStream(InStream, TextEncoding::UTF8);
        Result := Base64Convert.ToBase64(InStream, false);
        Message('Testing %1', Result);
        // ItemRec.PictureBase64.CreateOutStream(OutStream, TEXTENCODING::UTF16);
        // OutStream.Write(Result);

        // Convert Result text to binary and write to the blob field

        ItemRec.PictureBase64.CreateOutStream(OutStream);
        OutStream.Write(Result);

        ItemRec.Modify(true);
    end;
}