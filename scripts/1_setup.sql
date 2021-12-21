create
    database "pdf-processing";
\c "pdf-processing";

create type privilege as enum ('user', 'admin');

alter type privilege owner to postgres;

create type education_type as enum ('1. ogretim', '2. ogretim');

alter type education_type owner to postgres;

create table app_user
(
    id        serial
        constraint user_pk
            primary key,
    name      varchar                             not null,
    email     varchar                             not null,
    password  varchar                             not null,
    privilege privilege default 'user'::privilege not null,
    deleted   boolean   default false             not null
);

alter table app_user
    owner to postgres;

create unique index user_email_uindex
    on app_user (email);

create table student
(
    id             integer        not null
        constraint student_pk
            primary key,
    first_name     varchar        not null,
    last_name      varchar        not null,
    education_type education_type not null
);

alter table student
    owner to postgres;

create unique index student_id_uindex
    on student (id);

create table personnel
(
    id         serial
        constraint personnel_pk
            primary key,
    title      varchar,
    first_name varchar not null,
    last_name  varchar not null
);

alter table personnel
    owner to postgres;

create unique index personnel_id_uindex
    on personnel (id);

create table course
(
    id   serial
        constraint course_pk
            primary key,
    name varchar not null
);

alter table course
    owner to postgres;

create unique index course_id_uindex
    on course (id);

create table project
(
    id              serial
        constraint project_pk
            primary key,
    advisor_id      integer not null
        constraint project_personnel_id_fk
            references personnel,
    course_id       integer not null
        constraint project_course_id_fk
            references course,
    title           varchar not null,
    summary         varchar not null,
    submission_date date    not null,
    uploader_id     integer not null
        constraint project_app_user_id_fk
            references app_user
);

alter table project
    owner to postgres;

create unique index project_id_uindex
    on project (id);

create table project_keyword
(
    project_id integer not null
        constraint project_keyword_project_id_fk
            references project,
    keyword    varchar not null,
    constraint project_keyword_pk
        primary key (project_id, keyword)
);

alter table project_keyword
    owner to postgres;

create table project_author
(
    project_id integer not null
        constraint project_author_project_id_fk
            references project,
    author_id  integer not null
        constraint project_author_student_id_fk
            references student,
    constraint project_author_pk
        primary key (project_id, author_id)
);

alter table project_author
    owner to postgres;

create table project_jury
(
    project_id integer not null
        constraint project_jury_project_id_fk
            references project,
    jury_id    integer not null
        constraint project_jury_personnel_id_fk
            references personnel,
    constraint project_jury_pk
        primary key (project_id, jury_id)
);

alter table project_jury
    owner to postgres;


