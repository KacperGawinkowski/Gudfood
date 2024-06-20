codeunit 50310 "PTE File Management"
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
        ItemRec.Modify();
    end;
}