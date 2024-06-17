codeunit 50305 "PTE Create New Item From RC"
{
    trigger OnRun()
    var
        NewItem: Record "PTE Gudfood Item";
    begin
        NewItem.Init();
        NewItem.Insert(true);
        Page.Run(Page::"PTE Gudfood Item Card", NewItem);
    end;
}