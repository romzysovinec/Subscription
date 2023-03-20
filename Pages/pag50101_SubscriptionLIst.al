page 50101 "CSD Subscription List"
{
    Caption = 'Subscription List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "csd subscription";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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