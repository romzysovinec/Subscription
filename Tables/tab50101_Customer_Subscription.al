table 50101 "CSD Customer Subscription"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Customer No"; Code[20])
        {
            DataClassification = CustomerContent;
            caption = 'Customer No';
            TableRelation = Customer;
        }
        field(2; "Subscription Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Subscription Code';
            TableRelation = "csd subscription";
            trigger OnValidate()
            var
                Subscription: Record "CSD Subscription";
                Item: Record Item;
            begin
                if xrec."Subscription Code" <> rec."Subscription Code" then
                    rec.TestField("Last Invoice Date", 0D);
                if Subscription.Get("Subscription Code") then begin
                    subscription.TestField("Invoicing Frequence");
                    subscription.TestField("Item No.");
                    "Item No." := Subscription."Item No.";
                    if Subscription."Invoicing Price" = 0 then begin
                        Item.get("Item No.");
                        "Invoicing Price" := Item."unit price";
                    end else
                        "Invoicing Price" := "Subscription"."Invoicing Price";
                    case Subscription."Invoicing Schedule" of
                        Subscription."Invoicing Schedule"::"Beginning of Next Period":
                            "Start Date" := CalcDate('<CM+1D>', Workdate);
                        Subscription."Invoicing Schedule"::"Beginning of Period":
                            "Start Date" := CalcDate('<-CM>', Workdate);
                        Subscription."Invoicing Schedule"::"End of Period":
                            "Start Date" := CalcDate('<CM>', Workdate);
                        Subscription."Invoicing Schedule"::"Posting Date":
                            "Start Date" := WorkDate();
                    end;
                    "next Invoice Date" := "start date";
                    Active := TRUE;
                end;
            end;
        }
        field(3; "Item No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
        }
        field(5; "Last Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Last Invoice Date';
        }
        field(6; "Next Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Next Invoice Date';
        }
        field(7; "Cancelled Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Cancelled Invoice Date';
        }
        field(8; "Active"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Active';
        }
        field(9; "Invoicing Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoicing Price';
        }
        field(10; "Allow Line Discount"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Line Discount';
        }
    }

    keys
    {
        key(Key1; "Customer No", "Subscription Code")
        {
            Clustered = true;
        }
    }

}