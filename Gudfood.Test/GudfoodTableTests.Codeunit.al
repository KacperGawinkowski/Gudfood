codeunit 50350 "PTE Gudfood Table Tests"
{
    Subtype = Test;

    [Test]
    procedure TestItemTableNoSeries()
    var
        Item: Record "PTE Gudfood Item";
        Description: Text[100];
    begin
        Description := 'Random Description';
        Item.Init();
        Item.Description := Description;
        Item.Insert();

        Item.FindLast();


        //Item.Description.ass.IsTrue()

    end;


    var
        Assert: Codeunit "Library Assert";
}
