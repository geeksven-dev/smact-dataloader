create table if not exists admin_support
(
    id int auto_increment
        primary key,
    workspace varchar(45) null,
    workspacename varchar(45) null,
    user varchar(45) null,
    username varchar(45) null,
    usermail varchar(64) null,
    context varchar(64) null,
    contextdetail varchar(64) null,
    supporturl varchar(255) null,
    subject text null,
    supportText longtext null,
    supportType varchar(45) null,
    status int null,
    staff varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists angebote
(
    id int auto_increment
        primary key,
    offerID int null,
    customerID int null,
    context varchar(45) null,
    date timestamp null,
    duedate timestamp null,
    product int null,
    productCondition int null,
    productDescription varchar(45) null,
    productPrice float null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists appraisal
(
    id int auto_increment
        primary key,
    saleid int null,
    userid int null,
    companyid int null,
    need longtext null,
    solution longtext null,
    research longtext null,
    options longtext null,
    network varchar(255) null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists audits
(
    id int unsigned auto_increment
        primary key,
    smactwsID int null,
    user_id int unsigned null,
    user_type varchar(191) null,
    event varchar(191) not null,
    auditable_id int unsigned not null,
    auditable_type varchar(191) not null,
    old_values text null,
    new_values text null,
    url text null,
    ip_address varchar(45) null,
    user_agent varchar(191) null,
    tags varchar(191) null,
    created_at timestamp null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8mb4_unicode_ci;

create index audits_auditable_id_auditable_type_index
    on audits (auditable_id, auditable_type);

create index audits_user_id_user_type_index
    on audits (user_id, user_type);

create table if not exists auth
(
    id int auto_increment
        primary key
);

create table if not exists berufe
(
    id int auto_increment
        primary key,
    interneID int(28) null,
    name varchar(255) null,
    quelle varchar(255) charset utf8 null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists berufspositionen
(
    id int auto_increment
        primary key,
    name varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists branchen
(
    id int auto_increment,
    branchenID varchar(45) null,
    kategorie varchar(45) null,
    name varchar(512) charset utf8 null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    constraint id_UNIQUE
        unique (id)
)
    collate=utf8_unicode_ci;

alter table branchen
    add primary key (id);

create table if not exists comments
(
    id int auto_increment
        primary key,
    smactwsID int null,
    context varchar(255) null,
    contextID varchar(255) null,
    comment text null,
    edited_by int not null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create index edited_by_idx
    on comments (edited_by);

create table if not exists companies
(
    id int auto_increment,
    smactwsID int null,
    externID varchar(255) null,
    subid int null,
    name varchar(255) null,
    firmierung varchar(255) null,
    namezusatz varchar(255) null,
    ortsteil varchar(255) null,
    strasse varchar(255) null,
    hausnummer varchar(45) null,
    hausbs varchar(45) null,
    plz text null,
    ort varchar(255) null,
    land varchar(255) null,
    state varchar(255) null,
    website varchar(255) null,
    website2 varchar(255) null,
    mail varchar(255) null,
    mailoptin varchar(45) null,
    tel_land varchar(45) null,
    tel_ort varchar(45) null,
    tel_nummer varchar(255) charset utf8 null,
    fax_land varchar(255) null,
    fax_ort varchar(255) null,
    fax_nummer varchar(255) null,
    kernkompetenz text null,
    hauptbranche int null,
    nebenbranche varchar(255) null,
    profil varchar(45) null,
    mitarbeiter varchar(255) null,
    mitarbeiterklasse varchar(45) null,
    umsatz varchar(255) null,
    umsatzklasse varchar(45) null,
    umsatzjahr varchar(255) null,
    gruendung varchar(45) null,
    hrnr varchar(255) null,
    stnr varchar(255) null,
    ustid varchar(255) null,
    kdnr varchar(255) null,
    zahlungsziel varchar(255) null,
    status int null,
    contactmode int null,
    Kommentar longtext null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    edited_by varchar(45) charset utf8 null,
    deleted_at timestamp null,
    constraint id_UNIQUE
        unique (id)
)
    collate=utf8_unicode_ci;

alter table companies
    add primary key (id);

create table if not exists company_global
(
    id int auto_increment
        primary key,
    companyname mediumtext null,
    zipcode mediumtext null,
    streetbackup mediumtext null,
    street mediumtext null,
    streetnumber mediumtext null,
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

create table if not exists company_local
(
    id int auto_increment
        primary key,
    companyID varchar(255) not null,
    smactwsID varchar(45) null,
    subscriptionID varchar(45) null,
    companyname varchar(255) null,
    companynameadd varchar(255) null,
    corporatename varchar(255) null,
    zipcode varchar(255) null,
    city varchar(255) null,
    district varchar(255) null,
    state varchar(255) null,
    country varchar(255) null,
    street varchar(255) null,
    streetnumber varchar(255) null,
    addressaddition varchar(255) null,
    telcountrycode varchar(255) null,
    telareacode varchar(255) null,
    telnumber varchar(255) null,
    faxcountrycode varchar(255) null,
    faxareacode varchar(255) null,
    faxnumber varchar(255) null,
    website varchar(255) null,
    email varchar(255) null,
    mainsector varchar(255) null,
    corecompetency varchar(255) null,
    status varchar(255) null,
    mailoptin varchar(255) null,
    profile varchar(255) null,
    established varchar(255) null,
    staffquantity varchar(255) null,
    staffcategory varchar(255) null,
    lastannualsales varchar(255) null,
    annualsalesyear varchar(255) null,
    revenueclass varchar(255) null,
    customerid varchar(255) null,
    commercialregisternumber varchar(255) null,
    taxid varchar(255) null,
    vatin varchar(255) null,
    dateofpayment varchar(255) null,
    indays varchar(255) null,
    contactinformation varchar(255) null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists companypersons
(
    id int auto_increment
        primary key,
    smactwsID int null,
    user varchar(255) charset utf8 null,
    company varchar(255) charset utf8 null,
    job varchar(255) null,
    function varchar(255) null,
    email varchar(45) charset utf8 null,
    telcountrycode varchar(45) charset utf8 null,
    telareacode varchar(45) charset utf8 null,
    telnumber varchar(45) charset utf8 null,
    edited_by varchar(255) charset utf8 null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists countries
(
    id int auto_increment
        primary key,
    namedt varchar(255) null,
    `iso-2` varchar(45) null,
    `iso-3` varchar(45) null,
    `iso-num` varchar(45) null,
    phonecode varchar(45) null,
    created_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
    )
    collate=utf8_unicode_ci;

create table if not exists customers
(
    ID int auto_increment
        primary key,
    Feld1 varchar(255) null,
    Feld2 varchar(255) null,
    Feld3 datetime null,
    Feld4 varchar(255) null,
    Feld5 varchar(255) null,
    Feld6 varchar(255) null,
    Feld7 varchar(255) null,
    Feld8 varchar(255) null,
    Feld9 varchar(255) null,
    Feld10 varchar(255) null,
    Feld11 varchar(255) null,
    Feld12 varchar(255) null,
    Feld13 varchar(255) null,
    Feld14 varchar(255) null,
    Feld15 varchar(255) null,
    Feld16 varchar(255) null,
    Feld17 varchar(255) null,
    Feld18 varchar(255) null,
    Feld19 varchar(255) null,
    Feld20 varchar(255) null,
    Feld21 varchar(255) null,
    Feld22 double null,
    Feld23 varchar(255) null,
    Feld24 varchar(255) null,
    Feld25 varchar(255) null,
    Feld26 varchar(255) null,
    Feld27 varchar(255) null,
    Feld28 varchar(255) null,
    Feld29 varchar(255) null,
    Feld30 varchar(255) null,
    Feld31 varchar(255) null,
    Feld32 double null,
    Feld33 text null,
    Feld34 text null,
    Feld35 text null,
    Feld36 text null,
    Feld37 text null,
    Feld38 text null,
    Feld39 text null,
    Feld40 text null,
    Feld41 text null,
    Feld42 text null,
    Feld43 text null,
    Feld44 text null,
    Feld45 text null,
    Feld46 text null,
    Feld47 text null,
    Feld48 text null,
    Feld49 text null,
    Feld50 text null,
    Feld51 text null,
    Feld52 text null,
    Feld53 text null,
    Feld54 text null,
    Feld55 text null,
    Feld56 text null,
    Feld57 text null,
    Feld58 text null,
    Feld59 text null,
    Feld60 text null,
    Feld61 text null,
    Feld62 text null,
    Feld63 text null,
    Feld64 text null,
    Feld65 text null,
    Feld66 text null,
    Feld67 text null,
    Feld68 text null,
    Feld69 text null,
    Feld70 text null,
    Feld71 text null,
    Feld72 text null,
    Feld73 text null,
    Feld74 text null,
    Feld75 text null,
    Feld76 text null,
    Feld77 text null,
    Feld78 text null,
    Feld79 text null,
    Feld80 text null,
    Feld81 text null,
    Feld82 text null,
    Feld83 text null,
    Feld84 text null,
    Feld85 text null,
    Feld86 text null,
    Feld87 text null,
    Feld88 text null,
    Feld89 text null,
    Feld90 text null,
    Feld91 text null,
    Feld92 text null,
    Feld93 text null,
    Feld94 text null,
    Feld95 text null,
    Feld96 text null,
    Feld97 text null,
    Feld98 text null,
    Feld99 text null,
    Feld100 text null,
    Feld101 text null,
    Feld102 text null,
    Feld103 text null,
    Feld104 text null,
    Feld105 text null,
    Feld106 text null,
    Feld107 text null,
    Feld108 text null,
    Feld109 text null,
    Feld110 text null,
    Feld111 text null,
    Feld112 text null,
    Feld113 text null,
    Feld114 text null,
    Feld115 text null,
    Feld116 text null,
    Feld117 text null,
    Feld118 text null,
    Feld119 text null,
    Feld120 text null,
    Feld121 text null,
    Feld122 text null,
    Feld123 text null,
    Feld124 text null,
    Feld125 text null,
    Feld126 text null,
    Feld127 text null,
    Feld128 text null,
    Feld129 text null,
    Feld130 text null,
    Feld131 text null,
    Feld132 text null,
    Feld133 text null,
    Feld134 text null,
    Feld135 text null,
    Feld136 text null,
    Feld137 text null,
    Feld138 text null,
    Feld139 text null,
    Feld140 text null,
    Feld141 text null,
    Feld142 text null,
    Feld143 text null,
    Feld144 text null,
    Feld145 text null,
    Feld146 text null,
    Feld147 text null,
    Feld148 text null,
    Feld149 text null,
    Feld150 text null,
    Feld151 text null,
    Feld152 text null,
    Feld153 text null,
    Feld154 text null
)
    engine=MyISAM charset=utf8;

create table if not exists dates
(
    id int auto_increment
        primary key,
    smactwsID int null,
    userID int null,
    private int null,
    startdate varchar(45) null,
    enddate varchar(45) null,
    context varchar(45) null,
    headline varchar(255) null,
    description varchar(255) null,
    url varchar(45) null,
    class varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists event_campaign
(
    id int auto_increment
        primary key,
    smactwsID int null,
    campaignID varchar(45) null,
    eventID varchar(45) null,
    code varchar(45) null,
    expire timestamp null,
    reference varchar(45) null,
    discountValue varchar(45) null,
    discountType varchar(45) null,
    invalid int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists eventproducts
(
    id int auto_increment
        primary key,
    smactwsID int null,
    eventID varchar(45) null,
    productID varchar(45) null,
    edited_by varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists events
(
    id int auto_increment
        primary key,
    smactwsID int null,
    eventID varchar(45) null,
    eventname varchar(45) null,
    eventdescription mediumtext null,
    eventstart timestamp null,
    eventend timestamp null,
    duration varchar(45) null,
    context varchar(45) null,
    status varchar(45) null,
    statusdefinition mediumtext null,
    location varchar(45) null,
    `limit` int null,
    productID varchar(45) null,
    reminder timestamp null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists german_streets
(
    id int auto_increment
        primary key,
    `3166_1N` int null,
    `3166_1A2` varchar(255) null,
    Staat varchar(255) null,
    ARS bigint null,
    AGS int null,
    NUTS_3 varchar(255) null,
    `3166_2` varchar(255) null,
    Bundesland varchar(255) null,
    Reg_Bez varchar(255) null,
    Region varchar(255) null,
    GtKz int null,
    Gemeindetyp varchar(255) null,
    KrS varchar(255) null,
    KrtKz varchar(255) null,
    Kreistyp varchar(255) null,
    Kreis varchar(255) null,
    Zustaend_Gem varchar(255) null,
    AmtS int null,
    VBtKz int null,
    Verbandstyp varchar(255) null,
    Zustaend_VB varchar(255) null,
    RgS varchar(255) null,
    Reisegebiet varchar(255) null,
    PLZ int(5) unsigned zerofill not null,
    Ortsname varchar(255) null,
    Ortszusatz varchar(255) null,
    Ortsteil varchar(255) null,
    Straße text null,
    Nummer varchar(255) null,
    Orientierung varchar(255) null,
    `Bem.` varchar(255) null,
    PLZ_2 varchar(255) null,
    Ortsname_2 varchar(255) null,
    Ortsteil_2 varchar(255) null,
    Straße_2 varchar(255) null,
    Nummer_2 varchar(255) null,
    `Bem.2` varchar(255) null
);

create index AGS_index
    on german_streets (AGS);

create index ARS_index
    on german_streets (ARS);

create index AmtS_index
    on german_streets (AmtS);

create index GtKz_index
    on german_streets (GtKz);

create index PLZ_index
    on german_streets (PLZ);

create index VBtKz_index
    on german_streets (VBtKz);

create table if not exists germany
(
    id int auto_increment
        primary key,
    townname text null,
    townadd text null,
    townzip text null,
    towndialing text null,
    townstate text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists hobbies
(
    id int auto_increment
        primary key,
    name varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists incidents
(
    id int auto_increment
        primary key,
    smactwsID int null,
    userid int null,
    incident varchar(255) null,
    toContext int null,
    fromContext int null,
    edited_by varchar(45) default 'System Tracker' null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists invoices
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactinstance varchar(45) null,
    invoiceid varchar(45) null,
    invoiceNo varchar(45) null,
    company varchar(45) null,
    `values` longtext null,
    basevalues longtext null,
    duedate date null,
    status int default 0 null,
    source int null,
    action int null,
    actionInfo text null,
    barcode varchar(45) null,
    templatename varchar(255) null,
    context varchar(45) null,
    contextID varchar(45) null,
    contextAmount int null,
    payment text null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists items
(
    id int unsigned auto_increment
        primary key,
    title varchar(255) not null,
    description text not null,
    created_at timestamp null,
    updated_at timestamp null
)
    collate=utf8mb4_unicode_ci;

create table if not exists locations
(
    id int auto_increment
        primary key,
    smactwsID int null,
    locationID varchar(45) null,
    locationname varchar(255) null,
    locationadress varchar(255) null,
    geocords varchar(255) null,
    max_size int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists messages
(
    id int unsigned auto_increment
        primary key,
    user_id int unsigned not null,
    message text not null,
    created_at timestamp null,
    updated_at timestamp null
)
    collate=utf8mb4_unicode_ci;

create table if not exists migrations
(
    id int unsigned auto_increment
        primary key,
    migration varchar(191) not null,
    batch int not null
)
    collate=utf8mb4_unicode_ci;

create table if not exists modul_connector
(
    id int auto_increment
        primary key,
    smactwsID int null,
    modul int null,
    modulID int null,
    context int null,
    contextID varchar(255) null,
    value varchar(255) null,
    description varchar(255) null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists nacev2
(
    id int auto_increment
        primary key,
    branchenID text null,
    mainsector_normalised text null,
    name text null,
    de text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists names
(
    id int auto_increment
        primary key,
    name varchar(255) null,
    sex varchar(45) null,
    origin varchar(255) null,
    edited_by varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists offers
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactinstance varchar(45) null,
    offerid varchar(45) null,
    offerNo varchar(45) null,
    company varchar(45) null,
    `values` longtext null,
    basevalues longtext null,
    duedate varchar(45) null,
    status varchar(45) default '0' null,
    templatename varchar(255) null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists orders
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactinstance varchar(45) null,
    context varchar(45) null,
    contextID varchar(45) null,
    contextAmount int null,
    orderid varchar(45) null,
    `values` longtext null,
    basevalues longtext null,
    duedate varchar(45) null,
    edited_by varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists orte
(
    id int auto_increment
        primary key,
    name varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists password_resets
(
    email varchar(191) not null,
    token varchar(191) not null,
    created_at timestamp null
)
    collate=utf8mb4_unicode_ci;

create index password_resets_email_index
    on password_resets (email);

create table if not exists person_local
(
    id int auto_increment
        primary key,
    smactwsID varchar(45) null,
    personID varchar(255) null,
    givenname varchar(255) null,
    givennameformaly varchar(255) null,
    ensuinggivennames varchar(255) null,
    surname varchar(255) null,
    surnameformerly varchar(255) null,
    salutation varchar(255) null,
    salutationrecipient varchar(255) null,
    titel varchar(255) null,
    graduation varchar(255) null,
    degree varchar(255) null,
    college varchar(255) null,
    nobility varchar(255) null,
    nobilityaddition varchar(255) null,
    district varchar(255) null,
    state varchar(255) null,
    street varchar(255) null,
    streetnumber varchar(255) null,
    zipcode varchar(255) null,
    city varchar(255) null,
    country varchar(255) null,
    addressaddition varchar(255) null,
    telcountrycode varchar(255) null,
    telareacode varchar(255) null,
    telnumber varchar(255) null,
    occupationaltitle varchar(255) null,
    lettersalutation varchar(255) null,
    individuallettersalutation varchar(255) null,
    email varchar(255) null,
    optin varchar(255) charset big5 null,
    memberID varchar(45) null,
    dateofbirth varchar(255) null,
    contactmode varchar(255) null,
    hobbies varchar(255) null,
    primarycharacteristic varchar(255) null,
    secondarycharacteristic varchar(255) null,
    contactinformation longtext null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists persons
(
    id int auto_increment
        primary key,
    smactwsID int null,
    companyID varchar(45) null,
    externID varchar(255) null,
    anrede varchar(255) null,
    anredeEmpf varchar(255) null,
    titel varchar(255) null,
    vorname varchar(255) null,
    vorname2 varchar(255) null,
    vormals_vorname varchar(255) null,
    nachname varchar(255) null,
    vormals_nachname varchar(255) null,
    ortsteil varchar(255) null,
    strasse varchar(255) null,
    hausnr varchar(255) null,
    hausbst varchar(255) null,
    hausbst2 varchar(64) null,
    plz varchar(45) null,
    ort varchar(255) null,
    land varchar(255) null,
    state varchar(255) null,
    akadGrad varchar(255) null,
    abschluss varchar(255) null,
    fh varchar(45) null,
    berufsbezeichnung varchar(255) null,
    briefanrede varchar(255) null,
    briefanredeIndi varchar(255) null,
    adel varchar(255) null,
    adelszusatz varchar(255) null,
    funktion varchar(255) null,
    tel_land varchar(255) null,
    tel_ort varchar(255) null,
    tel_nummer varchar(255) null,
    funk_land varchar(255) null,
    funk_ort varchar(255) null,
    funk_nummer varchar(255) null,
    mail varchar(255) null,
    mailoptin varchar(255) null,
    geburtstag varchar(255) null,
    hobbies varchar(255) null,
    characteristic1 int null,
    characteristic2 int null,
    Kommentar varchar(2048) charset utf8 null,
    anschreibbar varchar(255) null,
    edited_by varchar(255) charset utf8 null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
)
    collate=utf8_unicode_ci;

create table if not exists privilegies
(
    id int auto_increment
        primary key,
    smactwsID int null,
    user int null,
    privilege int null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists products
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactinstance varchar(45) null,
    productID varchar(45) null,
    name varchar(255) null,
    description mediumtext null,
    priceVATex decimal(18,2) null,
    priceVATin decimal(18,2) null,
    vat decimal(18,2) null,
    context varchar(45) null,
    contextID varchar(255) null,
    `group` varchar(45) null,
    online varchar(45) null,
    edited_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
    );

create table if not exists profile
(
    id int auto_increment
        primary key,
    userID int null,
    userImage varchar(255) null,
    bookmarks varchar(512) null,
    infoDismiss varchar(512) default '["0"]' null,
    naviState varchar(512) default '["0"]' null,
    theme varchar(26) null,
    locale varchar(45) default 'de' null,
    fontsize varchar(45) null,
    fontcolor varchar(45) null,
    phone varchar(45) null,
    function varchar(45) null,
    company varchar(45) null,
    facebook varchar(45) null,
    twitter varchar(45) null,
    linkedin varchar(45) null,
    instagram varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists sales_progress
(
    id int auto_increment
        primary key,
    smactwsID int null,
    progressid varchar(45) null,
    processnumber int(5) unsigned zerofill null,
    company int null,
    processdescription varchar(255) null,
    basevalues text null,
    progress text null,
    state varchar(45) null,
    state_comment mediumtext null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists sales_progress_comments
(
    id int auto_increment
        primary key,
    smactwsID int null,
    progressid varchar(45) null,
    comment text null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists sales_subscriptions
(
    id int auto_increment
        primary key,
    smactwsID int null,
    userid int null,
    person int null,
    company int null,
    created_by varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists settings
(
    id int auto_increment
        primary key,
    smactwsID int null,
    name varchar(64) null,
    `values` text null,
    sales text null,
    paymentprovider text null,
    imagename varchar(255) null,
    iframestyle longtext null,
    created_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists smactwsonlineid
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactwsonlineID varchar(45) null,
    styles longtext null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists tasks
(
    id int auto_increment
        primary key,
    smactwsID int null,
    taskID varchar(45) null,
    userID int null,
    state varchar(45) null,
    name varchar(45) null,
    description varchar(45) null,
    priority varchar(45) null,
    remember_at varchar(45) null,
    recurrent int null,
    edited_by varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists tblColumns
(
    id int auto_increment
        primary key,
    user int null,
    tblKind text null,
    tblCol int null,
    tblIndex int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table if not exists timetracker
(
    id int auto_increment
        primary key,
    trackID varchar(45) null,
    userID int null,
    smactwsID int null,
    contextID varchar(45) null,
    context int null,
    started_at int null,
    stopped_at int null,
    description varchar(255) null,
    created_at timestamp null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists tracker
(
    id int auto_increment
        primary key,
    smactwsID int null,
    userid int null,
    context int null,
    contextid int null,
    event varchar(255) null,
    edited_by varchar(255) default 'System Tracker' null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists user_workspace
(
    id mediumint auto_increment
        primary key,
    user_id bigint null,
    workspace_id bigint null,
    active tinyint(1) default 0 null
);

create table if not exists userroles
(
    id int auto_increment
        primary key,
    `order` int null,
    name text null,
    description text null,
    `group` varchar(45) null,
    icon varchar(45) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
    );

create table if not exists users
(
    id int auto_increment
        primary key,
    smactwsID int null,
    name varchar(45) null,
    password varchar(255) null,
    email varchar(45) null,
    remember_token varchar(255) null,
    active int default 1 not null,
    context int null,
    created_by varchar(255) null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table if not exists modules
(
    id int auto_increment
        primary key,
    smactwsID int null,
    smactinstance varchar(45) null,
    modul varchar(255) null,
    name varchar(255) null,
    description varchar(128) null,
    classname varchar(255) null,
    timereference int null,
    role int null,
    edited_by varchar(255) null,
    user_id int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    constraint user_id
        foreign key (user_id) references users (id)
);

create index id_idx
    on modules (user_id);

create table if not exists workspaces
(
    id bigint auto_increment
        primary key,
    name varchar(128) null,
    online_id varchar(32) null,
    owner bigint null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp null,
    deleted_at timestamp null
);

