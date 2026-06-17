using PurchasingService as service from '../../srv/purchasing-service';
annotate service.PurchaseOrders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'poNumber',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supplier_ID',
                Value : supplier_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'orderDate',
                Value : orderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'expectedDate',
                Value : expectedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'grossAmount',
                Value : grossAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'netAmount',
                Value : netAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'taxAmount',
                Value : taxAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'notes',
                Value : notes,
            },
        ],
    },
    UI.Facets : [
    {
        $Type : 'UI.CollectionFacet',
        ID : 'GeneralInfo',
        Label : 'General Information',
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#GeneralInfo',
            }
        ]
    },
    {
        $Type : 'UI.CollectionFacet',
        ID : 'Dates',
        Label : 'Dates',
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Dates',
            }
        ]
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID : 'Items',
        Label : 'Items',
        Target : 'items/@UI.LineItem#PurchaseOrderItems',
    },
],

UI.FieldGroup #GeneralInfo : {
    Data : [
        { $Type : 'UI.DataField', Label : 'Order Number', Value : poNumber },
        { $Type : 'UI.DataField', Label : 'Supplier', Value : supplier_ID },
        { $Type : 'UI.DataField', Label : 'Gross Amount', Value : grossAmount },
        { $Type : 'UI.DataField', Label : 'Net Amount', Value : netAmount },
        { $Type : 'UI.DataField', Label : 'Tax Amount', Value : taxAmount },
        { $Type : 'UI.DataField', Label : 'Currency', Value : currency_code },
        { $Type : 'UI.DataField', Label : 'Status', Value : status, Criticality : criticality },
        { $Type : 'UI.DataField', Label : 'Notes', Value : notes },
    ]
},

UI.FieldGroup #Dates : {
    Data : [
        { $Type : 'UI.DataField', Label : 'Order Date', Value : orderDate },
        { $Type : 'UI.DataField', Label : 'Expected Date', Value : expectedDate },
        { $Type : 'UI.DataField', Label : 'Created On', Value : createdAt },
        { $Type : 'UI.DataField', Label : 'Created By', Value : createdBy },
    ]
},

    UI.LineItem : [
    {
        $Type : 'UI.DataField',
        Label : 'PO Number',
        Value : poNumber,
    },
    {
        $Type : 'UI.DataField',
        Label : 'Supplier',
        Value : supplier_ID,
    },
    {
        $Type : 'UI.DataField',
        Label : 'Order Date',
        Value : orderDate,
    },
    {
        $Type : 'UI.DataField',
        Label : 'Net Amount',
        Value : netAmount,
    },
    {
        $Type : 'UI.DataField',
        Label : 'Gross Amount',
        Value : grossAmount,
    },
    {
        $Type : 'UI.DataField',
        Label : 'Status',
        Value : status,
        Criticality : criticality,
    },
    ],
);

annotate service.PurchaseOrders with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplierName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactPerson',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.PurchaseOrders with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Submit',
            Action : 'PurchasingService.submit',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Approve',
            Action : 'PurchasingService.approve',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Reject',
            Action : 'PurchasingService.reject',
        },
    ]
);

annotate service.PurchaseOrders with {
    supplier @(
        Common.Text : supplier.supplierName,
        Common.TextArrangement : #TextOnly
    );
}

annotate service.PurchaseOrders with @(
    UI.HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        TypeImageUrl : 'https://cdn-icons-png.flaticon.com/512/3624/3624080.png',
        Title : {
            $Type : 'UI.DataField',
            Value : poNumber
        },
        Description : {
            $Type : 'UI.DataField',
            Value : supplier.supplierName
        }
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#netAmount'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#status'
        }
    ],
    UI.DataPoint #netAmount : {
        Value : netAmount,
        Title : 'Net Amount'
    },
    UI.DataPoint #status : {
        Value : status,
        Title : 'Status',
        Criticality : criticality
    }
);

annotate service.PurchaseOrderItems with @(
    UI.LineItem #PurchaseOrderItems : [
        { $Type : 'UI.DataField', Label : 'Product', Value : product.productName },
        { $Type : 'UI.DataField', Label : 'Quantity', Value : quantity },
        { $Type : 'UI.DataField', Label : 'Unit Price', Value : unitPrice },
        { $Type : 'UI.DataField', Label : 'Net Amount', Value : netAmount },
    ]
);

annotate service.PurchaseOrderItems with @(
    Common.SideEffects : {
        SourceProperties : ['quantity', 'unitPrice'],
        TargetProperties : ['netAmount']
    }
);

annotate service.PurchaseOrders with @(
    Common.SideEffects #TotalRefresh : {
        SourceEntities : ['items'],
        TargetProperties : ['grossAmount']
    }
);

annotate service.PurchaseOrderItems with @(
    UI.HeaderInfo : {
        TypeName : 'Item',
        TypeNamePlural : 'Items',
        Title : {
            $Type : 'UI.DataField',
            Value : product.productName
        }
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemDetails',
            Label : 'Item Details',
            Target : '@UI.FieldGroup#ItemDetails',
        }
    ],
    UI.FieldGroup #ItemDetails : {
        Data : [
            { $Type : 'UI.DataField', Label : 'Product', Value : product.productName },
            { $Type : 'UI.DataField', Label : 'Quantity', Value : quantity },
            { $Type : 'UI.DataField', Label : 'Unit Price', Value : unitPrice },
            { $Type : 'UI.DataField', Label : 'Net Amount', Value : netAmount },
            { $Type : 'UI.DataField', Label : 'Currency', Value : currency_code },
        ]
    }
);
