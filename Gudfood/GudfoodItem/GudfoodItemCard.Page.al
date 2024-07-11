page 50301 "PTE Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "PTE Gudfood Item";
    UsageCategory = Documents;

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
            part(FactBox; "PTE Photo Fact Box")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Upload Picture")
            {
                Caption = 'Upload Picture';
                ToolTip = 'Upload a picture for this item.';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    UploadMng: Codeunit "PTE Picture Manager";
                begin
                    UploadMng.UploadFile(Rec);
                    CurrPage.Update(false);
                end;
            }

            action("Remove Picture")
            {
                Caption = 'Remove Picture';
                ToolTip = 'Removes this items picture.';
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                var
                    UserCreationTxt: Label 'User %1 doesn''t exist, would you like to create a new user?', Comment = 'Specifies the userId that will be displayed in the question';
                    aTxt: Label 'Label %1 Text', Comment = 'Foo', MaxLength = 999, Locked = true;
                    Result: Boolean;
                begin
                    Result := Dialog.Confirm(UserCreationTxt, true, aTxt);
                    if Result then
                        Page.Run(Page::"User Card");
                    // Clear(Rec.Picture);
                    // Rec.Modify();
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
    begin
        Message('%1', CalcDate('<-CM>', WorkDate()));
    end;
}
