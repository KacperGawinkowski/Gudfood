page 50330 "PTE Employee Gudfood RC"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Employee Gudfood Role Center';
    RefreshOnActivate = true;
    layout
    {
        area(RoleCenter)
        {
            part(HeadlinePart; "PTE Gudfood RC Headline")
            {
                ApplicationArea = All;
            }

            part(ItemsPart; "PTE Gudfood RC Items")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Item List")
            {
                Caption = 'Item List';
                ToolTip = 'Opens the Item List';
                ApplicationArea = All;
                RunObject = Page "PTE Gudfood Item List";
            }
            action("Add Order")
            {
                Caption = 'Add Order';
                ToolTip = 'Opens the form to add Order';
                ApplicationArea = All;
                RunObject = codeunit "PTE Create New Order From RC";
            }
        }
    }
}