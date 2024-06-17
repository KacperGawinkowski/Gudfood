codeunit 50350 "PTE Gudfood Table Tests"
{
    Subtype = Test;

    [Test]
    procedure TestGudfoodItem()
    var
        Item: Record "PTE Gudfood Item";
        Description: Text[100];
    begin

        Description := 'Random Description';
        Item.Init();
        Item.Description := Description;
        Item.Insert();

        Item.FindLast();

        Assert.IsTrue(Item.Description = Description, 'Item Description should be "Random Description".');
        Assert.IsTrue(Item."No." <> '', 'Item number should not be empty.');


    end;


    var
        Assert: Codeunit "Library Assert";
}
