page 50326 "PTE Gudfood RC Headline"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;


    layout
    {
        area(content)
        {
            group(Headline)
            {
                ShowCaption = false;
                Visible = true;
                field(GreetingText; 'Welcome to Gudfood')
                {
                    ApplicationArea = All;
                    Caption = 'Welcome to Gudfood';
                    Editable = false;
                }
            }
        }
    }
}