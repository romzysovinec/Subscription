page 50102 "CSD Customer Subscriptions"
{
    Caption = 'Customer Subscriptions';
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    SourceTable = "CSD Customer Subscription";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Customer No."; rec."Customer No")
                {
                    ApplicationArea = All;

                }
                field("Subscription Code"; Rec."Subscription Code")
                {
                    ApplicationArea = All;

                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                }
                field("start date"; Rec."Start Date")
                {
                    ApplicationArea = All;

                }
                field("Last invoice date"; Rec."Last Invoice Date")
                {
                    ApplicationArea = All;

                }
                field("Next invoice date"; Rec."Next Invoice Date")
                {
                    ApplicationArea = All;

                }
                field("Cancelled Date"; rec."Cancelled Date")
                {
                    ApplicationArea = All;

                }
                field("Invoicing Price"; rec."Invoicing Price")
                {
                    ApplicationArea = All;

                }
            }
        }

    }
    trigger OnOPenpage()

    begin
        ShowCustomerField := rec.GetFilter("Customer No") = '';
    end;

    var
        ShowCustomerField: Boolean;
}