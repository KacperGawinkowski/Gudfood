codeunit 50300 "PTE Post Order"
{
    procedure PostOrder(Rec: Record "PTE Gudfood Order Header")
    var
        PostedOrderHeader: Record "PTE Posted GF Order Header";
        PostedOrderLine: Record "PTE Posted GF Order Line";
        OrderLine: Record "PTE Gudfood Order Line";
    begin
        //Should I lock the tables in the posting procedure?

        PostedOrderHeader.Init();
        PostedOrderHeader.TransferFields(Rec);
        PostedOrderHeader."Posting No." := Rec."Posting No.";
        // PostedOrderHeader.CheckAndAssignPostingNo();
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
}