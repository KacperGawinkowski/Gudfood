table 50300 "PTE Gudfood Item"
{
    DataClassification = CustomerContent;
    LookupPageId = "PTE Gudfood Item List";
    DrillDownPageId = "PTE Gudfood Item List";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No. field.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeries.TestManual(SalesSetup."PTE Gudfood Item Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(3; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
            DataClassification = CustomerContent;
        }

        field(4; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            ToolTip = 'Specifies the value of the Unit Price field.';
            DataClassification = CustomerContent;
        }

        field(5; "Type"; enum "PTE Item Type")
        {
            Caption = 'Type';
            ToolTip = 'Specifies the value of the Type field.';
            DataClassification = CustomerContent;
        }

        field(6; "Qty. Ordered"; Decimal)
        {
            Caption = 'Qty. Ordered';
            ToolTip = 'Specifies the value of the Qty. Ordered field.';
            FieldClass = FlowField;
            CalcFormula = sum("PTE Posted GF Order Line".Quantity where("Item No." = field("No.")));
            Editable = false;
        }

        field(7; "Qty. in Order"; Decimal)
        {
            Caption = 'Qty. in Order';
            ToolTip = 'Specifies the value of the Qty. in Order field.';
            FieldClass = FlowField;
            CalcFormula = sum("PTE Gudfood Order Line".Quantity where("Item No." = field("No.")));
            Editable = false;
        }

        field(8; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            ToolTip = 'Specifies the value of the Shelf Life field.';
            DataClassification = CustomerContent;
        }

        field(9; Picture; Media)
        {
            Caption = 'Picture';
            ToolTip = 'Specifies the value of the Picture field.';
            DataClassification = CustomerContent;
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
            SalesSetup.TestField("PTE Gudfood Item Nos.");
            "No. Series" := SalesSetup."PTE Gudfood Item Nos.";
            if NoSeries.AreRelated(SalesSetup."PTE Gudfood Item Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}