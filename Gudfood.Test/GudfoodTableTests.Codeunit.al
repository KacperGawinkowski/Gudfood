codeunit 50350 "PTE Gudfood Table Tests"
{
    Subtype = Test;

    trigger OnRun()
    begin
        CheckAndAssignNoSeries();
    end;

    local procedure CheckAndAssignNoSeries()
    var
        SalesReceivables: Record "Sales & Receivables Setup";
    begin
        //No Series for Gudfood Item
        SetNoSeries('GF', 'GF10000', 'GF99999');
        if SalesReceivables.Get() then begin
            SalesReceivables."PTE Gudfood Item Nos." := 'GF';
            SalesReceivables.Modify(true);
        end else begin
            SalesReceivables.Init();
            SalesReceivables."PTE Gudfood Item Nos." := 'GF';
            SalesReceivables.Insert(true);
        end;

        //No Series for Gudfood Order
        SetNoSeries('GFO', 'GFO10000', 'GFO99999');
        if SalesReceivables.Get() then begin
            SalesReceivables."PTE Gudfood Order Header Nos." := 'GFO';
            SalesReceivables.Modify(true);
        end else begin
            SalesReceivables.Init();
            SalesReceivables."PTE Gudfood Order Header Nos." := 'GFO';
            SalesReceivables.Insert(true);
        end;

        //No Series for Posted Gudfood Order
        SetNoSeries('GF', 'GFO-P10000', 'GFO-P99999');
        if SalesReceivables.Get() then begin
            SalesReceivables."PTE Posted Gudfood Order Nos." := 'GFO-P';
            SalesReceivables.Modify(true);
        end else begin
            SalesReceivables.Init();
            SalesReceivables."PTE Posted Gudfood Order Nos." := 'GFO-P';
            SalesReceivables.Insert(true);
        end;
    end;

    local procedure SetNoSeries(NoCode: Code[20]; StartingNo: Code[20]; EndingNo: Code[20])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        if not NoSeries.Get(NoCode) then begin
            NoSeries.Init();
            NoSeries.Code := NoCode;
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert(true);

            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := NoCode;
            NoSeriesLine."Starting No." := StartingNo;
            NoSeriesLine."Ending No." := EndingNo;
            NoSeriesLine.Insert(true);
        end;
    end;

    [Test]
    procedure TestNoSeriesForTables()
    var
        Item: Record "PTE Gudfood Item";
        Order: Record "PTE Gudfood Order Header";
        SalesReceivables: Record "Sales & Receivables Setup";
    begin
        SalesReceivables.Get();
        Assert.IsTrue(SalesReceivables."PTE Gudfood Item Nos." = 'GF', 'No Series for Item should have been assigned');
        Assert.IsTrue(SalesReceivables."PTE Gudfood Order Header Nos." = 'GFO', 'No Series for Order should have been assigned');
        Assert.IsTrue(SalesReceivables."PTE Posted Gudfood Order Nos." = 'GFO-P', 'No Series for Posted Order should have been assigned');

        Item.Init();
        Item.Insert(true);

        Order.Init();
        Order.Insert(true);

        Assert.IsTrue(Item."No." <> '', 'Item No. should be automatically assigned');
        Assert.IsTrue(Order."No." <> '', 'Order No. should be automatically assigned');
    end;

    [Test]
    procedure TestCreateItem()
    var
        Item: Record "PTE Gudfood Item";
        ItemCounter: Integer;
    begin
        Item.Init();
        ItemCounter := Item.Count();

        Item."No." := 'GF1232';
        Item.Description := 'Description';
        Item."Shelf Life" := 0D;
        Item.Type := "PTE Item Type"::Burger;
        Item."Unit Price" := 7.99;

        Item.Insert(true);
        Assert.IsTrue(Item.Count() = ItemCounter + 1, 'Item.Count should have increased by 1');

        Item.Delete(true);
        Assert.IsTrue(Item.Count() = ItemCounter, 'Item.Count should be back to original number');
    end;

    [Test]
    procedure TestCreateOrder()
    var
        Order: Record "PTE Gudfood Order Header";
        OrderCounter: Integer;
    begin
        Order.Init();
        OrderCounter := Order.Count();

        Order."No." := 'GFO1232';
        Order."Order date" := 0D;
        Order.Insert(true);
        Assert.IsTrue(Order.Count() = OrderCounter + 1, 'Order.Count should have increased by 1');

        Order.Delete(true);
        Assert.IsTrue(Order.Count() = OrderCounter, 'Order.Count should be back to original number');
    end;

    [Test]
    procedure TestPostOrder()
    var
        Order: Record "PTE Gudfood Order Header";
        PostedOrder: Record "PTE Posted GF Order Header";
        PostCodeunit: Codeunit "PTE Post Order";
        OrderCounter: Integer;
        PostedOrderCounter: Integer;
    begin
        Order.Init();
        OrderCounter := Order.Count();

        Order."No." := '1235';
        Order."Posting No." := 'GFO-P1234';
        Order."Order date" := 0D;
        Order.Insert(true);
        Assert.IsTrue(Order.Count() = OrderCounter + 1, 'Order.Count should have increased by 1');


        PostedOrderCounter := PostedOrder.Count();
        PostCodeunit.PostOrder(Order);
        Assert.IsTrue(Order.Count() = OrderCounter, 'Order.Count should have been back to original number');
        Assert.IsTrue(PostedOrder.Count() = PostedOrderCounter + 1, 'PostedOrder.Count should have increased by 1');

        PostedOrder.Get(Order."Posting No.");
        PostedOrder.Delete(true);
        Assert.IsTrue(PostedOrder.Count() = PostedOrderCounter, 'Posted.Count should have been back to original number');
    end;

    var
        Assert: Codeunit "Library Assert";
}