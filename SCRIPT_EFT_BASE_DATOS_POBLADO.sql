INSERT INTO ESPECIALIDAD_ACADEMIA(ID_ESPECIALIDAD, NOMBRE_ESPECIALIDAD , ESTADO) VALUES (1, 'DANZA', 1);
INSERT INTO ESPECIALIDAD_ACADEMIA(ID_ESPECIALIDAD, NOMBRE_ESPECIALIDAD , ESTADO) VALUES (2, 'CANTO', 1);
INSERT INTO ESPECIALIDAD_ACADEMIA(ID_ESPECIALIDAD, NOMBRE_ESPECIALIDAD , ESTADO) VALUES (3, 'INTERPRETE MUSICAL', 1);

INSERT INTO REGION(ID_REGION, NOMBRE_REGION, ESTADO) VALUES (1, 'REGION METROPOLITANA', 1);
INSERT INTO REGION(ID_REGION, NOMBRE_REGION, ESTADO) VALUES (2, 'REGION VALPARAISO', 2);
INSERT INTO REGION(ID_REGION, NOMBRE_REGION, ESTADO) VALUES (3, 'REGION MAULE', 3);

INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (1, 'RECOLETA', 1, 1);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (2, 'LA REINA', 1, 1);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (3, 'LO PRADO', 1, 1);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (4, 'VINA MAR', 1, 2);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (5, 'VALPARAISO', 1, 2);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (6, 'QUILPUE', 1, 2);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (7, 'CURICO', 1, 3);
INSERT INTO COMUNA(ID_COMUNA, NOMBRE_COMUNA, ESTADO, ID_REGION) VALUES (8, 'TALCA', 1, 3);



INSERT INTO DIRECCION(ID_DIRECCION, CALLE, NUMERO, REFERENCIA, ESTADO, ID_COMUNA) VALUES (1, 'AVDA EL SALTO','5421','',1,1);
INSERT INTO DIRECCION(ID_DIRECCION, CALLE, NUMERO, REFERENCIA, ESTADO, ID_COMUNA) VALUES (2, 'AVDA EL RECOLETA','1254','',1,1);
INSERT INTO DIRECCION(ID_DIRECCION, CALLE, NUMERO, REFERENCIA, ESTADO, ID_COMUNA) VALUES (3, 'LAS GAVIOTAS','277','',1,1);


INSERT INTO ACADEMIA(ID_ACADEMIA, NOMBRE_ACADEMIA, ESTADO, EMAIL, CUENTA_BANCARIA, TIPO_CUENTA_BANCARIA, TITULAR_CUENTA, RUT_EMPRESA) VALUES(ACADEMIA_SEQ.nextval,'ACADEMIA EL SALTO', 1,'NATALYCHACON@EMAIL.COM','12345','CORRIENTE','NATALY CHACON', '16802144-5');
INSERT INTO SEDE_ACADEMIA(ID_ACADEMIA , ID_DIRECCION, ES_PRINCIPAL, PROPIO_ARRIENDO, COSTO_ADQUISION, COSTO_ARRIENDO_MENSUAL) VALUES (0, 1, 'S', 'A', 0, 300000);
INSERT INTO ESPECIALIDADES_ACADEMIA(ID_ACADEMIA, ID_ESPECIALIDAD, ESTADO) VALUES (0, 1, 1);
INSERT INTO ESPECIALIDADES_ACADEMIA(ID_ACADEMIA, ID_ESPECIALIDAD, ESTADO) VALUES (0, 2, 1);

INSERT INTO PROFESION(ID_PROFESION, NOMBRE_PROFESION, ESTADO) VALUES (1, 'PROFESOR ARTE', 1);
INSERT INTO PROFESION(ID_PROFESION, NOMBRE_PROFESION, ESTADO) VALUES (2, 'PROFESOR MUSICA', 1);
INSERT INTO PAIS(ID_PAIS, NOMBRE_PAIS, ESTADO) VALUES (1, 'CHILE', 1);
INSERT INTO PAIS(ID_PAIS, NOMBRE_PAIS, ESTADO) VALUES (2, 'VENEZUELA', 1);
INSERT INTO PERSONA(ID_PERSONA, IDENTIFICADOR_NACIONAL, NOMBRES, APELLIDOS, TELEFONO, EMAIL, ESTADO, ID_PAIS) VALUES (PERSONA_SEQ.nextval, '16802144-5','NATALY DEL PILAR','CHACON BORQUEZ','555666','NATALY@MAIL.COM',1,1);
INSERT INTO PROFESOR(ID_ACADEMIA, ID_PERSONA, FECHA_CONTRATACION , FECHA_DESVINCULACION , ES_PLANTA, ES_DIRECTOR,  ESTADO) VALUES (0,0,TO_DATE('2024-01-01','YYYY-MM-DD'),NULL,1,1,1);

INSERT INTO TURNO(ID_ACADEMIA, ID_PERSONA, AGNO, MES, HORA_INICIO, HORA_TERMINO, SUELDO_TURNO) VALUES (0, 0, 2024, 10, 1600, 1800, 50000);
INSERT INTO TURNO(ID_ACADEMIA, ID_PERSONA, AGNO, MES, HORA_INICIO, HORA_TERMINO, SUELDO_TURNO) VALUES (0, 0, 2024, 09, 1600, 1800, 50000);


INSERT INTO TIPO_EQUIPAMIENTO(ID_TIPO_EQUIPAMIENTO, NOMBRE_TIPO_EQUIPAMIENTO, ESTADO) VALUES (1, 'VIOLIN', 1);
INSERT INTO TIPO_EQUIPAMIENTO(ID_TIPO_EQUIPAMIENTO, NOMBRE_TIPO_EQUIPAMIENTO, ESTADO) VALUES (2, 'GUITARRA', 1);

INSERT INTO TIPO_INSUMO(ID_TIPO_INSUMO, NOMBRE_TIPO_INSUMO, ESTADO) VALUES (1, 'CUERDA', 1);


INSERT INTO INSUMO_TIPO_EQUIPAMIENTO(ID_TIPO_EQUIPAMIENTO, ID_TIPO_INSUMO, ESTADO) VALUES (1, 1, 1);
INSERT INTO INSUMO_TIPO_EQUIPAMIENTO(ID_TIPO_EQUIPAMIENTO, ID_TIPO_INSUMO, ESTADO) VALUES (2, 1, 1);

INSERT INTO EQUIPAMIENTO(ID_EQUIPAMIENTO, MARCA, MODELO, FECHA_ADQUISICION, FECHA_ELIMINACION, ESTADO, COSTO_ADQUISION, ID_TIPO_EQUIPAMIENTO, ID_ACADEMIA , NUMERO_SERIE) VALUES (EQUIPAMIENTO_SEQ.nextval, 'SUPER VIOLIN','JUVENIL', TO_DATE('2024-01-01','YYYY-MM-DD'), NULL, 1, 50000000, 1, 0, '2323-2323-34');
INSERT INTO EQUIPAMIENTO(ID_EQUIPAMIENTO, MARCA, MODELO, FECHA_ADQUISICION, FECHA_ELIMINACION, ESTADO, COSTO_ADQUISION, ID_TIPO_EQUIPAMIENTO, ID_ACADEMIA, NUMERO_SERIE) VALUES (EQUIPAMIENTO_SEQ.nextval, 'GUITARRIN','ELEX V2', TO_DATE('2024-01-01','YYYY-MM-DD'), NULL, 1, 40000000, 2, 0, 'DSD-454-V');

INSERT INTO INSUMO(ID_INSUMO, MARCA, MODELO, FECHA_ADQUISION , COSTO_ADQUISION , ESTADO, ID_EQUIPAMIENTO, ID_TIPO_INSUMO, NUMERO_SERIE) VALUES (INSUMO_SEQ.nextval, 'CUERDA SPHERE','HG56',TO_DATE('2024-05-01','YYYY-MM-DD'),1000000, 1, 0, 1, 'NS123');
INSERT INTO INSUMO(ID_INSUMO, MARCA, MODELO, FECHA_ADQUISION, COSTO_ADQUISION, ESTADO, ID_EQUIPAMIENTO, ID_TIPO_INSUMO, NUMERO_SERIE) VALUES (INSUMO_SEQ.nextval, 'CUERDA METIX','JU5-X',TO_DATE('2024-06-01','YYYY-MM-DD'),20000, 1, 1, 1, 'NS456');