table 50304 "PTE Posted GF Order Header"
{
    Caption = 'Posted Gudfood Order Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            ToolTip = 'Specifies the value of the Posting No. field.';
            DataClassification = CustomerContent;
        }

        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            ToolTip = 'Specifies the value of the No. Series field.';
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(4; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            ToolTip = 'Specifies the value of the Sell-to Customer Name field.';
            DataClassification = CustomerContent;
        }
        field(5; "Order date"; Date)
        {
            Caption = 'Order date';
            ToolTip = 'Specifies the value of the Order date field.';
            DataClassification = CustomerContent;
        }

        field(7; "Date Created"; Date)
        {
            Caption = 'Date Created';
            ToolTip = 'Specifies the value of the Date Created field.';
            DataClassification = CustomerContent;
        }
        field(8; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            ToolTip = 'Specifies the value of the Total Qty field.';
            FieldClass = FlowField;
            CalcFormula = sum("PTE Posted GF Order Line".Quantity where("Order No." = field("Posting No.")));
        }
        field(9; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            ToolTip = 'Specifies the value of the Total Amount field.';
            FieldClass = FlowField;
            CalcFormula = sum("PTE Posted GF Order Line".Amount where("Order No." = field("Posting No.")));
        }

        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the value of the Posting Date field.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Posting No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Posting No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("PTE Posted Gudfood Order Nos.");
            "No. Series" := SalesSetup."PTE Posted Gudfood Order Nos.";
            if NoSeries.AreRelated(SalesSetup."PTE Posted Gudfood Order Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Posting No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    // procedure CheckAndAssignPostingNo()
    // begin
    //     if "Posting No." = '' then begin
    //         SalesSetup.Get();
    //         SalesSetup.TestField("PTE Posted Gudfood Order Nos.");
    //         "No. Series" := SalesSetup."PTE Posted Gudfood Order Nos.";
    //         if NoSeries.AreRelated(SalesSetup."PTE Posted Gudfood Order Nos.", xRec."No. Series") then
    //             "No. Series" := xRec."No. Series";
    //         "Posting No." := NoSeries.GetNextNo("No. Series");
    //     end;

    // end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}
