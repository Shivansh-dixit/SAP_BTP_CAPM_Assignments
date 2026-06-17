sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"epmmodel1/test/integration/pages/PurchaseOrdersList",
	"epmmodel1/test/integration/pages/PurchaseOrdersObjectPage",
	"epmmodel1/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('epmmodel1') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

