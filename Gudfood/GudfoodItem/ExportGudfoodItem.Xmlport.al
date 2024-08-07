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
                textattribute(Picture_Base64)
                {
                    TextType = BigText;
                    Occurrence = Optional;
                }

                trigger OnAfterInsertRecord()
                var
                    PictureManager: Codeunit "PTE Picture Manager";
                begin
                    if Picture_Base64.Length > 0 then
                        PictureManager.ConvertBase64ToPicture(Item, Picture_Base64);
                end;

                trigger OnAfterGetRecord()
                var
                    PictureManager: Codeunit "PTE Picture Manager";
                begin
                    Clear(Picture_Base64);
                    if Item.Picture.HasValue then
                        Picture_Base64.AddText(PictureManager.GetPictureAsBase64(Item))
                end;
            }
        }
    }
}