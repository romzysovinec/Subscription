page 50101 "CSD Subscription List"
{
    Caption = 'Subscription List';
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    SourceTable = "csd subscription";
    Editable = false;
    CardPageId = "CSD Subscription Card";
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; rec.Code)
                { ApplicationArea = All; }
                field(Name; rec.Name)
                { ApplicationArea = All; }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                }
                field("Invoicing schedule"; Rec."Invoicing Schedule")
                {
                    ApplicationArea = All;

                }
                field("Invoicing frequence"; Rec."Invoicing Frequence")
                {
                    ApplicationArea = All;

                }
                field("Invoicing Price"; Rec."Invoicing Price")
                {
                    ApplicationArea = All;

                }
            }
        }

    }


}