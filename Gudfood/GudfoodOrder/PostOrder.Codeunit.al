codeunit 50300 "PTE Post Order"
{
    procedure PostOrder(Rec: Record "PTE Gudfood Order Header")
    var
        PostedOrderHeader: Record "PTE Posted GF Order Header";
        PostedOrderLine: Record "PTE Posted GF Order Line";
        OrderLine: Record "PTE Gudfood Order Line";
    begin
        CheckRequiredFieldsBeforePosting(Rec);

        PostedOrderHeader.Init();
        PostedOrderHeader.TransferFields(Rec);
        PostedOrderHeader."Posting No." := Rec."Posting No.";
        PostedOrderHeader."Posting Date" := Today;
        PostedOrderHeader.Insert(true);

        OrderLine.SetRange("Order No.", Rec."No.");

        if OrderLine.FindSet() then
            repeat
                PostedOrderLine.Init();
                PostedOrderLine.TransferFields(OrderLine);
                PostedOrderLine."Order No." := PostedOrderHeader."Posting No.";
                PostedOrderLine.Insert(true);
            until OrderLine.Next() = 0;

        Rec.Delete(true);
    end;


    local procedure CheckRequiredFieldsBeforePosting(Rec: Record "PTE Gudfood Order Header")
    var
        OrderLine: Record "PTE Gudfood Order Line";
        OrderDateErr: Label 'Order date has to be filled to post the Order';
        OrderCustomerNoErr: Label 'Customer No. has to be filled to post the Order';
        OrderLineCountErr: Label 'Cannot Post Order with no order lines';
        OrderLineItemNoErr: Label ' Cannot Post Order with no Items in the order lines';
        OrderLineQuantityErr: Label 'Cannot Post order with Quantity set to at least 1 in the order line';
    begin
        if Rec."Order date" = 0D then
            Error(OrderDateErr);

        if Rec."Sell-to Customer No." = '' then
            Error(OrderCustomerNoErr);

        OrderLine.SetRange("Order No.", Rec."No.");
        if OrderLine.FindSet() then
            repeat
                if (OrderLine."Item No." = '') then
                    Error(OrderLineItemNoErr);
                if (OrderLine.Quantity < 1) then
                    Error(OrderLineQuantityErr);
            until OrderLine.Next() = 0
        else
            Error(OrderLineCountErr);
    end;
}