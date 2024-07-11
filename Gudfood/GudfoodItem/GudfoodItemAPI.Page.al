page 50315 "PTE Gudfood Item API"
{
    PageType = API;
    APIPublisher = 'kagaw';
    APIGroup = 'item';
    APIVersion = 'v1.0';
    EntityName = 'gudfoodItem';
    EntitySetName = 'gudfoodItems';
    SourceTable = "PTE Gudfood Item";
    DelayedInsert = true;
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(qtyOrdered; Rec."Qty. Ordered")
                {
                    Caption = 'Qty. Ordered';
                }
                field(qtyInOrder; Rec."Qty. in Order")
                {
                    Caption = 'Qty. in Order';
                }
                field(shelfLife; Rec."Shelf Life")
                {
                    Caption = 'Shelf Life';
                }
                // field(picture; Rec.Picture)
                // {
                //     Caption = 'Picture';
                // }
            }
        }
    }
}