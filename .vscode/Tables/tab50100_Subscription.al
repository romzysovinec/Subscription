table 50100 "CSD Subscription"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Invoicing Schedule"; Option)
        {
            DataClassification = CustomerContent;
            caption = 'Invoicing Schedule';
            OptionMembers = "Posting Date","Beginning of Period","End of Period","Beginning of Next Period";
            OptionCaption = 'Posting Date,Beginning of Period,End of Period,Beginning of Next Period';
        }
        field(5; "Invoicing Frequence"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoicing Frequence';
        }
        field(6; "Invoicing Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoicing Price';
        }
        field(7; "Deferral Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Deferral Code';
            TableRelation = "deferral template";
        }

    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}