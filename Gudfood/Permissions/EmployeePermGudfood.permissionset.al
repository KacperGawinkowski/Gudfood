permissionset 50301 EmployeePermGudfood
{
    Caption = 'Employee in Gudfood Extension';
    Assignable = true;

    Permissions =
        tabledata "PTE Gudfood Item" = R,
        tabledata "PTE Gudfood Order Header" = RIM,
        tabledata "PTE Gudfood Order Line" = RIMD,
        table "PTE Gudfood Item" = X,
        codeunit "PTE Create New Order From RC" = X,
        codeunit "PTE Picture Manager" = X,
        page "PTE Employee Gudfood RC" = X,
        page "PTE Gudfood Item Card" = x,
        page "PTE Gudfood Order" = X,
        page "PTE Gudfood RC Headline" = x,
        page "PTE Gudfood RC Items" = x,
        page "PTE Photo Fact Box" = X;
}