DELIMITER $$

CREATE FUNCTION fn_order_total(orderId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(quantity * unit_price)
    INTO total
    FROM Order_Items
    WHERE order_id = orderId;

    RETURN IFNULL(total,0);
END $$

DELIMITER ;
