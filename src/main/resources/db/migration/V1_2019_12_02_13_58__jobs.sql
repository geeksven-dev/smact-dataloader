create table jobs(
                     id bigint auto_increment primary key,
                     queue varchar(255),
                     payload text,
                     attempts int,
                     reserved_at int(10) unsigned DEFAULT NULL,
                     available_at int(10) unsigned NOT NULL,
                     created_at int(10) unsigned NOT NULL,
                     KEY jobs_queue_index (queue)
);
