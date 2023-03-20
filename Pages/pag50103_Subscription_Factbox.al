page 50103 "CSD Subscription Factbox"
{
    PageType = ListPart;
    SourceTable = "csd customer subscription";
    Caption = 'Subscription Factbox';
    Editable = false;
    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Subscription Code"; rec."Subscription Code")
                {
                    ApplicationArea = All;
                }
                field("Item No"; rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }





}