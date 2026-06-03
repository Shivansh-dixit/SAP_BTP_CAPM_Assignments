using { com.epm as my } from '../db/schema';

@path: '/admin'
service AdminService {
    entity Suppliers as projection on my.Suppliers;
    entity Categories as projection on my.Categories;
    entity Products as projection on my.Products;
    entity Customers as projection on my.Customers;
    entity SalesOrders as projection on my.SalesOrders;
    entity PurchaseOrders as projection on my.PurchaseOrders;
}

@path: '/sales'
service SalesService {
    @readonly entity Products as projection on my.Products {
        key ID, name, description, category, stock
    }; // Hidden price/internal details
    entity SalesOrders as projection on my.SalesOrders;
}

@path: '/report'
service ReportService {
    // 1. ProductCatalog View
    view ProductCatalog as select from my.Products {
        name as productName,
        price,
        supplier.name as supplierName,
        category.name as categoryName,
        case 
            when stock > minStock then 'In Stock'
            else 'Low Stock'
        end as stockStatus : String
    };

    // 2. OrderReport View
    view OrderReport as select from my.SalesOrders {
        orderNumber,
        customer.name as customerName,
        amounts as totalAmount,
        orderDate,
        status
    };

    // 3. LowStockAlert View
    view LowStockAlert as select from my.Products {
        name,
        stock,
        minStock,
        supplier.contact,
        supplier.email
    } where stock <= minStock;
}