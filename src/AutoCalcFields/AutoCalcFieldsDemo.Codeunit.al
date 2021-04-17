codeunit 50004 "SDH Auto Calc Fields Demo"
{
    procedure CalcFieldStyle()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TotalAmount: Decimal;
        StartTime: Time;
    begin
        StartTime := Time;
        CustLedgerEntry.Reset();
        IF CustLedgerEntry.FindSet() then
            repeat
                CustLedgerEntry.CalcFields(Amount);
                TotalAmount := TotalAmount + CustLedgerEntry.Amount
            until (CustLedgerEntry.Next() = 0);
        Message('Executed Time %1 & Result %2', Time - StartTime, TotalAmount);
    end;

    procedure AutoCalcFieldStyle()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TotalAmount: Decimal;
        StartTime: Time;
    begin
        StartTime := Time;
        CustLedgerEntry.Reset();
        CustLedgerEntry.SetAutoCalcFields(Amount);
        IF CustLedgerEntry.FindSet() then
            repeat
                TotalAmount := TotalAmount + CustLedgerEntry.Amount
            until (CustLedgerEntry.Next() = 0);
        Message('Executed Time %1 & Result %2', Time - StartTime, TotalAmount);
    end;
}