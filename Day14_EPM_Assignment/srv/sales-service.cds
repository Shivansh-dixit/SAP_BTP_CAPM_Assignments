using com.epm from '../db/schema';

service SalesService @(path: '/sales') {
  entity Products     as projection on epm.Products;
  entity Categories   as projection on epm.Categories;
  entity Customers    as projection on epm.Customers;
  entity SalesOrders  as projection on epm.SalesOrders
    actions {
      action confirm() returns {
        status  : String(20);
        message : String(200);
      };
      action cancel(
        reason : String(500)
      ) returns {
        status        : String(20);
        message       : String(200);
        refundAmount  : Decimal(12,2);
      };
      action ship(
        trackingNumber : String(50),
        carrier        : String(50)
      ) returns {
        status            : String(20);
        message           : String(200);
        estimatedDelivery : Date;
      };
    };

  // Unbound actions
  action GenerateReport(
    reportType : String(20),
    startDate  : Date,
    endDate    : Date
  ) returns {
    reportId : UUID;
    status   : String(20);
    message  : String(200);
  };

  action PingHealth() returns {
    status    : String(10);
    timestamp : DateTime;
    version   : String(20);
  };
}

service ReportsService @(path: '/reports') {
  @readonly entity ProductCatalog    as projection on epm.ProductCatalog;
  @readonly entity OrderSummary      as projection on epm.OrderSummary;
  @readonly entity LowStockProducts  as projection on epm.LowStockProducts;
}
