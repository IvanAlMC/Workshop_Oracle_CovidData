CONNECT covid_user/covid123;

CREATE TABLE regions (
    region_id NUMBER NOT NULL,
    region_code VARCHAR2(10) NOT NULL,
    region_name VARCHAR2(100) NOT NULL
);

CREATE TABLE countries (
    country_id NUMBER NOT NULL,
    country_code VARCHAR2(5) NOT NULL,
    country_name VARCHAR2(255) NOT NULL,
    region_id NUMBER NOT NULL
);

CREATE TABLE CovidData (
    covid_reg_id NUMBER NOT NULL,
    date_reported DATE NOT NULL,
    new_cases NUMBER NOT NULL,
    cumulative_cases NUMBER NOT NULL,
    new_deaths NUMBER NOT NULL,
    Cumulative_deaths NUMBER NOT NULL,
    country_id NUMBER NOT NULL
);