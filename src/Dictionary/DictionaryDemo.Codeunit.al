codeunit 50003 "SDH Dictionary Demo"
{
    procedure SetCustomerDictonarywithPayment(): Dictionary of [Code[20], Decimal]
    var
        Customer: Record Customer;
        CustomerDictionary: Dictionary of [Code[20], Decimal];
    begin
        if Customer.FindSet() then
            repeat
                CustomerDictionary.Add(Customer."No.", FetchCustLedgerEntry(Customer));
            until (Customer.next() = 0);
        exit(CustomerDictionary);
    end;

    local procedure FetchCustLedgerEntry(Customer: Record Customer) PaymentTotal: Decimal;
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Reset();
        CustLedgerEntry.SetRange("Customer No.", Customer."No.");
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Payment);
        CustLedgerEntry.SetAutoCalcFields(Amount);
        IF CustLedgerEntry.FindSet() then
            repeat
                PaymentTotal := PaymentTotal + CustLedgerEntry.Amount
            until (CustLedgerEntry.Next() = 0);
    end;

    procedure GetCustomerAmountFromDictionary(var CustomerDictionary: Dictionary of [Code[20], Decimal]; CustomerNo: Code[20]): Decimal
    begin
        Exit(CustomerDictionary.Get(CustomerNo));
    end;
}