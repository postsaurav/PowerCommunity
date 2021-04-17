codeunit 50001 "SDH List Demo"
{
    procedure AddAllCustomersInList(Var CustomerList: List of [Text])
    var
        Customer: Record Customer;
    begin
        IF Customer.FindSet() then
            repeat
                CustomerList.Add(Customer."No.");
            until (Customer.Next() = 0);
        Message('All Customer are added in List.');
    end;

    procedure GetCustomerFromList(var CustomerList: List of [Text]; Index: Integer): Text
    begin
        Exit(CustomerList.Get(Index));
    end;
}