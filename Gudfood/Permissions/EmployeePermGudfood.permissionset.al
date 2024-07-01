permissionset 50300 EmployeePermGudfood
{
    Caption = 'Employees in Gudfood Extension';
    Assignable = true;
    Permissions =
        tabledata "PTE Gudfood Item" = RIMD,
        tabledata "PTE Gudfood Order Header" = RIMD,
        tabledata "PTE Gudfood Order Line" = RIMD,
        tabledata "PTE Posted GF Order Header" = RIMD,
        tabledata "PTE Posted GF Order Line" = RIMD,
        table "PTE Gudfood Item" = X,
        table "PTE Gudfood Order Header" = X,
        table "PTE Gudfood Order Line" = X,
        table "PTE Posted GF Order Header" = X,
        table "PTE Posted GF Order Line" = X,
        report "PTE Gudfood Order" = X,
        codeunit "PTE Create New Item From RC" = X,
        codeunit "PTE Create New Order From RC" = X,
        codeunit "PTE Export Import Item" = X,
        codeunit "PTE Export Import Order" = X,
        codeunit "PTE Picture Manager" = X,
        codeunit "PTE Post Order" = X,
        xmlport "PTE Export Gudfood Item" = X,
        xmlport "PTE Export Gudfood Order" = X,
        page "PTE Customer Gudfood RC" = X,
        page "PTE Employee Gudfood RC" = X,
        page "PTE Gudfood Item Card" = X,
        page "PTE Gudfood Item List" = X,
        page "PTE Gudfood Order" = X,
        page "PTE Gudfood Order Subpage" = X,
        page "PTE Gudfood Orders List" = X,
        page "PTE Gudfood RC Earnings Cues" = X,
        page "PTE Gudfood RC Headline" = X,
        page "PTE Gudfood RC Items" = X,
        page "PTE Gudfood RC Order Cues" = X,
        page "PTE Photo Fact Box" = X,
        page "PTE Posted GF Order" = X,
        page "PTE Posted GF Order List" = X,
        page "PTE Posted GF Order Subpage" = X;


}