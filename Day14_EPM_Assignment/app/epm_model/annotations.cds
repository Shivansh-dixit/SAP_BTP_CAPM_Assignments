using AnalyticsService as service from '../../srv/analytics-service';
annotate service.ProductCatalog with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'productName',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rating',
                Value : rating,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'priceExTax',
                Value : priceExTax,
            },
            {
                $Type : 'UI.DataField',
                Label : 'taxAmount',
                Value : taxAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supplierName',
                Value : supplierName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'categoryName',
                Value : categoryName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'availability',
                Value : availability,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'productName',
            Value : productName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency_code',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : availability,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#rating',
            Label : 'Rating',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Stock Level',
            Target : '@UI.DataPoint#stock',
        },
    ],
    UI.SelectionFields : [
        availability,
    ],
    UI.DataPoint #rating : {
        Value : rating,
        Visualization : #Rating,
        TargetValue : 5,
    },
);

annotate service.ProductCatalog with {
    currency_code @Common.ValueList: {
        CollectionPath: 'Currencies',
        Parameters: [
            {
                $Type: 'Common.ValueListParameterInOut',
                LocalDataProperty: currency_code,
                ValueListProperty: 'code'
            }
        ]
    };
};
annotate service.ProductCatalog with {
    availability @(
        Common.Label : 'availability',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'AvailabilityValues',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : availability,
                    ValueListProperty : 'value',
                },
            ],
            Label : 'Availability',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.ProductCatalog with @(
    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : productName
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description
        },
        ImageUrl : 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Electronics_icon.svg/240px-Electronics_icon.svg.png'
    }
);

annotate service.ProductCatalog with @(
    UI.DataPoint #stock : {
        Value : stock,
        Title : 'Stock',
        Visualization : #Progress,
        MinimumValue : 0,
        TargetValue : 200
    }
);