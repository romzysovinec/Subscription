codeunit 50100 "CSD Subscription Management"
{
    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', false, false)]
    local procedure UpdateSubscriptions(VAR SalesHeader: Record "Sales Header";
    VAR GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo:
    Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        CustomerSubscription: Record "CSD Customer Subscription";
        SalesInvLine: Record "Sales Invoice Line";
        Subscription: Record "CSD Subscription";
    begin
        IF (SalesInvHdrNo <> '') THEN BEGIN
            SalesInvLine.SETRANGE("Document No.", SalesInvHdrNo);
            SalesInvLine.SETRANGE(Type, SalesInvLine.Type::Item);
            IF SalesInvLine.FINDSET THEN
                REPEAT
                    CustomerSubscription.SETRANGE("Item No.", SalesInvLine."No.");
                    CustomerSubscription.SETRANGE(Active,
TRUE);
                    IF CustomerSubscription.FINDFIRST THEN BEGIN
                        Subscription.GET(CustomerSubscription."Subscription Code");
                        CustomerSubscription."Last Invoice Date" := SalesHeader."Posting Date";
                        CustomerSubscription."Next Invoice Date" := CALCDATE(Subscription."Invoicing Frequence", SalesHeader."Posting Date");
                        CustomerSubscription.MODIFY;
                    END;
                UNTIL SalesInvLine.NEXT = 0;
        END;
    end;
}
