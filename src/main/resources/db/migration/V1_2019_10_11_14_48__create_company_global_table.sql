create table if not exists company_global
(
    id int auto_increment primary key,
    companyname mediumtext null,
    zipcode mediumtext null,
    street mediumtext null,
    city mediumtext null,
    country mediumtext null,
    mainsector mediumtext null,
    corporatename mediumtext null,
    established mediumtext null,
    staffquantity mediumtext null,
    telareacode mediumtext null,
    telnumber mediumtext null,
    backupnumber mediumtext null,
    website mediumtext null,
    annualsalesyear mediumtext null,
    lastannualsales mediumtext null,
    subsidiaries mediumtext null,
    email mediumtext null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    contact mediumtext null
);

create index idx_cg_companyname on company_global(companyname(128));
