create table admin_support
(
    id int auto_increment primary key,
    workspace text null,
    workspacename text null,
    user text null,
    username text null,
    usermail text null,
    context text null,
    contextdetail text null,
    supporturl text null,
    subject text null,
    supportText text null,
    supportType text null,
    status int null,
    staff text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table angebote
(
    id int auto_increment primary key,
    offerID int null,
    customerID int null,
    context text null,
    date timestamp null,
    duedate timestamp null,
    product int null,
    productCondition int null,
    productDescription text null,
    productPrice float null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table appraisal
(
    id int auto_increment
        primary key,
    saleid int null,
    userid int null,
    companyid int null,
    need text null,
    solution text null,
    research text null,
    options text null,
    network text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table audits
(
    id int auto_increment primary key,
    smactwsID int null,
    user_id int unsigned null,
    user_type varchar(255) null,
    event text not null,
    auditable_id int unsigned not null,
    auditable_type varchar(255) not null,
    old_values text null,
    new_values text null,
    url text null,
    ip_address text null,
    user_agent text null,
    tags text null,
    created_at timestamp null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create index audits_auditable_id_auditable_type_index
    on audits (auditable_id, auditable_type);

create index audits_user_id_user_type_index
    on audits (user_id, user_type);

create table auth
(
    id int auto_increment primary key
);

create table berufe
(
    id int auto_increment primary key,
    interneID int null,
    name text null,
    quelle text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table berufspositionen
(
    id int auto_increment primary key,
    name text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table branchen
(
    id int auto_increment primary key,
    branchenID text null,
    kategorie text null,
    name text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table comments
(
    id int auto_increment primary key,
    smactwsID int null,
    context text null,
    contextID text null,
    comment text null,
    edited_by int not null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create index edited_by_idx
    on comments (edited_by);

create table companies
(
    id int auto_increment primary key,
    smactwsID int null,
    externID text null,
    subid int null,
    name text null,
    firmierung text null,
    namezusatz text null,
    ortsteil text null,
    strasse text null,
    hausnummer text null,
    hausbs text null,
    plz text null,
    ort text null,
    land text null,
    state text null,
    website text null,
    website2 text null,
    mail text null,
    mailoptin text null,
    tel_land text null,
    tel_ort text null,
    tel_nummer text null,
    fax_land text null,
    fax_ort text null,
    fax_nummer text null,
    kernkompetenz text null,
    hauptbranche int null,
    nebenbranche text null,
    profil text null,
    mitarbeiter text null,
    mitarbeiterklasse text null,
    umsatz text null,
    umsatzklasse text null,
    umsatzjahr text null,
    gruendung text null,
    hrnr text null,
    stnr text null,
    ustid text null,
    kdnr text null,
    zahlungsziel text null,
    status int null,
    contactmode int null,
    Kommentar text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    edited_by text null,
    deleted_at timestamp null
);

create table company_global
(
    id int auto_increment primary key,
    companyname text null,
    zipcode text null,
    streetbackup text null,
    street text null,
    streetnumber text null,
    city text null,
    country text null,
    mainsector text null,
    corporatename text null,
    established text null,
    staffquantity text null,
    telareacode text null,
    telnumber text null,
    backupnumber text null,
    website text null,
    annualsalesyear text null,
    lastannualsales text null,
    subsidiaries text null,
    email text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    contact text null
);

create table company_local
(
    id int auto_increment primary key,
    companyID text not null,
    smactwsID text null,
    subscriptionID text null,
    companyname text null,
    companynameadd text null,
    corporatename text null,
    zipcode text null,
    city text null,
    district text null,
    state text null,
    country text null,
    street text null,
    streetnumber text null,
    addressaddition text null,
    telcountrycode text null,
    telareacode text null,
    telnumber text null,
    faxcountrycode text null,
    faxareacode text null,
    faxnumber text null,
    website text null,
    email text null,
    mainsector text null,
    corecompetency text null,
    status text null,
    mailoptin text null,
    profile text null,
    established text null,
    staffquantity text null,
    staffcategory text null,
    lastannualsales text null,
    annualsalesyear text null,
    revenueclass text null,
    customerid text null,
    commercialregisternumber text null,
    taxid text null,
    vatin text null,
    dateofpayment text null,
    indays text null,
    contactinformation text null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table companypersons
(
    id int auto_increment primary key,
    smactwsID int null,
    user text null,
    company text null,
    job text null,
    `function` text null,
    email text null,
    telcountrycode text null,
    telareacode text null,
    telnumber text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
    );

create table countries
(
    id int auto_increment primary key,
    namedt text null,
    `iso-2` text null,
    `iso-3` text null,
    `iso-num` text null,
    phonecode text null,
    created_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
    );

create table customers
(
    ID int auto_increment primary key,
    Feld1 text null,
    Feld2 text null,
    Feld3 datetime null,
    Feld4 text null,
    Feld5 text null,
    Feld6 text null,
    Feld7 text null,
    Feld8 text null,
    Feld9 text null,
    Feld10 text null,
    Feld11 text null,
    Feld12 text null,
    Feld13 text null,
    Feld14 text null,
    Feld15 text null,
    Feld16 text null,
    Feld17 text null,
    Feld18 text null,
    Feld19 text null,
    Feld20 text null,
    Feld21 text null,
    Feld22 double null,
    Feld23 text null,
    Feld24 text null,
    Feld25 text null,
    Feld26 text null,
    Feld27 text null,
    Feld28 text null,
    Feld29 text null,
    Feld30 text null,
    Feld31 text null,
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
);

create table dates
(
    id int auto_increment primary key,
    smactwsID int null,
    userID int null,
    private int null,
    startdate text null,
    enddate text null,
    context text null,
    headline text null,
    description text null,
    url text null,
    class text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    pushnotificationID bigint null
);

create table event_campaign
(
    id int auto_increment
        primary key,
    smactwsID int null,
    campaignID text null,
    eventID text null,
    code text null,
    expire timestamp null,
    reference text null,
    discountValue text null,
    discountType text null,
    invalid int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table eventproducts
(
    id int auto_increment primary key,
    smactwsID int null,
    eventID text null,
    productID text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table events
(
    id int auto_increment primary key,
    smactwsID int null,
    eventID text null,
    eventname text null,
    eventdescription text null,
    eventstart timestamp null,
    eventend timestamp null,
    duration text null,
    context text null,
    status text null,
    statusdefinition text null,
    location text null,
    `limit` int null,
    productID text null,
    reminder timestamp null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table german_streets
(
    id int auto_increment primary key,
    `3166_1N` int null,
    `3166_1A2` text null,
    Staat text null,
    ARS bigint null,
    AGS int null,
    NUTS_3 text null,
    `3166_2` text null,
    Bundesland text null,
    Reg_Bez text null,
    Region text null,
    GtKz int null,
    Gemeindetyp text null,
    KrS text null,
    KrtKz text null,
    Kreistyp text null,
    Kreis text null,
    Zustaend_Gem text null,
    AmtS int null,
    VBtKz int null,
    Verbandstyp text null,
    Zustaend_VB text null,
    RgS text null,
    Reisegebiet text null,
    PLZ varchar(5) not null,
    Ortsname text null,
    Ortszusatz text null,
    Ortsteil text null,
    Straße text null,
    Nummer text null,
    Orientierung text null,
    `Bem.` text null,
    PLZ_2 text null,
    Ortsname_2 text null,
    Ortsteil_2 text null,
    Straße_2 text null,
    Nummer_2 text null,
    `Bem.2` text null
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

create table germany
(
    id int auto_increment primary key,
    townname text null,
    townadd text null,
    townzip text null,
    towndialing text null,
    townstate text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table hobbies
(
    id int auto_increment primary key,
    name text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table incidents
(
    id int auto_increment primary key,
    smactwsID int null,
    userid int null,
    incident text null,
    toContext int null,
    fromContext int null,
    edited_by varchar(255) default 'System Tracker' null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table invoices
(
    id int auto_increment primary key,
    smactwsID int null,
    smactinstance text null,
    invoiceid text null,
    invoiceNo text null,
    company text null,
    `values` text null,
    basevalues text null,
    duedate date null,
    status int default 0 null,
    source int null,
    action int null,
    actionInfo text null,
    barcode text null,
    templatename text null,
    context text null,
    contextID text null,
    contextAmount int null,
    payment text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table items
(
    id int unsigned auto_increment primary key,
    title text not null,
    description text not null,
    created_at timestamp null,
    updated_at timestamp null
);

create table locations
(
    id int auto_increment primary key,
    smactwsID int null,
    locationID text null,
    locationname text null,
    locationadress text null,
    geocords text null,
    max_size int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table messages
(
    id int unsigned auto_increment primary key,
    user_id int unsigned not null,
    message text not null,
    created_at timestamp null,
    updated_at timestamp null
);

create table migrations
(
    id int unsigned auto_increment primary key,
    migration text not null,
    batch int not null
);

create table modul_connector
(
    id int auto_increment primary key,
    smactwsID int null,
    modul int null,
    modulID int null,
    context int null,
    contextID text null,
    value text null,
    description text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table nacev2
(
    id int auto_increment primary key,
    branchenID text null,
    mainsector_normalised text null,
    name text null,
    de text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table names
(
    id int auto_increment primary key,
    name text null,
    sex text null,
    origin text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table offers
(
    id int auto_increment primary key,
    smactwsID int null,
    smactinstance text null,
    offerid text null,
    offerNo text null,
    company text null,
    `values` text null,
    basevalues text null,
    duedate text null,
    status varchar(255) default '0' null,
    templatename text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table orders
(
    id int auto_increment primary key,
    smactwsID int null,
    smactinstance text null,
    context text null,
    contextID text null,
    contextAmount int null,
    orderid text null,
    `values` text null,
    basevalues text null,
    duedate text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table orte
(
    id int auto_increment primary key,
    name text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table password_resets
(
    email varchar(512) not null,
    token text not null,
    created_at timestamp null
);

create index password_resets_email_index
    on password_resets (email);

create table person_local
(
    id int auto_increment primary key,
    smactwsID text null,
    personID text null,
    givenname text null,
    givennameformaly text null,
    ensuinggivennames text null,
    surname text null,
    surnameformerly text null,
    salutation text null,
    salutationrecipient text null,
    titel text null,
    graduation text null,
    degree text null,
    college text null,
    nobility text null,
    nobilityaddition text null,
    district text null,
    state text null,
    street text null,
    streetnumber text null,
    zipcode text null,
    city text null,
    country text null,
    addressaddition text null,
    telcountrycode text null,
    telareacode text null,
    telnumber text null,
    occupationaltitle text null,
    lettersalutation text null,
    individuallettersalutation text null,
    email text null,
    optin text charset big5 null,
    memberID text null,
    dateofbirth text null,
    contactmode text null,
    hobbies text null,
    primarycharacteristic text null,
    secondarycharacteristic text null,
    contactinformation text null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table persons
(
    id int auto_increment primary key,
    smactwsID int null,
    companyID text null,
    externID text null,
    anrede text null,
    anredeEmpf text null,
    titel text null,
    vorname text null,
    vorname2 text null,
    vormals_vorname text null,
    nachname text null,
    vormals_nachname text null,
    ortsteil text null,
    strasse text null,
    hausnr text null,
    hausbst text null,
    hausbst2 text null,
    plz text null,
    ort text null,
    land text null,
    state text null,
    akadGrad text null,
    abschluss text null,
    fh text null,
    berufsbezeichnung text null,
    briefanrede text null,
    briefanredeIndi text null,
    adel text null,
    adelszusatz text null,
    funktion text null,
    tel_land text null,
    tel_ort text null,
    tel_nummer text null,
    funk_land text null,
    funk_ort text null,
    funk_nummer text null,
    mail text null,
    mailoptin text null,
    geburtstag text null,
    hobbies text null,
    characteristic1 int null,
    characteristic2 int null,
    Kommentar text null,
    anschreibbar text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table privilegies
(
    id int auto_increment primary key,
    smactwsID int null,
    user int null,
    privilege int null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table products
(
    id int auto_increment primary key,
    smactwsID int null,
    smactinstance text null,
    productID text null,
    name text null,
    description text null,
    priceVATex decimal(18,2) null,
    priceVATin decimal(18,2) null,
    vat decimal(18,2) null,
    context text null,
    contextID text null,
    `group` text null,
    online text null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
    );

create table profile
(
    id int auto_increment primary key,
    userID int null,
    userImage text null,
    bookmarks text null,
    infoDismiss varchar(255) default '["0"]' null,
    naviState varchar(255) default '["0"]' null,
    theme text null,
    locale varchar(255) default 'de' null,
    fontsize text null,
    fontcolor text null,
    phone text null,
    `function` text null,
    company text null,
    facebook text null,
    twitter text null,
    linkedin text null,
    instagram text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
    );

create table sales_progress
(
    id int auto_increment primary key,
    smactwsID int null,
    progressid text null,
    processnumber text null,
    company int null,
    processdescription text null,
    basevalues text null,
    progress text null,
    state text null,
    state_comment text null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table sales_progress_comments
(
    id int auto_increment primary key,
    smactwsID int null,
    progressid text null,
    comment text null,
    edited_by int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table sales_subscriptions
(
    id int auto_increment primary key,
    smactwsID int null,
    userid int null,
    person int null,
    company int null,
    created_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table settings
(
    id int auto_increment primary key,
    smactwsID int null,
    name text null,
    `values` text null,
    sales text null,
    paymentprovider text null,
    imagename text null,
    iframestyle text null,
    created_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table smact_campaigns
(
    id int auto_increment primary key,
    campaignID text null,
    code text null,
    expire timestamp null,
    value int null,
    type int null,
    invalid int null,
    reference text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table smact_paymentplans
(
    id int auto_increment primary key,
    smactwsID int null,
    owner_id int null,
    first_order timestamp null,
    cycle text null,
    cycle_start timestamp null,
    cycle_duration int null,
    campaign text null,
    campaign_value int null,
    campaign_type int null,
    price int null,
    charge int null,
    deposit int null,
    status text null,
    preannouncement timestamp null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table smact_products
(
    id int auto_increment primary key,
    nameDE text null,
    descriptionDE text null,
    nameEN text null,
    descriptionEN text null,
    value int null,
    minimum_term int null,
    online_available int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table smactwsonlineid
(
    id int auto_increment primary key,
    smactwsID int null,
    smactwsonlineID text null,
    styles text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table tasks
(
    id int auto_increment primary key,
    smactwsID int null,
    taskID text null,
    userID int null,
    state text null,
    name text null,
    description text null,
    priority text null,
    remember_at text null,
    recurrent int null,
    edited_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table tblColumns
(
    id int auto_increment primary key,
    user int null,
    tblKind text null,
    tblCol int null,
    tblIndex int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
);

create table timetracker
(
    id int auto_increment primary key,
    trackID text null,
    userID int null,
    smactwsID int null,
    contextID text null,
    context int null,
    started_at int null,
    stopped_at int null,
    description text null,
    created_at timestamp null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table tracker
(
    id int auto_increment primary key,
    smactwsID int null,
    userid int null,
    context int null,
    contextid int null,
    event text null,
    edited_by varchar(255) default 'System Tracker' null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table user_workspace
(
    id mediumint auto_increment primary key,
    user_id bigint null,
    workspace_id bigint null,
    active boolean default 0 null
);

create table userroles
(
    id int auto_increment primary key,
    `order` int null,
    name text null,
    description text null,
    `group` text null,
    icon text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null
    );

create table users
(
    id int auto_increment primary key,
    smactwsID int null,
    name text null,
    password text null,
    email text null,
    remember_token text null,
    active int default 1 not null,
    context int null,
    session_id text null,
    created_by text null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null
);

create table modules
(
    id int auto_increment primary key,
    smactwsID int null,
    smactinstance text null,
    modul text null,
    name text null,
    description text null,
    classname text null,
    timereference int null,
    role int null,
    edited_by text null,
    user_id int null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp null,
    deleted_at timestamp null,
    constraint user_id
        foreign key (user_id) references users (id)
);

create index id_idx
    on modules (user_id);

create table workspaces
(
    id bigint auto_increment primary key,
    name text null,
    online_id text null,
    owner bigint null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp null,
    deleted_at timestamp null
);

