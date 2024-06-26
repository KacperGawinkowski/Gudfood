table 50302 "PTE Gudfood Order Line"
{
    Caption = 'Gudfood Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            ToolTip = 'Specifies the value of the Order No. field.';
            DataClassification = CustomerContent;
            Editable = false;
            trigger OnValidate()
            begin
                "Line No." := GetNextLineNo();
            end;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No. field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Date Created"; Date)
        {
            Caption = 'Date Created';
            ToolTip = 'Specifies the value of the Date Created field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            ToolTip = 'Specifies the value of the Item No. field.';
            DataClassification = CustomerContent;
            TableRelation = "PTE Gudfood Item";
            trigger OnValidate()
            var
                Item: Record "PTE Gudfood Item";
                ExpirationTxt: Label '%1 has expired', Comment = '%1 is the No. of the Item', locked = false, MaxLength = 999;
            begin
                if Item.Get("Item No.") then begin
                    Description := Item.Description;
                    "Item Type" := Item.Type;
                    "Unit Price" := Item."Unit Price";
                    Amount := Quantity * "Unit Price";

                    if (Item."Shelf Life" < Today) then
                        Message(ExpirationTxt, Item."No.");
                end;
            end;
        }
        field(6; "Item Type"; Enum "PTE Item Type")
        {
            Caption = 'Item Type';
            ToolTip = 'Specifies the value of the Item Type field.';
            FieldClass = FlowField;
            CalcFormula = lookup("PTE Gudfood Item".Type where("No." = field("Item No.")));
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
            DataClassification = CustomerContent;
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                QuantityErrorTxt: Label 'Quantity field cannot have value lower than 0!', locked = false, MaxLength = 999;
            begin
                if Quantity < 0 then
                    Error(QuantityErrorTxt);

                Amount := Quantity * "Unit Price";
            end;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            ToolTip = 'Specifies the value of the Unit Price field.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Price";
            end;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            ToolTip = 'Specifies the value of the Amount field.';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        OrderHeader: Record "PTE Gudfood Order Header";
    begin
        if OrderHeader.Get("Order No.") then begin
            "Sell-to Customer No." := OrderHeader."Sell-to Customer No.";
            "Date Created" := OrderHeader."Date Created";
        end
    end;

    procedure GetNextLineNo(): Integer
    var
        GudfoodOrderLines: Record "PTE Gudfood Order Line";
        MaxLineNo: Integer;
    begin
        MaxLineNo := 0;

        GudfoodOrderLines.Reset();

        GudfoodOrderLines.SetRange("Order No.", Rec."Order No.");

        if GudfoodOrderLines.FindLast() then
            MaxLineNo := GudfoodOrderLines."Line No.";

        MaxLineNo += 10000;

        exit(MaxLineNo);
    end;

}
