codeunit 50306 "PTE Create New Order From RC"
{
    trigger OnRun()
    var
        NewOrder: Record "PTE Gudfood Order Header";
    begin
        NewOrder.Init();
        NewOrder.Insert(true);
        Page.Run(Page::"PTE Gudfood Order", NewOrder);
    end;
}