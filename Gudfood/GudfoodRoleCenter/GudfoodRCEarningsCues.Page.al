page 50329 "PTE Gudfood RC Earnings Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    //SourceTable = "PTE Gudfood Order Header";
    Caption = 'Earnings';

    layout
    {
        area(Content)
        {
            cuegroup(CueGroup2)
            {
                CuegroupLayout = Wide;
                field("Total Items Price this month"; TotalItemsPriceThisMonth)
                {
                    Caption = 'Total Items Price this month';
                    ToolTip = 'Displays the total items price this month';
                }
                field("Total Items Price previous month"; TotalItemsPricePrevMonth)
                {
                    Caption = 'Total Items Price previous month';
                    ToolTip = 'Displays the total items price previous month';
                }
                field("Total Items Price Avg per month"; TotalItemsPriceAvgMonth)
                {
                    Caption = 'Total Items Price Avg per month';
                    ToolTip = 'Displays the total items price in an average month';
                }
            }
        }
    }

    var
        TotalItemsPriceThisMonth: Decimal;
        TotalItemsPricePrevMonth: Decimal;
        TotalItemsPriceAvgMonth: Decimal;

    trigger OnOpenPage()
    var
        OrderHeader: Record "PTE Gudfood Order Header";
        CurrentMonthStartDate: Date;
        CurrentMonthEndDate: Date;
    begin
        OrderHeader.SetRange("Order date", Today);


        OrderHeader.SetAutoCalcFields("Total Amount");

        CurrentMonthStartDate := CalcDate('<-CM>', Today);
        CurrentMonthEndDate := CalcDate('<CM>', Today);
        OrderHeader.SetRange("Order date", CurrentMonthStartDate, CurrentMonthEndDate);
        if OrderHeader.FindSet() then
            repeat
                //OrderHeader.CalcFields("Total Qty");
                TotalItemsPriceThisMonth += OrderHeader."Total Amount";
            until OrderHeader.Next() = 0;
    end;
}