xmlport 50300 "PTE Export Gudfood Order"
{
    schema
    {
        textelement(Gudfood_Order)
        {
            tableelement(Order_Header; "PTE Gudfood Order Header")
            {
                fieldattribute("No."; Order_Header."No.") { }
                fieldattribute("Sell-to_Customer_No."; Order_Header."Sell-to Customer No.") { }
                fieldattribute("Sell-to_Customer_Name"; Order_Header."Sell-to Customer Name") { }
                fieldattribute("Order_date"; Order_Header."Order date") { }
                fieldattribute("Posting_No."; Order_Header."Posting No.") { }
                fieldattribute("Date_Created"; Order_Header."Date Created") { }
                fieldattribute("Total_Qty"; Order_Header."Total Qty") { }
                fieldattribute("Total_Amount"; Order_Header."Total Amount") { }

                tableelement(Order_Line; "PTE Gudfood Order Line")
                {
                    LinkTable = Order_Header;
                    LinkFields = "Order No." = field("No.");
                    fieldattribute("Order_No."; Order_Line."Order No.") { }
                    fieldattribute("Line_No."; Order_Line."Line No.") { }
                    fieldattribute("Sell-to_Customer_No."; Order_Line."Sell-to Customer No.") { }
                    fieldattribute("Date_Created"; Order_Line."Date Created") { }
                    fieldattribute("Item_No."; Order_Line."Item No.") { }
                    fieldattribute("Item_Type"; Order_Line."Item Type") { }
                    fieldattribute(Description; Order_Line.Description) { }
                    fieldattribute(Quantity; Order_Line.Quantity) { }
                    fieldattribute("Unit_Price"; Order_Line."Unit Price") { }
                    fieldattribute(Amount; Order_Line.Amount) { }
                }
            }
        }
    }
}