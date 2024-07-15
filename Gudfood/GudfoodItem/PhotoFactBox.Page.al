page 50302 "PTE Photo Fact Box"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PTE Gudfood Item";
    Caption = 'Photo';

    layout
    {
        area(Content)
        {
            group(Photos)
            {
                field(Photo; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}