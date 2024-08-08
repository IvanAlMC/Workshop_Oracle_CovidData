--Para la tabla regions
ALTER TABLE regions add(
   CONSTRAINT regions_pk_idreg PRIMARY KEY (region_id) USING INDEX TABLESPACE covid_index
);

ALTER TABLE regions add(
   CONSTRAINT regions_uq_regcod UNIQUE (region_code)
);


--Para la tabla countries

ALTER TABLE countries add(
   CONSTRAINT countries_pk_idcou PRIMARY KEY (country_id) USING INDEX TABLESPACE covid_index
);

ALTER TABLE countries add(
   CONSTRAINT countries_uq_coucod UNIQUE (country_code),
   CONSTRAINT countries_fk_idreg FOREIGN KEY (region_id) REFERENCES regions(region_id)
);


--Para la tabla covidData

ALTER TABLE CovidData add(
   CONSTRAINT covid_pk_idcov PRIMARY KEY (covid_reg_id) USING INDEX TABLESPACE covid_index
);


ALTER TABLE CovidData add(
   CONSTRAINT covid_fk_idcou FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- En caso d eque no se hayan indexado previamente, se puede usar:
--Creando índices en los IDs y asignarlos a la tablespace covid_index
CREATE INDEX idx_regions_id ON regions(region_id) TABLESPACE covid_index;
CREATE INDEX idx_countries_id ON countries(country_id) TABLESPACE covid_index;
CREATE INDEX idx_coviddata_id ON CovidData(covid_reg_id) TABLESPACE covid_index;

