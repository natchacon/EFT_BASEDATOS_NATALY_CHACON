CREATE TABLE academia (
    id_academia          NUMBER NOT NULL,
    nombre_academia      VARCHAR2(100) NOT NULL,
    estado               CHAR(1) NOT NULL,
    email                VARCHAR2(100) NOT NULL,
    cuenta_bancaria      VARCHAR2(100) NOT NULL,
    tipo_cuenta_bancaria VARCHAR2(10) NOT NULL,
    titular_cuenta       VARCHAR2(100) NOT NULL,
    rut_empresa          VARCHAR2(10)
);

ALTER TABLE academia ADD CONSTRAINT academia_pk PRIMARY KEY ( id_academia );

CREATE TABLE comuna (
    id_comuna     NUMBER(10) NOT NULL,
    nombre_comuna VARCHAR2(100) NOT NULL,
    estado        CHAR(1) NOT NULL,
    id_region     NUMBER(10) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE direccion (
    id_direccion NUMBER(10) NOT NULL,
    calle        VARCHAR2(100) NOT NULL,
    numero       VARCHAR2(20) NOT NULL,
    referencia   VARCHAR2(50),
    estado       CHAR(1) NOT NULL,
    id_comuna    NUMBER(10) NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( id_direccion );

CREATE TABLE equipamiento (
    id_equipamiento      NUMBER(10) NOT NULL,
    marca                VARCHAR2(100) NOT NULL,
    modelo               VARCHAR2(100) NOT NULL,
    fecha_adquisicion    TIMESTAMP WITH TIME ZONE NOT NULL,
    fecha_eliminacion    TIMESTAMP WITH LOCAL TIME ZONE,
    estado               CHAR(1) NOT NULL,
    costo_adquision      NUMBER(10, 2) NOT NULL,
    id_tipo_equipamiento NUMBER(10) NOT NULL,
    id_academia          NUMBER NOT NULL,
    numero_serie         VARCHAR2(100)
);

ALTER TABLE equipamiento ADD CONSTRAINT equipamiento_pk PRIMARY KEY ( id_equipamiento );

CREATE TABLE especialidad_academia (
    id_especialidad     NUMBER NOT NULL,
    nombre_especialidad VARCHAR2(100) NOT NULL,
    estado              CHAR(1) NOT NULL
);

ALTER TABLE especialidad_academia ADD CONSTRAINT especialidad_academia_pk PRIMARY KEY ( id_especialidad );

CREATE TABLE especialidades_academia (
    id_academia                  NUMBER NOT NULL, 
    id_especialidad NUMBER NOT NULL,
    estado                                CHAR(1)
);

ALTER TABLE especialidades_academia ADD CONSTRAINT especialidad_academiav1_pk PRIMARY KEY ( id_academia,
                                                                                            id_especialidad );

CREATE TABLE insumo (
    id_insumo       NUMBER(10) NOT NULL,
    marca           VARCHAR2(100),
    modelo          VARCHAR2(100),
    fecha_adquision DATE NOT NULL,
    costo_adquision NUMBER(10, 2),
    estado          CHAR(1) NOT NULL,
    id_equipamiento NUMBER(10) NOT NULL,
    id_tipo_insumo  NUMBER(10) NOT NULL,
    numero_serie    VARCHAR2(100)
);

ALTER TABLE insumo ADD CONSTRAINT insumo_pk PRIMARY KEY ( id_insumo );

CREATE TABLE insumo_tipo_equipamiento ( 
    id_tipo_equipamiento NUMBER(10) NOT NULL,
    id_tipo_insumo             NUMBER(10) NOT NULL,
    estado                                 CHAR(1) NOT NULL
);

ALTER TABLE insumo_tipo_equipamiento ADD CONSTRAINT insumo_tipo_equipamiento_pk PRIMARY KEY ( id_tipo_equipamiento,
                                                                                              id_tipo_insumo);

CREATE TABLE pais (
    id_pais     NUMBER(10) NOT NULL,
    nombre_pais VARCHAR2(100) NOT NULL,
    estado      CHAR(1) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE persona (
    id_persona             NUMBER NOT NULL,
    identificador_nacional VARCHAR2(10) NOT NULL,
    nombres                VARCHAR2(100) NOT NULL,
    apellidos              VARCHAR2(100),
    telefono               VARCHAR2(20),
    email                  VARCHAR2(100),
    estado                 CHAR(1) NOT NULL,
    id_pais                NUMBER(10) NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE profesion (
    id_profesion     NUMBER(10) NOT NULL,
    nombre_profesion VARCHAR2(100) NOT NULL,
    estado           CHAR(1) NOT NULL
);

ALTER TABLE profesion ADD CONSTRAINT profesion_pk PRIMARY KEY ( id_profesion );

CREATE TABLE profesion_persona (
    id_persona     NUMBER NOT NULL,
    id_profesion NUMBER(10) NOT NULL,
    estado                 CHAR(1) NOT NULL,
    fecha_titulacion       DATE NOT NULL
);

ALTER TABLE profesion_persona ADD CONSTRAINT profesion_persona_pk PRIMARY KEY ( id_persona,
                                                                                id_profesion );

CREATE TABLE profesor (
    fecha_contratacion   DATE NOT NULL,
    fecha_desvinculacion DATE,
    estado               CHAR(1) NOT NULL,
    id_academia          NUMBER NOT NULL,
    id_persona           NUMBER NOT NULL,
    es_planta            CHAR(1),
    es_director          CHAR(1)
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( id_academia,
                                                              id_persona );

CREATE TABLE region (
    id_region     NUMBER(10) NOT NULL,
    nombre_region VARCHAR2(100) NOT NULL,
    estado        CHAR(1) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE sede_academia (
    id_academia   NUMBER NOT NULL,
    id_direccion NUMBER(10) NOT NULL,
    es_principal           CHAR(1) NOT NULL,
    propio_arriendo        CHAR(1) NOT NULL,
    costo_adquision        NUMBER(10, 2),
    costo_arriendo_mensual NUMBER(10, 2)
);

ALTER TABLE sede_academia ADD CONSTRAINT sede_academia_pk PRIMARY KEY ( id_academia,
                                                                        id_direccion );

CREATE TABLE tipo_equipamiento (
    id_tipo_equipamiento     NUMBER(10) NOT NULL,
    nombre_tipo_equipamiento VARCHAR2(100) NOT NULL,
    estado                   CHAR(1) NOT NULL
);

ALTER TABLE tipo_equipamiento ADD CONSTRAINT tipo_equipamiento_pk PRIMARY KEY ( id_tipo_equipamiento );

CREATE TABLE tipo_insumo (
    id_tipo_insumo     NUMBER(10) NOT NULL,
    nombre_tipo_insumo VARCHAR2(100) NOT NULL,
    estado             CHAR(1) NOT NULL
);

ALTER TABLE tipo_insumo ADD CONSTRAINT tipo_insumo_pk PRIMARY KEY ( id_tipo_insumo );

CREATE TABLE turno (
    agno         NUMBER(4) NOT NULL,
    mes          NUMBER(2) NOT NULL,
    sueldo_turno NUMBER(10, 2) NOT NULL,
    id_academia  NUMBER NOT NULL,
    id_persona   NUMBER NOT NULL,
    hora_inicio  NUMBER(4),
    hora_termino NUMBER(4)
);

ALTER TABLE turno
    ADD CONSTRAINT turno_pk PRIMARY KEY ( mes,
                                          agno,
                                          id_academia,
                                          id_persona );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( id_region )
        REFERENCES region ( id_region );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_comuna_fk FOREIGN KEY ( id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE equipamiento
    ADD CONSTRAINT equipamiento_academia_fk FOREIGN KEY ( id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE equipamiento
    ADD CONSTRAINT equip_tipo_equi_fk FOREIGN KEY ( id_tipo_equipamiento )
        REFERENCES tipo_equipamiento ( id_tipo_equipamiento );

ALTER TABLE especialidades_academia
    ADD CONSTRAINT especia_acade_acad_fk FOREIGN KEY ( id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE especialidades_academia
    ADD CONSTRAINT espe_acad_esp_ac_fk FOREIGN KEY (id_especialidad )
        REFERENCES especialidad_academia ( id_especialidad );

ALTER TABLE insumo
    ADD CONSTRAINT insumo_equipamiento_fk FOREIGN KEY ( id_equipamiento )
        REFERENCES equipamiento ( id_equipamiento );


ALTER TABLE insumo_tipo_equipamiento
    ADD CONSTRAINT insumo_tipo_equip_tipo_equip_fk FOREIGN KEY (id_tipo_equipamiento )
        REFERENCES tipo_equipamiento ( id_tipo_equipamiento );

ALTER TABLE insumo_tipo_equipamiento
    ADD CONSTRAINT ins_t_equi_tipo_in_fk FOREIGN KEY ( id_tipo_insumo )
        REFERENCES tipo_insumo ( id_tipo_insumo );

ALTER TABLE insumo
    ADD CONSTRAINT insumo_tipo_insumo_fk FOREIGN KEY ( id_tipo_insumo )
        REFERENCES tipo_insumo ( id_tipo_insumo );

ALTER TABLE persona
    ADD CONSTRAINT persona_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE profesion_persona
    ADD CONSTRAINT profesion_persona_persona_fk FOREIGN KEY (id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE profesion_persona
    ADD CONSTRAINT profesion_persona_profesion_fk FOREIGN KEY (id_profesion )
        REFERENCES profesion ( id_profesion );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_academia_fk FOREIGN KEY ( id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_persona_fk FOREIGN KEY ( id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE sede_academia
    ADD CONSTRAINT sede_academia_academia_fk FOREIGN KEY ( id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE sede_academia
    ADD CONSTRAINT sede_academia_direccion_fk FOREIGN KEY ( id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE turno
    ADD CONSTRAINT turno_profesor_fk FOREIGN KEY ( id_academia,
                                                   id_persona )
        REFERENCES profesor ( id_academia,
                              id_persona );

CREATE SEQUENCE ACADEMIA_SEQ INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE PERSONA_SEQ INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE EQUIPAMIENTO_SEQ INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE INSUMO_SEQ INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER;