using com.epm from '../db/schema';

service SalesService @(path: '/sales') {
  entity Products     as projection on epm.Products;
  entity Categories   as projection on epm.Categories;
  entity Customers    as projection on epm.Customers;
  entity SalesOrders  as projection on epm.SalesOrders;
}

service ReportsService @(path: '/reports') {
  @readonly entity ProductCatalog    as projection on epm.ProductCatalog;
  @readonly entity OrderSummary      as projection on epm.OrderSummary;
  @readonly entity LowStockProducts  as projection on epm.LowStockProducts;
}