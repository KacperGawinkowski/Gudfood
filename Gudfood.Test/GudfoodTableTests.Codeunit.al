codeunit 50350 "PTE Gudfood Table Tests"
{
    Subtype = Test;

    // trigger OnRun()
    // var
    //     TableNos: Record "Sales & Receivables Setup";
    //     NoSeries: Record "No. Series";
    // begin
    //     CheckAndAssignNoSeries();
    // end;

    // local procedure CheckAndAssignNoSeries()
    // var
    //     NoSeries: Record "No. Series";
    //     NoSeriesLine: Record "No. Series Line";
    //     SalesReceivables: Record "Sales & Receivables Setup";
    // begin
    //     if not NoSeries.Get('GF') then begin
    //         NoSeries.Init();
    //         NoSeries.Code := 'GF';

    //         NoSeriesLine.Init();
    //         NoSeriesLine."Series Code" := 'GF';
    //         NoSeriesLine."Starting No." := 'GF0000';
    //         NoSeriesLine."Ending No." := 'GF9999';
    //         NoSeriesLine.Insert(true);

    //         NoSeries."Default Nos." := true;
    //         NoSeries."Manual Nos." := false;
    //         NoSeries.Insert(true);

    //         SalesReceivables.Init();
    //         SalesReceivables."PTE Gudfood Item Nos." := 'GF';
    //         SalesReceivables.Insert(true);
    //     end;

    // end;

    // [Test]
    // procedure TestNoSeriesForTables()
    // var
    //     Item: Record "PTE Gudfood Item";
    //     SalesReceivables: Record "Sales & Receivables Setup";
    // begin
    //     Assert.IsTrue(SalesReceivables."PTE Gudfood Item Nos." <> '', 'No Series for Item should be assigned');

    //     Item.Init();
    //     Item.Description := 'Random Description';
    //     Item.Insert(true);

    //     Assert.IsTrue(Item."No." <> '', 'Item No. should be automatically assigned');
    // end;

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