CREATE DATABASE desafio_docker;

USE desafio_docker;

CREATE TABLE module (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO module VALUES (null, 'Docker');
INSERT INTO module VALUES (null, 'Integração Contínua');
INSERT INTO module VALUES (null, 'Kubernetes');
INSERT INTO module VALUES (null, 'Observabilidade');
INSERT INTO module VALUES (null, 'Comunicação');
INSERT INTO module VALUES (null, 'RabbitMQ');
