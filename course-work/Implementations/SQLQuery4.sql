DELIMITER $$

CREATE TRIGGER trg_update_inventory_timestamp
BEFORE UPDATE ON Inventory
FOR EACH ROW
BEGIN
    SET NEW.date_updated = NOW();
END $$

DELIMITER ;
