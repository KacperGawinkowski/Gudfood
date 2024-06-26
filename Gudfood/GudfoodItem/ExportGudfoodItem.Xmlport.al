xmlport 50301 "PTE Export Gudfood Item"
{
    schema
    {
        textelement(Gudfood_Item)
        {
            tableelement(Item; "PTE Gudfood Item")
            {
                fieldattribute("No."; Item."No.") { }
                fieldattribute("Description"; Item.Description) { }
                fieldattribute("Unit_Price"; Item."Unit Price") { }
                fieldattribute("Type"; Item.Type) { }
                fieldattribute("Quantity_Ordered"; Item."Qty. Ordered") { }
                fieldattribute("Quantity_in_Order"; Item."Qty. in Order") { }
                fieldattribute("Shelf_Life"; Item."Shelf Life") { }
                textelement(Picture_Base64)
                {
                    TextType = BigText;
                }

                trigger OnAfterInsertRecord()
                var
                    PictureManager: Codeunit "PTE Picture Manager";
                begin
                    if Picture_Base64.Length > 0 then
                        PictureManager.ConvertBase64ToPicture(Item, Picture_Base64);
                end;
            }
        }
    }

    procedure SetBase64Picture(ItemRec: Record "PTE Gudfood Item")
    var
        PictureManager: Codeunit "PTE Picture Manager";
    begin
        if ItemRec.Picture.HasValue then begin
            Clear(Picture_Base64);
            Picture_Base64.AddText(PictureManager.GetPictureAsBase64(ItemRec));
        end;
    end;

    procedure GetBase64Picture(): BigText
    begin
        exit(Picture_Base64);
    end;
}