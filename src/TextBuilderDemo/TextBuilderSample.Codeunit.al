codeunit 50000 "SDH Text Builder Sample"
{
    procedure OldCALWay()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        AllCustName: Text;
    begin
        StartTime := Time;
        If ItemLedgerEntry.FINDSET() Then
            repeat
                AllCustName := AllCustName + ItemLedgerEntry.Description;
            until (ItemLedgerEntry.Next() = 0);
        Message('Executed Time %1', Time - StartTime);
        Message('Result %1', AllCustName);
    end;

    procedure NewALWay()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        TextBuilder1: TextBuilder;
    begin
        StartTime := Time;
        If ItemLedgerEntry.FINDSET() Then
            repeat
                TextBuilder1.Append(ItemLedgerEntry.Description);
            until (ItemLedgerEntry.Next() = 0);
        Message('Executed Time %1', Time - StartTime);
        Message('Result %1', TextBuilder1.ToText());
    end;

    var
        StartTime: Time;
}