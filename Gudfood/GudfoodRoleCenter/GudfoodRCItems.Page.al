page 50328 "PTE Gudfood RC Items"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "PTE Gudfood Item";
    Caption = 'Items with shelf life ending this week';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specifies the value of the Shelf Life field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        CurrentDayOfTheWeek: Integer;
        ThisFridayDate: Date;
    begin
        CurrentDayOfTheWeek := DATE2DWY(Today, 1);

        ThisFridayDate := Today + (5 - CurrentDayOfTheWeek);
        Rec.SetRange("Shelf Life", Today, ThisFridayDate);
    end;
}