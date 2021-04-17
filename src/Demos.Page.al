page 50000 "SDH Demos"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Power Community';
    layout
    {
        area(Content)
        {
            group(TextBuilder)
            {
                field(TextBuilderCALLbl; TextBuilderCALLbl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Text Builder C/AL';
                    Caption = 'C/AL';
                    ShowCaption = false;
                    trigger OnDrillDown()
                    var
                        TextBuilderSample: Codeunit "SDH Text Builder Sample";
                    begin
                        TextBuilderSample.OldCALWay();
                    end;
                }
                field(TextBuilderALLbl; TextBuilderALLbl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Text Builder AL';
                    ShowCaption = false;
                    Caption = 'AL';
                    trigger OnDrillDown()
                    var
                        TextBuilderSample: Codeunit "SDH Text Builder Sample";
                    begin
                        TextBuilderSample.NewALWay();
                    end;
                }
            }
            group(ListDemo)
            {
                field(ListDemoLbl; ListDemoLbl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Add Customer in List';
                    ShowCaption = false;
                    Caption = 'AL';
                    trigger OnDrillDown()
                    var
                        ListDemo: Codeunit "SDH List Demo";
                    begin
                        ListDemo.AddAllCustomersInList(CustomerList);
                    end;
                }
                field(CustomerIndex; CustomerIndex)
                {
                    ApplicationArea = All;
                    ToolTip = 'Get Customer From List';
                    Caption = 'List Index';
                    trigger OnValidate()
                    var
                        ListDemo: Codeunit "SDH List Demo";
                    begin
                        IF CustomerIndex > 0 then
                            Message(ListDemo.GetCustomerFromList(CustomerList, CustomerIndex));
                    end;
                }
            }
            group(DictionaryDemo)
            {
                field(DictionaryDemoLbl; DictionaryDemoLbl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Add Customer in Dictionary';
                    ShowCaption = false;
                    Caption = 'AL';
                    trigger OnDrillDown()
                    var
                        DictionaryDemo: Codeunit "SDH Dictionary Demo";
                    begin
                        CustomerPaymentDictionary := DictionaryDemo.SetCustomerDictonarywithPayment();
                        Message('All Customers added in Dictionary.');
                    end;
                }
                field(CustomerNo; CustomerNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Get Customer From Dictionary';
                    Caption = 'Choose Customer';
                    TableRelation = Customer;
                    trigger OnValidate()
                    var
                        DictionaryDemo: Codeunit "SDH Dictionary Demo";
                    begin
                        IF CustomerNo <> '' then
                            Message('%1', DictionaryDemo.GetCustomerAmountFromDictionary(CustomerPaymentDictionary, CustomerNo));
                    end;
                }
            }
        }
    }


    var
        TextBuilderCALLbl: Label 'Text Builder C/AL';
        TextBuilderALLbl: Label 'Text Builder AL';
        ListDemoLbl: Label 'Add Customer in List';
        DictionaryDemoLbl: Label 'All Customer in Dictionary';
        CustomerList: List of [Text];
        CustomerIndex: Integer;
        CustomerNo: Code[20];
        CustomerPaymentDictionary: Dictionary of [Code[20], Decimal];
}