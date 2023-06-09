page 50100 "CSD Subscription Card"
{
    Caption = 'Subscription Card';
    PageType = Card;
    SourceTable = "CSD Subscription";
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Code; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }

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