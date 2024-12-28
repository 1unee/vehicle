CREATE SCHEMA IF NOT EXISTS dict;


CREATE TABLE dict.file_group
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.file_group IS 'Группы файлов';
COMMENT ON COLUMN dict.file_group.id IS 'Идентификатор группы файлов';
COMMENT ON COLUMN dict.file_group.code IS 'Код группы файлов';
COMMENT ON COLUMN dict.file_group.value IS 'Название группы файлов';
COMMENT ON COLUMN dict.file_group.description IS 'Описание группы файлов';
COMMENT ON COLUMN dict.file_group.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.file_group.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.file_group.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.file_group.updated_at IS 'Время изменения записи';


CREATE TABLE dict.file_type
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    file_group_id   UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_file_group_id FOREIGN KEY (file_group_id)
        REFERENCES dict.file_group (id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.file_type IS 'Типы файлов';
COMMENT ON COLUMN dict.file_type.id IS 'Идентификатор типа файла';
COMMENT ON COLUMN dict.file_type.file_group_id IS 'Ссылка на группу типов файлов';
COMMENT ON COLUMN dict.file_type.code IS 'Код типа файла';
COMMENT ON COLUMN dict.file_type.value IS 'Название типа файла';
COMMENT ON COLUMN dict.file_type.description IS 'Описание типа файла';
COMMENT ON COLUMN dict.file_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.file_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.file_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.file_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.measure_type
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.measure_type IS 'Типы измерений';
COMMENT ON COLUMN dict.measure_type.id IS 'ID';
COMMENT ON COLUMN dict.measure_type.code IS 'Код типа измерения';
COMMENT ON COLUMN dict.measure_type.value IS 'Название типа измерения';
COMMENT ON COLUMN dict.measure_type.description IS 'Описание характеристик типа измерения';
COMMENT ON COLUMN dict.measure_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.measure_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.measure_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.measure_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.measure_unit
(
    id                      UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    measure_type_id         UUID,
    code                    INT4            NOT NULL UNIQUE,
    value                   VARCHAR(256)    NOT NULL,
    description             VARCHAR(2048),
    base_measure_unit_id    UUID,
    multiplier              DECIMAL(12, 6)  NOT NULL,
    short_name              VARCHAR(16),
    created_by              VARCHAR(128)    NOT NULL,
    created_at              TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by              VARCHAR(128),
    updated_at              TIMESTAMPTZ(6),

    CONSTRAINT fk_base_measure_unit_id FOREIGN KEY (base_measure_unit_id)
        REFERENCES dict.measure_unit (id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.measure_unit IS 'Единица измерения с множителем';
COMMENT ON COLUMN dict.measure_unit.id IS 'ID';
COMMENT ON COLUMN dict.measure_unit.measure_type_id IS 'Ссылка на тип измерения';
COMMENT ON COLUMN dict.measure_unit.code IS 'Код единицы измерения';
COMMENT ON COLUMN dict.measure_unit.value IS 'Множитель для поля базовой единицы измерения';
COMMENT ON COLUMN dict.measure_unit.description IS 'Описание единицы измерения';
COMMENT ON COLUMN dict.measure_unit.base_measure_unit_id IS 'Ссылка на базовую единицу измерения (относительно которой рассчитывается текущая)';
COMMENT ON COLUMN dict.measure_unit.multiplier IS 'Множитель для умножения на относительную единицу измерения';
COMMENT ON COLUMN dict.measure_unit.short_name IS 'Сокращенное наименование единицы измерения';
COMMENT ON COLUMN dict.measure_unit.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.measure_unit.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.measure_unit.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.measure_unit.updated_at IS 'Время изменения записи';


CREATE TABLE dict.color
(
    id          UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code        INT4            NOT NULL UNIQUE,
    value       VARCHAR(256)    NOT NULL,
    description VARCHAR(2048),
    created_by  VARCHAR(128)    NOT NULL,
    created_at  TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by  VARCHAR(128),
    updated_at  TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.color IS 'Цвета транспортных средств';
COMMENT ON COLUMN dict.color.id IS 'Идентификатор цвета';
COMMENT ON COLUMN dict.color.code IS 'Код цвета';
COMMENT ON COLUMN dict.color.value IS 'Название цвета';
COMMENT ON COLUMN dict.color.description IS 'Описание цвета';
COMMENT ON COLUMN dict.color.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.color.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.color.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.color.updated_at IS 'Время изменения записи';


CREATE TABLE dict.material_type
(
    id          UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code        INT4            NOT NULL UNIQUE,
    value       VARCHAR(256)    NOT NULL,
    description VARCHAR(2048),
    created_by  VARCHAR(128)    NOT NULL,
    created_at  TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by  VARCHAR(128),
    updated_at  TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.material_type IS 'Типы материалов';
COMMENT ON COLUMN dict.material_type.id IS 'Идентификатор типа материала';
COMMENT ON COLUMN dict.material_type.code IS 'Код типа материала';
COMMENT ON COLUMN dict.material_type.value IS 'Название типа материала';
COMMENT ON COLUMN dict.material_type.description IS 'Описание типа материала';
COMMENT ON COLUMN dict.material_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.material_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.material_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.material_type.updated_at IS 'Время изменения записи';