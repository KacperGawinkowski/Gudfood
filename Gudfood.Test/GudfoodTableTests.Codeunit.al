codeunit 50350 "PTE Gudfood Table Tests"
{
    Subtype = Test;

    [Test]
    procedure TestCreateItem()
    var
        Item: Record "PTE Gudfood Item";
        ItemCounter: Integer;
    begin
        Item.Init();
        ItemCounter := Item.Count();

        Item.Description := 'Description';
        Item."Shelf Life" := 0D;
        Item.Type := "PTE Item Type"::Burger;
        Item."Unit Price" := 7.99;

        Item.Insert(true);
        Assert.IsTrue(Item.Count() = ItemCounter + 1, 'Item.Count should have increased by 1');
    end;

    [Test]
    procedure TestCreateOrder()
    var
        Order: Record "PTE Gudfood Order Header";
        OrderCounter: Integer;
    begin
        Order.Init();
        OrderCounter := Order.Count();

        Order."Order date" := 0D;
        Order.Insert(true);
        Assert.IsTrue(Order.Count() = OrderCounter + 1, 'Order.Count should have increased by 1');
    end;

    var
        Assert: Codeunit "Library Assert";
}
