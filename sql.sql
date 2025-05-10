-- Creación de la tabla CLIENTE
CREATE TABLE cliente (
    identificacion INTEGER PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    correo VARCHAR2(30) NOT NULL
);

-- Creación de la tabla CONCESIONARIO
CREATE TABLE concesionario (
    nit VARCHAR2(20) PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    direccion VARCHAR2(40) NOT NULL,
    telefono VARCHAR2(20) NOT NULL,
    correo VARCHAR2(30) NOT NULL
);

-- Creación de la tabla EMPLEADO
CREATE TABLE empleado (
    identificacion NUMBER PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    telefono NUMBER NOT NULL,
    correo VARCHAR2(30) NOT NULL
);

-- Creación de la tabla EMPLEADOCONCESIONARIO
CREATE TABLE empleadoConcesionario (
    id NUMBER PRIMARY KEY,
    fecha_vinculacion DATE NOT NULL,
    concesionario_nit VARCHAR2(20) NOT NULL,
    empleado_id NUMBER NOT NULL,
    CONSTRAINT empleadoConcesionario_concesionario_FK FOREIGN KEY (concesionario_nit) REFERENCES concesionario(nit),
    CONSTRAINT empleadoConcesionario_empleado_FK FOREIGN KEY (empleado_id) REFERENCES empleado(identificacion)
);

-- Creación de la tabla AUTO
CREATE TABLE auto (
    codigo INTEGER PRIMARY KEY,
    marca VARCHAR2(30) NOT NULL,
    modelo VARCHAR2(30) NOT NULL,
    cilindraje NUMBER NOT NULL,
    precio NUMBER NOT NULL,
    descuento NUMBER NOT NULL,
    placa VARCHAR2(15) NOT NULL
);

-- Creación de la tabla CONCESIONARIOAUTO
CREATE TABLE concesionarioAuto (
    id INTEGER PRIMARY KEY,
    unidades NUMBER NOT NULL,
    auto_codigo INTEGER NOT NULL,
    concesionario_nit VARCHAR2(20) NOT NULL,
    CONSTRAINT concesionarioAuto_auto_FK FOREIGN KEY (auto_codigo) REFERENCES auto(codigo),
    CONSTRAINT concesionarioAuto_concesionario_FK FOREIGN KEY (concesionario_nit) REFERENCES concesionario(nit)
);

-- Creación de la tabla VENTA
CREATE TABLE venta (
    id_venta INTEGER PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    precio_final NUMBER NOT NULL,
    unidades INTEGER NOT NULL,
    cliente_identificacion INTEGER NOT NULL,
    auto_codigo INTEGER NOT NULL,
    CONSTRAINT venta_cliente_FK FOREIGN KEY (cliente_identificacion) REFERENCES cliente(identificacion),
    CONSTRAINT venta_auto_FK FOREIGN KEY (auto_codigo) REFERENCES auto(codigo)
);

-- Creación de la tabla PROVEEDOR
CREATE TABLE proveedor (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    correo VARCHAR2(30) NOT NULL,
    web VARCHAR2(40) NOT NULL
);

-- Creación de la tabla PROVEEDORAUTO
CREATE TABLE proveedorAuto (
    id INTEGER PRIMARY KEY,
    fecha DATE NOT NULL,
    cantidad NUMBER NOT NULL,
    proveedor_id INTEGER NOT NULL,
    auto_codigo INTEGER NOT NULL,
    CONSTRAINT proveedorAuto_proveedor_FK FOREIGN KEY (proveedor_id) REFERENCES proveedor(id),
    CONSTRAINT proveedorAuto_auto_FK FOREIGN KEY (auto_codigo) REFERENCES auto(codigo)
);

-- Creación de la tabla REPUESTO
CREATE TABLE repuesto (
    codigo INTEGER PRIMARY KEY,
    descripcion VARCHAR2(60) NOT NULL,
    valor NUMBER NOT NULL
);

-- Creación de la tabla PROVEEDORREPUESTO
CREATE TABLE proveedorRepuesto (
    id INTEGER PRIMARY KEY,
    cantidad SMALLINT NOT NULL,
    fecha_suministro DATE NOT NULL,
    proveedor_id INTEGER NOT NULL,
    repuesto_codigo INTEGER NOT NULL,
    CONSTRAINT proveedorRepuesto_proveedor_FK FOREIGN KEY (proveedor_id) REFERENCES proveedor(id),
    CONSTRAINT proveedorRepuesto_repuesto_FK FOREIGN KEY (repuesto_codigo) REFERENCES repuesto(codigo)
);
