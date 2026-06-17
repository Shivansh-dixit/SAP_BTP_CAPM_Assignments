sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'epmmodel1',
            componentId: 'PurchaseOrdersList',
            contextPath: '/PurchaseOrders'
        },
        CustomPageDefinitions
    );
});