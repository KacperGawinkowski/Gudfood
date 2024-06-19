page 50301 "PTE Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Documents;
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    //Why do I have to set the above properties to disallow inserting, deleting and modifying the Item List

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                }

                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ApplicationArea = All;
                }

                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            //Implement functionality to upload images when creating new items
            part(FactBox; "PTE Photo Fact Box") { }
        }
    }
}
