report 50100 "CSD Create Invoices"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Create Invoices';
    dataset
    {
        dataitem("Customer Subscription"; "CSD Customer Subscription")
        {
            RequestFilterFields = "Customer No", "Item No.";
            trigger OnPreDataItem();
            begin
                IF NOT CONFIRM(CreateWarningTxt) THEN
                    CurrReport.Quit;

                "Customer Subscription".SETRANGE(Active, TRUE);
                "Customer Subscription".SETFILTER("Next Invoice Date", '<=%1', WORKDATE);
            end;

            trigger OnAfterGetRecord();
            var
                SalesLine: Record "Sales Line";
                OldCustomer: Code[20];
                OldInvoiceDate: Date;
                NextLineNo: Integer;
            begin
                IF (OldCustomer <> "Customer Subscription"."Customer No") OR
                (OldInvoiceDate <> "Customer Subscription"."Next Invoice Date") THEN BEGIN
                    OldCustomer := "Customer Subscription"."Customer No";
                    OldInvoiceDate := "Customer Subscription"."Next Invoice Date";
                    NextLineNo := 0;
                    CLEAR(SalesHeader);
                    SalesHeader.INIT;
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.INSERT(TRUE);
                    SalesHeader.VALIDATE("Sell-to Customer No.", "Customer Subscription"."Customer No");
                    SalesHeader.VALIDATE("Location Code", '');
                    SalesHeader.VALIDATE("Posting Date", "Customer Subscription"."Next Invoice Date");
                    SalesHeader.Modify();
                    InvoiceCounter += 1;
                END;
                NextLineNo += 10000;
                SalesLine.INIT;
                SalesLine."Line No." := NextLineNo;
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.VALIDATE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.INSERT;
                SalesLine.VALIDATE(Type, SalesLine.Type::Item);
                SalesLine.VALIDATE("No.", "Customer Subscription"."Item No.");
                SalesLine.VALIDATE(Quantity, 1);
                SalesLine.VALIDATE("Allow Line Disc.", "Customer Subscription"."Allow Line Discount");
                SalesLine.VALIDATE("Unit Price", "Customer Subscription"."Invoicing Price");
                SalesLine.MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE(InvCounterTxt, InvoiceCounter, SalesHeader."Document Type");
            end;
        }
    }
    var
        InvoiceCounter: Integer;
        CreateWarningTxt: TextConst ENU = 'Create subscriptions for all customers?';
        InvCounterTxt: TextConst ENU = '%1 %2(s) Created';
        SalesHeader: Record "Sales Header";
}
