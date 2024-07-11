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
                    PictureRemoveTxt: Label 'Are you sure yo uwant to remove picture from this Item?', Comment = '';
                    aTxt: Label 'Label %1 Text', Comment = 'Foo', MaxLength = 999, Locked = true;
                    Result: Boolean;
                begin
                    Result := Dialog.Confirm(PictureRemoveTxt, true, aTxt);
                    if Result then begin
                        Clear(Rec.Picture);
                        Rec.Modify();
                    end;
                end;
            }
        }
    }
}
