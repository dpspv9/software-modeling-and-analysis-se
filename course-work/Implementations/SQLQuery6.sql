DELIMITER $$

CREATE PROCEDURE sp_add_inventory(
    IN p_product_id INT,
    IN p_boutique_id INT,
    IN p_size VARCHAR(50),
    IN p_color VARCHAR(50),
    IN p_quantity INT,
    IN p_price DECIMAL(10,2),
    IN p_currency VARCHAR(10)
)
BEGIN
    INSERT INTO Inventory (
        inventory_id, product_id, boutique_id, size_available,
        color_available, stock_quantity, stock_status,
        price_override, currency_override, date_added, date_updated
    )
    VALUES (
        (SELECT IFNULL(MAX(inventory_id),0)+1 FROM Inventory),
        p_product_id,
        p_boutique_id,
        p_size,
        p_color,
        p_quantity,
        IF(p_quantity > 0, 'In stock', 'Out of stock'),
        p_price,
        p_currency,
        NOW(),
        NOW()
    );
END $$

DELIMITER ;
