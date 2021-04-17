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
        }
    }


    var
        TextBuilderCALLbl: Label 'Text Builder C/AL';
        TextBuilderALLbl: Label 'Text Builder AL';
}