table 50301 "PTE Gudfood Order Header"
{
    Caption = 'Gudfood Order Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No. field.', Comment = '%';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeries.TestManual(SalesSetup."PTE Gudfood Order Header Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Sell-to Customer No." <> '' then
                    if Customer.Get("Sell-to Customer No.") then
                        "Sell-to Customer Name" := Customer.Name;
            end;
        }
        field(4; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            ToolTip = 'Specifies the value of the Sell-to Customer Name field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Order date"; Date)
        {
            Caption = 'Order date';
            ToolTip = 'Specifies the value of the Order date field.';
            DataClassification = CustomerContent;
        }
        field(6; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            ToolTip = 'Specifies the value of the Posting No. field.';
            DataClassification = CustomerContent;
        }
        field(7; "Date Created"; Date)
        {
            Caption = 'Date Created';
            ToolTip = 'Specifies the value of the Date Created field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            ToolTip = 'Specifies the value of the Total Qty field.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("PTE Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }
        field(9; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            ToolTip = 'Specifies the value of the Total Amount field.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("PTE Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("PTE Gudfood Order Header Nos.");
            "No. Series" := SalesSetup."PTE Gudfood Order Header Nos.";
            if NoSeries.AreRelated(SalesSetup."PTE Gudfood Order Header Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
        end;

        if "Date Created" = 0D then
            "Date Created" := Today;
    end;

    trigger OnDelete()
    var
        OrderLine: Record "PTE Gudfood Order Line";
    begin
        OrderLine.SetRange("Order No.", Rec."No.");
        if OrderLine.FindSet() then
            repeat
                OrderLine.Delete(true);
            until OrderLine.Next() = 0;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}
