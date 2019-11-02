ALTER TABLE dates
    ADD COLUMN pushnotificationID BIGINT NULL DEFAULT NULL;

CREATE TABLE smact_paymentplans
(
    id              INT         NOT NULL AUTO_INCREMENT,
    smactwsID       INT         NULL,
    owner_id        INT         NULL,
    first_order     TIMESTAMP   NULL,
    cycle           VARCHAR(45) NULL,
    cycle_start     TIMESTAMP   NULL,
    cycle_duration  INT         NULL,
    campaign        VARCHAR(45) NULL DEFAULT NULL,
    campaign_value  INT         NULL DEFAULT NULL,
    campaign_type   INT         NULL DEFAULT NULL,
    price           INT         NULL,
    charge          INT         NULL,
    deposit         INT         NULL DEFAULT NULL,
    status          VARCHAR(45) NULL,
    preannouncement TIMESTAMP   NULL,
    created_at      TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE smact_campaigns
(
    id         INT         NOT NULL AUTO_INCREMENT,
    campaignID VARCHAR(45) NULL,
    code       VARCHAR(45) NULL,
    expire     TIMESTAMP   NULL DEFAULT NULL,
    value      INT         NULL,
    type       INT         NULL,
    invalid    INT         NULL DEFAULT NULL,
    reference  VARCHAR(45) NULL DEFAULT NULL,
    created_at TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP   NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE smact_products
(
    id               INT         NOT NULL AUTO_INCREMENT,
    nameDE           VARCHAR(45) NULL,
    descriptionDE    MEDIUMTEXT  NULL,
    nameEN           VARCHAR(45) NULL,
    descriptionEN    MEDIUMTEXT  NULL,
    value            INT         NULL,
    minimum_term     INT         NULL,
    online_available INT         NULL DEFAULT NULL,
    created_at       TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP   NULL DEFAULT NULL,
    PRIMARY KEY (id)
);
