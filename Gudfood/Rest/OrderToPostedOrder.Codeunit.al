//Old posting codeunit

// codeunit 50300 "PTE Order To Posted Order"
// {
//     procedure PostOrder(OrderRec: Record "PTE Gudfood Order Header")
//     var
//         PostedOrder: Record "PTE Posted GF Order Header";
//         PostedOrderLine: Record "PTE Posted GF Order Line";
//         OrderLine: Record "PTE Gudfood Order Line";
//     begin
//         //Copying Order Header
//         PostedOrder.Init();
//         PostedOrder."Posting No." := OrderRec."Posting No.";
//         PostedOrder.CheckAndAssignPostingNo();

//         PostedOrder."Sell-to Customer No." := OrderRec."Sell-to Customer No.";
//         PostedOrder."Sell-to Customer Name" := OrderRec."Sell-to Customer Name";
//         PostedOrder."Order date" := OrderRec."Order date";
//         PostedOrder."Date Created" := OrderRec."Date Created";
//         PostedOrder."Posting Date" := Today;
//         PostedOrder."Total Qty" := OrderRec."Total Qty";
//         PostedOrder."Total Amount" := OrderRec."Total Amount";

//         PostedOrder.Insert();

//         //Copying Order Lines
//         OrderLine.SetRange("Order No.", OrderRec."No.");

//         if OrderLine.FindSet() then
//             repeat
//                 PostedOrderLine.Init();
//                 PostedOrderLine."Order No." := PostedOrder."Posting No.";
//                 PostedOrderLine."Line No." := OrderLine."Line No.";
//                 PostedOrderLine."Sell-to Customer No." := OrderLine."Sell-to Customer No.";
//                 PostedOrderLine."Date Created" := OrderLine."Date Created";
//                 PostedOrderLine."Item No." := OrderLine."Item No.";
//                 PostedOrderLine."Item Type" := OrderLine."Item Type";
//                 PostedOrderLine.Description := OrderLine.Description;
//                 PostedOrderLine.Quantity := OrderLine.Quantity;
//                 PostedOrderLine."Unit Price" := OrderLine."Unit Price";
//                 PostedOrderLine."Amount" := OrderLine."Amount";

//                 PostedOrderLine.Insert();
//             until OrderLine.Next() = 0;


//         //Deleting Original Order Lines and Order Header
//         OrderLine.SetRange("Order No.", OrderRec."No.");
//         if OrderLine.FindSet() then
//             repeat
//                 OrderLine.Delete();
//             until OrderLine.Next() = 0;

//         OrderRec.Delete(true);
//     end;
// }