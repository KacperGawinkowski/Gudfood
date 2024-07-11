codeunit 50310 "PTE Picture Manager"
{
    procedure UploadFile(var ItemRec: Record "PTE Gudfood Item")
    var
        FileManagement: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        DialogTitleTxt: Label 'Select the file to upload...';
        PictureImportDescriptionTxt: Label 'Picture file will be used as an image of the Item';

    begin
        FileManagement.BLOBImport(TempBlob, DialogTitleTxt);
        TempBlob.CreateInStream(InStream);
        ItemRec.Picture.ImportStream(InStream, PictureImportDescriptionTxt);
        ItemRec.Modify();
    end;

    procedure GetPictureAsBase64(var ItemRec: Record "PTE Gudfood Item"): Text
    var
        ItemTenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        InStream: InStream;
        Result: Text;
    begin
        ItemTenantMedia.Get(ItemRec.Picture.MediaId);
        ItemTenantMedia.CalcFields(Content);
        ItemTenantMedia.Content.CreateInStream(InStream, TextEncoding::UTF8);
        Result := Base64Convert.ToBase64(InStream, false);

        exit(Result);
    end;

    procedure ConvertBase64ToPicture(var ItemRec: Record "PTE Gudfood Item"; Base64: BigText)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        Filename: Text;
        Base64Text: Text;
    begin
        Clear(ItemRec.Picture);
        Filename := ItemRec.Description + '.png';
        TempBlob.CreateOutStream(OutStream);
        Base64.GetSubText(Base64Text, 1, Base64.Length);
        Base64Convert.FromBase64(Base64Text, OutStream);
        TempBlob.CreateInStream(InStream);
        ItemRec.Picture.ImportStream(InStream, Filename);
        ItemRec.Modify(true);
    end;
}