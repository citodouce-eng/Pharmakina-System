-- =====================================================
-- PHARMAKINA DRUG INVENTORY SYSTEM
-- =====================================================

SET SERVEROUTPUT ON;

BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM low_stock_alerts';
    EXECUTE IMMEDIATE 'DELETE FROM expiry_alerts';
    EXECUTE IMMEDIATE 'DELETE FROM sales';
    EXECUTE IMMEDIATE 'DELETE FROM drug_batches';
    EXECUTE IMMEDIATE 'DELETE FROM drugs';
    EXECUTE IMMEDIATE 'DELETE FROM suppliers';
    EXECUTE IMMEDIATE 'DELETE FROM system_users';
    DBMS_OUTPUT.PUT_LINE(' Old data cleared');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' No existing data found');
END;

DROP SEQUENCE drug_seq;
DROP SEQUENCE batch_seq;
DROP SEQUENCE sale_seq;
DROP SEQUENCE alert_seq;
DROP SEQUENCE user_seq;
DROP SEQUENCE supplier_seq;

CREATE SEQUENCE drug_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE batch_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sale_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE alert_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE supplier_seq START WITH 1 INCREMENT BY 1;

DBMS_OUTPUT.PUT_LINE(' Sequences recreated');


INSERT INTO suppliers (supplier_id, name, contact_person, phone, email, address) 
VALUES (supplier_seq.NEXTVAL, 'PharmaKina Production', 'Dr. Jean Kabila', '+243123456789', 'production@pharmakina.com', 'Bukavu, DRC');

INSERT INTO suppliers (supplier_id, name, contact_person, phone, email, address) 
VALUES (supplier_seq.NEXTVAL, 'PharmaKina Export', 'Mme. Marie Birori', '+243987654321', 'export@pharmakina.com', 'Bukavu, DRC');


INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'admin', 'admin123', 'Dr. Jean Kabila - Directeur', 'director@pharmakina.com', 'ADMIN');

INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'pharmacist1', 'pass123', 'Mme. Marie Birori - Pharmacienne', 'marie@pharmakina.com', 'PHARMACIST');

INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'manager1', 'manager123', 'Mr. Thomas Mambo - Gestionnaire', 'thomas@pharmakina.com', 'MANAGER');


-- Category 1: ANTIMALARIALS (Quinine)
INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'PK 500mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 8.50, 100);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'PK 300mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 6.00, 100);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'PK 250mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 5.00, 100);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Quinine Injectable 500mg/2ml', 'Antimalarial', 'PharmaKina', 15.00, 50);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Quinine Injectable 250mg/1ml', 'Antimalarial', 'PharmaKina', 10.00, 50);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Quinine Syrup 50mg/5ml', 'Antimalarial', 'PharmaKina', 7.50, 80);

-- Category 2: ANTIRETROVIRALS (ARV)
INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Afrivir (Stavudine+Lamivudine+Nevirapine)', 'Antiretroviral', 'PharmaKina', 25.00, 200);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Stavudine 30mg Capsule', 'Antiretroviral', 'PharmaKina', 12.00, 150);

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Lamivudine 150mg Tablet', 'Antiretroviral', 'PharmaKina', 10.00, 150);

-- Category 3: OTHER
INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level) 
VALUES (drug_seq.NEXTVAL, 'Hydroxychloroquine 200mg', 'Antimalarial', 'PharmaKina', 18.00, 100);




INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 1, 1, 'PK500-2024-01', 500, 500, 
        DATE '2024-01-15', DATE '2025-01-15', 6.00, 8.50, 'A-WAREHOUSE-01');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 1, 1, 'PK500-2024-02', 300, 300, 
        DATE '2024-03-10', DATE '2024-05-10', 6.00, 8.50, 'A-WAREHOUSE-02');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 2, 1, 'PK300-2024-01', 400, 400, 
        DATE '2024-02-01', DATE '2025-02-01', 4.50, 6.00, 'B-WAREHOUSE-01');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 4, 1, 'QINJ-2024-01', 200, 200, 
        DATE '2024-01-10', DATE '2024-05-01', 10.00, 15.00, 'C-WAREHOUSE-01');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 7, 1, 'ARV-2024-01', 1000, 1000, 
        DATE '2024-01-20', DATE '2025-06-20', 18.00, 25.00, 'D-WAREHOUSE-01');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 3, 1, 'PK250-2024-01', 600, 600, 
        DATE '2024-03-01', DATE '2025-03-01', 3.50, 5.00, 'A-WAREHOUSE-03');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 6, 1, 'QSYR-2024-01', 800, 800, 
        DATE '2024-02-15', DATE '2025-02-15', 5.00, 7.50, 'E-WAREHOUSE-01');


BEGIN
    FOR rec IN (SELECT batch_id, drug_id, expiry_date, 
                       (expiry_date - CURRENT_DATE) AS days_left,
                       d.drug_name, db.batch_number
                FROM drug_batches db
                JOIN drugs d ON db.drug_id = d.drug_id
                WHERE expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + 30
                  AND quantity_remaining > 0)
    LOOP
        INSERT INTO expiry_alerts (alert_id, batch_id, alert_date, days_to_expiry, alert_type, message)
        VALUES (alert_seq.NEXTVAL, rec.batch_id, CURRENT_DATE, rec.days_left,
                CASE 
                    WHEN rec.days_left <= 7 THEN 'CRITICAL'
                    WHEN rec.days_left <= 15 THEN 'URGENT'
                    ELSE 'WARNING'
                END,
                'Drug ' || rec.drug_name || ' (Batch: ' || rec.batch_number || ') expires in ' || rec.days_left || ' days');
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Expiry alerts generated');
END;
/


SELECT ' DATA SUMMARY' AS INFO FROM DUAL;
SELECT 'SYSTEM_USERS' AS Table_Name, COUNT(*) AS Rows FROM SYSTEM_USERS
UNION ALL
SELECT 'SUPPLIERS', COUNT(*) FROM SUPPLIERS
UNION ALL
SELECT 'DRUGS', COUNT(*) FROM DRUGS
UNION ALL
SELECT 'DRUG_BATCHES', COUNT(*) FROM DRUG_BATCHES
UNION ALL
SELECT 'EXPIRY_ALERTS', COUNT(*) FROM EXPIRY_ALERTS;


SELECT ' PHARMAKINA PRODUCTS LIST' AS INFO FROM DUAL;
SELECT drug_id AS ID, drug_name AS "Product Name", category AS Category, 
       unit_price AS "Price (USD)", reorder_level AS "Min Stock"
FROM drugs
ORDER BY drug_id;


SELECT ' BATCHES EXPIRING IN 30 DAYS' AS INFO FROM DUAL;
SELECT db.batch_id, d.drug_name, db.batch_number, db.quantity_remaining, db.expiry_date,
       (db.expiry_date - CURRENT_DATE) AS "Days Remaining",
       CASE 
           WHEN (db.expiry_date - CURRENT_DATE) <= 7 THEN 'CRITICAL'
           WHEN (db.expiry_date - CURRENT_DATE) <= 15 THEN 'URGENT'
           ELSE 'WARNING'
       END AS Status
FROM drug_batches db
JOIN drugs d ON db.drug_id = d.drug_id
WHERE db.expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + 30
ORDER BY db.expiry_date ASC;

COMMIT;
DBMS_OUTPUT.PUT_LINE(' PharmaKina data successfully loaded!');

SELECT COUNT(*) FROM drugs;

SELECT drug_id, drug_name, is_active FROM drugs;

UPDATE drugs SET is_active = 'Y' WHERE is_active IS NULL OR is_active = 'N';
COMMIT;


SET SERVEROUTPUT ON;


BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM low_stock_alerts';
    EXECUTE IMMEDIATE 'DELETE FROM expiry_alerts';
    EXECUTE IMMEDIATE 'DELETE FROM sales';
    EXECUTE IMMEDIATE 'DELETE FROM drug_batches';
    EXECUTE IMMEDIATE 'DELETE FROM drugs';
    EXECUTE IMMEDIATE 'DELETE FROM suppliers';
    EXECUTE IMMEDIATE 'DELETE FROM system_users';
    DBMS_OUTPUT.PUT_LINE(' Old data cleared');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' No existing data');
END;
/


BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE drug_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE batch_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE sale_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE alert_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE user_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE supplier_seq';
    DBMS_OUTPUT.PUT_LINE(' Sequences dropped');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' Sequences did not exist');
END;
/


CREATE SEQUENCE drug_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE batch_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sale_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE alert_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE supplier_seq START WITH 1 INCREMENT BY 1;

DBMS_OUTPUT.PUT_LINE(' Sequences created');


INSERT INTO suppliers (supplier_id, name, contact_person, phone, email, address) 
VALUES (supplier_seq.NEXTVAL, 'PharmaKina Production', 'Dr. Jean Kabila', '+243123456789', 'production@pharmakina.com', 'Bukavu, DRC');

INSERT INTO suppliers (supplier_id, name, contact_person, phone, email, address) 
VALUES (supplier_seq.NEXTVAL, 'PharmaKina Export', 'Mme. Marie Birori', '+243987654321', 'export@pharmakina.com', 'Bukavu, DRC');


INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'admin', 'admin123', 'Dr. Jean Kabila - Directeur', 'director@pharmakina.com', 'ADMIN');

INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'pharmacist1', 'pass123', 'Mme. Marie Birori - Pharmacienne', 'marie@pharmakina.com', 'PHARMACIST');

INSERT INTO system_users (user_id, username, password, full_name, email, role) 
VALUES (user_seq.NEXTVAL, 'manager1', 'manager123', 'Mr. Thomas Mambo - Gestionnaire', 'thomas@pharmakina.com', 'MANAGER');


INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'PK 500mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 8.50, 100, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'PK 300mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 6.00, 100, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'PK 250mg (Quinine Base)', 'Antimalarial', 'PharmaKina', 5.00, 100, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Quinine Injectable 500mg', 'Antimalarial', 'PharmaKina', 15.00, 50, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Quinine Injectable 250mg', 'Antimalarial', 'PharmaKina', 10.00, 50, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Quinine Syrup', 'Antimalarial', 'PharmaKina', 7.50, 80, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Afrivir (ARV)', 'Antiretroviral', 'PharmaKina', 25.00, 200, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Stavudine 30mg', 'Antiretroviral', 'PharmaKina', 12.00, 150, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Lamivudine 150mg', 'Antiretroviral', 'PharmaKina', 10.00, 150, 'Y');

INSERT INTO drugs (drug_id, drug_name, category, manufacturer, unit_price, reorder_level, is_active) 
VALUES (drug_seq.NEXTVAL, 'Hydroxychloroquine 200mg', 'Antimalarial', 'PharmaKina', 18.00, 100, 'Y');


INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 1, 1, 'PK500-2024-01', 500, 500, 
        DATE '2024-01-15', DATE '2025-01-15', 6.00, 8.50, 'A-01');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 1, 1, 'PK500-2024-02', 300, 300, 
        DATE '2024-03-10', DATE '2024-05-10', 6.00, 8.50, 'A-02');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 2, 1, 'PK300-2024-01', 400, 400, 
        DATE '2024-02-01', DATE '2025-02-01', 4.50, 6.00, 'B-01');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 4, 1, 'QINJ-2024-01', 200, 200, 
        DATE '2024-01-10', DATE '2024-12-31', 10.00, 15.00, 'C-01');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 7, 1, 'ARV-2024-01', 1000, 1000, 
        DATE '2024-01-20', DATE '2025-06-20', 18.00, 25.00, 'D-01');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 3, 1, 'PK250-2024-01', 600, 600, 
        DATE '2024-03-01', DATE '2025-03-01', 3.50, 5.00, 'A-03');

INSERT INTO drug_batches (batch_id, drug_id, supplier_id, batch_number, quantity, quantity_remaining, 
                          manufacture_date, expiry_date, purchase_price, selling_price, storage_location)
VALUES (batch_seq.NEXTVAL, 6, 1, 'QSYR-2024-01', 800, 800, 
        DATE '2024-02-15', DATE '2025-02-15', 5.00, 7.50, 'E-01');

COMMIT;


SELECT '========== PHARMAKINA DATA SUMMARY ==========' AS INFO FROM DUAL;
SELECT 'SYSTEM_USERS' AS Table_Name, COUNT(*) AS Rows FROM SYSTEM_USERS
UNION ALL
SELECT 'SUPPLIERS', COUNT(*) FROM SUPPLIERS
UNION ALL
SELECT 'DRUGS', COUNT(*) FROM DRUGS
UNION ALL
SELECT 'DRUG_BATCHES', COUNT(*) FROM DRUG_BATCHES;


SELECT '========== DRUGS LIST ==========' AS INFO FROM DUAL;
SELECT drug_id AS ID, drug_name AS "Drug Name", category AS Category, 
       unit_price AS "Price (USD)", reorder_level AS "Min Stock"
FROM drugs
ORDER BY drug_id;


SELECT '========== BATCHES LIST ==========' AS INFO FROM DUAL;
SELECT batch_id, drug_id, batch_number, quantity_remaining, expiry_date
FROM drug_batches
ORDER BY batch_id;

COMMIT;


SELECT drug_id, drug_name, is_active FROM drugs;



