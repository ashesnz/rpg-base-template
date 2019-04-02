CREATE TABLE roles 
(
  id BIGSERIAL PRIMARY KEY,
  name character varying,
  type character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

INSERT INTO roles (name, type, created_at) VALUES ('test', 'user', '2019-01-29');