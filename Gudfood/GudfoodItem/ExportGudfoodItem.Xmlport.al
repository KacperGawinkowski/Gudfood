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
                //TODO:
                //Store the Picture of an item by encoding it to Base64 format
            }
        }
    }
}