page 50327 "PTE Gudfood RC Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    //SourceTable = "PTE Gudfood Order Header";
    Caption = 'Order Cues';

    layout
    {
        area(Content)
        {
            cuegroup(Earnings)
            {
                CuegroupLayout = Wide;
                field("OrdersToday"; OrdersToday)
                {
                    Caption = 'Orders Today';
                    ToolTip = 'Displays the number of todays orders';
                }
                field("Items in order today"; ItemsInOrder)
                {
                    Caption = 'Items in order today';
                    ToolTip = 'Displays the number of items that are in order today';
                }
                // field("Earnings Yesterday"; YesterdayEarnings)
                // {
                //     Caption = 'Earnings Yesterday';
                //     ToolTip = 'Displays the total price of orders yesterday';
                //     ApplicationArea = All;
                //     StyleExpr = YesterdayEarningsStyle;

                // }

                // field("Average Day Earnings"; AverageEarnings)
                // {
                //     Caption = 'Earnings Avg. Day';
                //     ToolTip = 'Displays the total price of orders on an average day';
                //     ApplicationArea = All;
                // }
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
        OrderHeader.SetRange("Order date", Today);
        OrdersToday := OrderHeader.Count();

        if OrderHeader.FindSet() then
            repeat
                ItemsInOrder += OrderHeader."Total Qty";
            until OrderHeader.Next() = 0;
    end;
}