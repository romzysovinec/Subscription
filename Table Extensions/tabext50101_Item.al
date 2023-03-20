tableextension 50101 "CSD Item_Ext" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50100; "CSD Subscription Item"; Boolean)
        {
            Caption = 'Subscription Item';
            FieldClass = FlowField;
            CalcFormula = Exist("CSD Subscription" WHERE("Item No." = FIELD("No.")));
            Editable = false;
        }
    }
}
