page 50325 "PTE Gudfood Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Gudfood Role Center';

    layout
    {
        area(RoleCenter)
        {
            part(HeadlinePart; "PTE Gudfood RC Headline")
            {
                ApplicationArea = All;
            }
            part(GudfoodCues; "PTE Gudfood RC Cues")
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
            action("Add Item")
            {
                Caption = 'Add Item';
                ToolTip = 'Opens the Item Card Page';
                ApplicationArea = All;

                RunObject = codeunit "PTE Create New Item From RC";
            }
            action("Order List")
            {
                Caption = 'Order List';
                ToolTip = 'Opens the Order List';
                ApplicationArea = All;
                RunObject = Page "PTE Gudfood Orders List";
            }
        }
        area(Reporting)
        {
            action("Posted Orders")
            {
                Caption = 'Poster Orders';
                ToolTip = 'Opens the Posted Order List';
                ApplicationArea = All;
                RunObject = Page "PTE Posted GF Order List";
            }
            action("XML Export")
            {
                Caption = 'XML Export';
                ToolTip = 'Exports all orders';
                RunObject = xmlport "PTE Export Gudfood Order";
                ApplicationArea = All;
            }
        }
    }
}