report 50300 "PTE Gudfood Order"
{
    Caption = 'Gudfood Order Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WORDLayout;

    dataset
    {
        dataitem(OrderHeader; "PTE Gudfood Order Header")
        {
            column(Client_Code; "Sell-to Customer No.") { }
            column(Client_Name; "Sell-to Customer Name") { }
            column(Creation_Date; "Date Created") { }
            column(User_Id; UserId()) { }
            column(Total_Amount; "Total Amount") { }


            dataitem(OrderLines; "PTE Gudfood Order Line")
            {
                DataItemLinkReference = OrderHeader;
                DataItemLink = "Order No." = field("No.");

                column(Item_Code; "Item No.") { }
                column(Item_Type; "Item Type") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Price; "Unit Price") { }
                column(Amount; Amount) { }
            }
        }
    }


    rendering
    {
        layout(WORDLayout)
        {
            Type = Word;
            LayoutFile = 'WORDLayout.docx';
            Caption = 'WORD Layout';
            Summary = 'WORD Layout';
        }
    }
}