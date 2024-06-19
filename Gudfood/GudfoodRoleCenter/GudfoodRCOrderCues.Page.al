page 50327 "PTE Gudfood RC Order Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    //SourceTable = "PTE Gudfood Order Header";
    Caption = 'Orders & Items';

    layout
    {
        area(Content)
        {
            cuegroup(CueGroup1)
            {
                Caption = ' ';

                field("OrdersToday"; OrdersToday)
                {
                    Caption = 'Orders Today';
                    ToolTip = 'Displays the number of todays orders';
                    //Could be clickable and open the list only with todays orders
                }
                field("Items in order today"; ItemsInOrder)
                {
                    Caption = 'Items in order today';
                    ToolTip = 'Displays the number of items that are in order today';
                }
            }
        }
    }

    var
        OrdersToday: Integer;
        ItemsInOrder: Integer;

    trigger OnOpenPage()
    var
        OrderHeader: Record "PTE Gudfood Order Header";
    begin
        ItemsInOrder := 0;
        OrderHeader.SetRange("Order date", Today);
        OrdersToday := OrderHeader.Count();


        OrderHeader.SetAutoCalcFields("Total Qty");
        if OrderHeader.FindSet() then
            repeat
                //OrderHeader.CalcFields("Total Qty");
                ItemsInOrder += OrderHeader."Total Qty";
            until OrderHeader.Next() = 0;
    end;
}