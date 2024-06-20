page 50300 "PTE Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Lists;
    CardPageId = "PTE Gudfood Item Card";
    Editable = false; //for some reason it stopped disabling New,Edit,Delete actions on the list page
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    //And for some reason disallowing the inserting, deleting and modifying the list doesnt work also


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(FactBox; "PTE Photo Fact Box")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
