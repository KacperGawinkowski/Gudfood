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
                    StyleExpr = ThisMonthStyle;
                }
                field("Total Items Price previous month"; TotalItemsPricePrevMonth)
                {
                    Caption = 'Total Items Price previous month';
                    ToolTip = 'Displays the total items price previous month';
                    StyleExpr = PrevMonthStyle;
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
        ThisMonthStyle: Text;
        TotalItemsPricePrevMonth: Decimal;
        PrevMonthStyle: Text;
        TotalItemsPriceAvgMonth: Decimal;

    trigger OnOpenPage()
    var
        CurrentMonthStartDate: Date;
        CurrentMonthEndDate: Date;
        PrevMonthStartDate: Date;
        PrevMonthEndDate: Date;
        DateOfFirstOrder: Date;
        MonthsBetween: Integer;
    begin
        CurrentMonthStartDate := CalcDate('<-CM>', Today);
        CurrentMonthEndDate := CalcDate('<CM>', Today);
        TotalItemsPriceThisMonth := GetEarningsBetween2Dates(CurrentMonthStartDate, CurrentMonthEndDate);

        PrevMonthStartDate := CalcDate('<-1M-CM>', Today);
        PrevMonthEndDate := CalcDate('<-1M+CM>', Today);
        TotalItemsPricePrevMonth := GetEarningsBetween2Dates(PrevMonthStartDate, PrevMonthEndDate);

        DateOfFirstOrder := GetDateOfFirstOrder();
        if DateOfFirstOrder <> 0D then begin
            MonthsBetween := Date2DMY(Today, 2) - Date2DMY(DateOfFirstOrder, 2) + 12 * (Date2DMY(Today, 3) - Date2DMY(DateOfFirstOrder, 3));
            TotalItemsPriceAvgMonth := GetEarningsBetween2Dates(DateOfFirstOrder, PrevMonthEndDate) / MonthsBetween;

            ThisMonthStyle := GetEarningsStyle(TotalItemsPriceThisMonth);
            PrevMonthStyle := GetEarningsStyle(TotalItemsPricePrevMonth);
        end;

    end;

    local procedure GetEarningsBetween2Dates(DateFrom: Date; DateTo: Date): Decimal
    var
        Order: Record "PTE Gudfood Order Header";
        //OrderLine: Record "PTE Gudfood Order Line";
        Sum: Decimal;
    begin
        Order.SetRange("Order Date", DateFrom, DateTo);
        Order.SetAutoCalcFields("Total Amount");
        if Order.FindSet() then
            repeat
                Sum += Order."Total Amount";
            until Order.Next() = 0;
        exit(Sum);
    end;

    local procedure GetDateOfFirstOrder(): Date
    var
        Order: Record "PTE Gudfood Order Header";
    begin
        Order.SetCurrentKey("Order date");
        Order.Ascending(true);

        if Order.FindFirst() then
            exit(Order."Order date")
        else
            exit(0D);
    end;

    procedure GetEarningsStyle(Value: Decimal): Text
    begin
        if Value >= TotalItemsPriceAvgMonth then
            exit('Favorable')
        else
            exit('Ambiguous');
    end;
}