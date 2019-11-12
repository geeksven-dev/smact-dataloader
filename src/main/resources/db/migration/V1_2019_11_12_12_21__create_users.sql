INSERT INTO workspaces
VALUES (NULL, 'SMACT Admins', '8f8940bc030798e765e89bc7cfcf0573', 1, '2019-07-22 20:29:51', NULL, NULL);

INSERT INTO users
VALUES (NULL, 1, 'Sebastian Hausding', '$2y$10$FXCxgULKxeKSBghM1nElj.DZ1DRvHuwkjm4yxac2Hw4v5/CJHh0fe', 'office@the-cage-complex.com',
        'S5bmUajWlBW7UrGeRUvSA2a5iCTfmphzM5AEYAwCpuhmMIOPsZ8UjUffp0dS', 1, 2, 'ZLDLWO7ixw5zG3A6I0KYO8KYezU5Bq70jFFMaiUg', NULL, '2018-08-14 09:00:54',
        '2019-11-06 09:21:45', NULL),
       (NULL, 1, 'Sven Reinhardt', '$2y$10$Y/1b72y19gZ4mVFRF8VIs.Rwalye2QzGRrWtREt8Wfjf3y5AdYk1K', 'sven.reinhardt06@googlemail.com',
        'oiNfPBz6DY6igIR0y5ZfkfgxrRLJjk1oHRoEdmR6MTfkkulkoInTEOM4FnHd', 1, 1, NULL, 'Sebastian Hausding', '2019-01-24 12:28:19', '2019-01-24 12:57:19', NULL);

INSERT INTO user_workspace
VALUES (NULL, 1, 1, 1);
INSERT INTO user_workspace
VALUES (NULL, 2, 1, 1);


INSERT INTO profile
VALUES (NULL, 1, '16e708304205d3c089.jpg', NULL, '[\"0\",\"35\"]', '[\"0\"]', 'day', 'de', NULL, NULL, '0162 2091499', 'Backend Dev', 'THE CAGE COMPLEX', NULL,
        'https://twitter.com/tcc_dcn', NULL, 'Sebastian Hausding', '2018-12-02 18:51:48', '2019-10-28 09:19:51'),
       (NULL, 2, '51c66833e6784d9fc4.png', NULL, '[\"0\"]', '[\"0\"]', 'day', 'de', NULL, NULL, NULL, NULL, 'geeksven', NULL, NULL, NULL, NULL,
        '2019-01-25 06:37:49', '2019-01-25 07:05:46');


INSERT INTO userroles
VALUES (NULL, 100, 'CompanyOV', 'Firmenübersicht', 'company', 'flaticon-squares-3', '2018-10-20 09:41:23', NULL),
(NULL, 103, 'CompanyEdit', 'Firmen editieren', 'company', 'flaticon-squares-3', '2018-10-20 09:41:23', NULL),
(NULL, 104, 'CompanyDelete', 'Firmen löschen', 'company', 'flaticon-squares-3', '2018-10-20 09:41:23', NULL),
(NULL, 102, 'CompanyView', 'Firmen ansehen', 'company', 'flaticon-squares-3', '2018-10-20 09:41:23', NULL),
(NULL, 101, 'CompanyCreate', 'Firma anlegen', 'company', 'flaticon-squares-3', '2018-10-20 09:41:23', NULL),
(NULL, 200, 'PersonOV', 'Personübersicht', 'person', 'flaticon-users', '2018-10-20 09:41:23', NULL),
(NULL, 203, 'PersonEdit', 'Person editieren', 'person', 'flaticon-user-ok', '2018-10-20 09:41:23', NULL),
(NULL, 204, 'PersonDelete', 'Person löschen', 'person', 'flaticon-user-settings', '2018-10-20 09:41:23', NULL),
(NULL, 202, 'PersonView', 'Person ansehen', 'person', 'flaticon-users', '2018-10-20 09:41:23', NULL),
(NULL, 201, 'PersonCreate', 'Person anlegen', 'person', 'flaticon-user-add', '2018-10-20 09:41:23', NULL),
(NULL, 300, 'DeletedElements', 'Gelöschte Elemente', 'admin', 'flaticon-box', '2018-10-20 09:41:23', NULL),
(NULL, 400, 'AuditOV', 'Auditübersicht', 'admin', 'flaticon-file-2', '2018-10-20 09:41:23', NULL),
(NULL, 401, 'AuditSpecific', 'dediziertes Audit', 'admin', 'flaticon-file-2', '2018-10-20 09:41:23', NULL),
(NULL, 500, 'Usermanagement', 'Nutzerverwaltung', 'admin', 'flaticon-users-1', '2018-10-20 09:41:23', NULL),
(NULL, 301, 'RestoreElements', 'Elemente wiederherstellen', 'admin', 'flaticon-box-1', '2018-10-23 08:34:01', NULL),
(NULL, 600, 'ShopOrders', 'Paket upgraden', 'dashboard', 'flaticon-rocket', '2018-12-03 09:14:32', NULL),
(NULL, 700, 'App', 'SMACT APP', 'app', 'flaticon-responsive', '2018-12-03 11:33:27', NULL),
(NULL, 1100, 'WidgetKalender', 'Widget Kalender', 'widgets', 'flaticon-time-2', '2019-02-01 08:31:39', NULL),
(NULL, 1001, 'WidgetSearch', 'Widget Suche Sachen', 'widgets', 'flaticon-search', '2019-02-02 01:08:04', NULL),
(NULL, 610, 'Sales', 'Sales', 'sales', 'flaticon-customer', '2019-02-19 13:14:41', NULL),
(NULL, 1100, 'Backoffice', 'Backoffice', 'backoffice', 'flaticon-piggy-bank', '2019-03-11 12:51:52', NULL),
(NULL, 501, 'PortalManagement', 'Portal', 'admin', 'flaticon-users-1', '2019-03-14 19:33:15', NULL),
(NULL, 502, 'ProduktManagement', 'Produkt', 'admin', 'flaticon-users-1', '2019-03-14 19:33:15', NULL),
(NULL, 1200, 'ProjektManagement', 'Projektverwaltung', 'project', 'flaticon-presentation', '2019-09-08 10:47:15', NULL),
(NULL, 1300, 'EventManagement', 'Eventverwaltung', 'event', 'flaticon-event-calendar-symbol', '2019-09-10 17:34:29', NULL),
(NULL, 1301, 'EventCreate', 'Event anlegen', 'event', 'flaticon-event-calendar-symbol', '2019-09-10 17:34:29', NULL),
(NULL, 503, 'LocationManagement', 'Lokation', 'admin', 'flaticon-users-1', '2019-09-10 19:01:50', NULL);

INSERT INTO privilegies VALUES
(NULL,1,1,1,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,2,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,3,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,4,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,5,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,6,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,7,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,8,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,9,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,10,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,11,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,12,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,13,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,14,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,15,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,16,'Sebastian Hausding','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,1,17,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,35,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,36,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,37,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,38,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,39,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,40,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,41,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,42,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,43,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,44,'Sebastian Hausding','2019-10-07 16:19:18','2019-10-07 16:19:18'),

(NULL,1,2,1,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,2,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,3,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,4,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,5,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,6,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,7,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,8,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,9,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,10,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,11,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,12,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,13,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,14,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,15,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,16,'Sven Reinhardt','2019-10-07 16:19:17','2019-10-07 16:19:17'),
(NULL,1,2,17,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,35,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,36,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,37,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,38,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,39,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,40,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,41,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,2,42,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,43,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18'),
(NULL,1,1,44,'Sven Reinhardt','2019-10-07 16:19:18','2019-10-07 16:19:18');
