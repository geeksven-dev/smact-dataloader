ALTER TABLE `dates`
    CHANGE COLUMN `id` `id` BIGINT(20) NOT NULL ;
ALTER TABLE `dates`
    ADD COLUMN `rememberTime` INT NULL DEFAULT NULL AFTER `pushnotificationID`,
    ADD COLUMN `rememberKind` INT NULL DEFAULT NULL AFTER `rememberTime`;
ALTER TABLE `dates`
    CHANGE COLUMN `rememberKind` `rememberKind` VARCHAR(45) NULL DEFAULT NULL ;
ALTER TABLE `smact_paymentplans`
    ADD COLUMN `consumed` INT NULL DEFAULT NULL AFTER `deposit`;
ALTER TABLE `smact_products`
    CHANGE COLUMN `nameDE` `name` VARCHAR(45) NULL DEFAULT NULL ,
    CHANGE COLUMN `descriptionDE` `description` MEDIUMTEXT NULL DEFAULT NULL ;
