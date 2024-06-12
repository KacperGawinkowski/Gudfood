page 50302 "PTE Photo Fact Box"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PTE Gudfood Item";

    layout
    {
        area(Content)
        {
            group(Photos)
            {
                field(Photo; Rec.Picture)
                {
                    Caption = 'Picture';
                    ToolTip = 'Specifies the picture of the item.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}