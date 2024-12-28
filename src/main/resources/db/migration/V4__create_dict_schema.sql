CREATE TABLE dict.measure_value
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    measure_unit_id     UUID,
    value               DECIMAL(12, 6),
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.measure_value IS 'Единица измерения с множителем';
COMMENT ON COLUMN dict.measure_value.measure_unit_id IS 'Ссылка на единицу измерения';
COMMENT ON COLUMN dict.measure_value.value IS 'Множитель для единицы измерения';
COMMENT ON COLUMN dict.measure_value.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.measure_value.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.measure_value.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.measure_value.updated_at IS 'Время изменения записи';


CREATE TABLE dict.vehicle_type
(
    id                      UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    top_vehicle_type_id     UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                    INT4            NOT NULL UNIQUE,
    value                   VARCHAR(256)    NOT NULL,
    description             VARCHAR(2048),
    created_by              VARCHAR(128)    NOT NULL,
    created_at              TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by              VARCHAR(128),
    updated_at              TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.vehicle_type IS 'Типы транспортного средства (ТС)';
COMMENT ON COLUMN dict.vehicle_type.id IS 'ID';
COMMENT ON COLUMN dict.vehicle_type.top_vehicle_type_id IS 'Ссылка на категорию (древовидную) транспортного средства. Если имеет значение NULL, значит корневая категория';
COMMENT ON COLUMN dict.vehicle_type.code IS 'Код типа транспортного средства';
COMMENT ON COLUMN dict.vehicle_type.value IS 'Название класса автомобиля';
COMMENT ON COLUMN dict.vehicle_type.description IS 'Описание характеристик класса';
COMMENT ON COLUMN dict.vehicle_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.vehicle_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.vehicle_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.vehicle_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.brand
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    country_id      UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.brand IS 'Бренды производителей';
COMMENT ON COLUMN dict.brand.id IS 'Идентификатор бренда';
COMMENT ON COLUMN dict.brand.country_id IS 'Ссылка на страну бренда';
COMMENT ON COLUMN dict.brand.code IS 'Код бренда';
COMMENT ON COLUMN dict.brand.value IS 'Название бренда';
COMMENT ON COLUMN dict.brand.description IS 'Описание бренда';
COMMENT ON COLUMN dict.brand.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.brand.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.brand.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.brand.updated_at IS 'Время изменения записи';


CREATE TABLE dict.model
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    brand_id        UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_brand_id
        FOREIGN KEY (brand_id) REFERENCES dict.brand (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.model IS 'Модели транспортных средств';
COMMENT ON COLUMN dict.model.id IS 'Идентификатор модели';
COMMENT ON COLUMN dict.model.code IS 'Код модели';
COMMENT ON COLUMN dict.model.value IS 'Название модели';
COMMENT ON COLUMN dict.model.description IS 'Описание модели';
COMMENT ON COLUMN dict.model.brand_id IS 'Ссылка на бренд модели';
COMMENT ON COLUMN dict.model.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.model.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.model.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.model.updated_at IS 'Время изменения записи';


CREATE TABLE dict.generation
(
    id              UUID                DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code            INT4                NOT NULL UNIQUE,
    value           VARCHAR(256)        NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)        NOT NULL,
    created_at      TIMESTAMPTZ(6)      DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.generation IS 'Поколения транспортных средств';
COMMENT ON COLUMN dict.generation.id IS 'Идентификатор поколения';
COMMENT ON COLUMN dict.generation.code IS 'Код поколения';
COMMENT ON COLUMN dict.generation.value IS 'Название поколения';
COMMENT ON COLUMN dict.generation.description IS 'Описание поколения';
COMMENT ON COLUMN dict.generation.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.generation.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.generation.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.generation.updated_at IS 'Время изменения записи';


CREATE TABLE dict.fuel_type
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

COMMENT ON TABLE dict.fuel_type IS 'Типы топлива';
COMMENT ON COLUMN dict.fuel_type.id IS 'Идентификатор типа топлива';
COMMENT ON COLUMN dict.fuel_type.code IS 'Код типа топлива';
COMMENT ON COLUMN dict.fuel_type.value IS 'Название типа топлива';
COMMENT ON COLUMN dict.fuel_type.description IS 'Описание типа топлива';
COMMENT ON COLUMN dict.fuel_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.fuel_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.fuel_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.fuel_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.emission_type
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

COMMENT ON TABLE dict.emission_type IS 'Типы выбросов';
COMMENT ON COLUMN dict.emission_type.id IS 'Идентификатор типа выбросов';
COMMENT ON COLUMN dict.emission_type.code IS 'Код типа выбросов';
COMMENT ON COLUMN dict.emission_type.value IS 'Название типа выбросов';
COMMENT ON COLUMN dict.emission_type.description IS 'Описание типа выбросов';
COMMENT ON COLUMN dict.emission_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.emission_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.emission_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.emission_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.engine
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                INT4            NOT NULL UNIQUE,
    value               VARCHAR(256)    NOT NULL,
    description         VARCHAR(2048),
    fuel_type_id        UUID            NOT NULL,
    power               UUID            NOT NULL,
    torque              UUID,
    emission_type_id    UUID,
    volume              UUID            NOT NULL,
    has_turbo           BOOLEAN         NOT NULL,
    cylinder_amount     INT4,
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_fuel_type_id
        FOREIGN KEY (fuel_type_id) REFERENCES dict.fuel_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_emission_type_id
        FOREIGN KEY (emission_type_id) REFERENCES dict.emission_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_power
        FOREIGN KEY (power) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_torque
        FOREIGN KEY (torque) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_volume
        FOREIGN KEY (volume) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.engine IS 'Типы двигателей';
COMMENT ON COLUMN dict.engine.id IS 'Идентификатор двигателя';
COMMENT ON COLUMN dict.engine.code IS 'Код двигателя';
COMMENT ON COLUMN dict.engine.value IS 'Название типа двигателя';
COMMENT ON COLUMN dict.engine.description IS 'Описание типа двигателя';
COMMENT ON COLUMN dict.engine.fuel_type_id IS 'Ссылка на тип топлива для двигателя';
COMMENT ON COLUMN dict.engine.power IS 'Ссылка (значение) мощность двигателя (обычно в л.с.)';
COMMENT ON COLUMN dict.engine.torque IS 'Ссылка (значение) на крутящий момент (обычно в Н*м)';
COMMENT ON COLUMN dict.engine.emission_type_id IS 'Ссылка на стандарт выбросов';
COMMENT ON COLUMN dict.engine.volume IS 'Ссылка (значение) на объем двигателя';
COMMENT ON COLUMN dict.engine.has_turbo IS 'Имеет ли турбонаддув';
COMMENT ON COLUMN dict.engine.cylinder_amount IS 'Количество цилиндров';
COMMENT ON COLUMN dict.engine.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.engine.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.engine.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.engine.updated_at IS 'Время изменения записи';


CREATE TABLE dict.body
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                INT4            NOT NULL UNIQUE,
    value               VARCHAR(256)    NOT NULL,
    description         VARCHAR(2048),
    seat_capacity       INT4,
    material_type_id    UUID,
    color_id            UUID,
    created_by          VARCHAR(128),
    created_at          TIMESTAMPTZ(6) DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_material_type_id
        FOREIGN KEY (material_type_id) REFERENCES dict.material_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_color_id
        FOREIGN KEY (color_id) REFERENCES dict.color (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);


COMMENT ON TABLE dict.body IS 'Кузова автомобилей';
COMMENT ON COLUMN dict.body.id IS 'Идентификатор кузова';
COMMENT ON COLUMN dict.body.code IS 'Код кузова';
COMMENT ON COLUMN dict.body.value IS 'Название типа кузова';
COMMENT ON COLUMN dict.body.description IS 'Описание типа кузова';
COMMENT ON COLUMN dict.body.seat_capacity IS 'Количество мест';
COMMENT ON COLUMN dict.body.material_type_id IS 'Ссылка на тип материала кузова';
COMMENT ON COLUMN dict.body.color_id IS 'Цвет кузова';
COMMENT ON COLUMN dict.body.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.body.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.body.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.body.updated_at IS 'Время изменения записи';


CREATE TABLE dict.transmission_type
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

COMMENT ON TABLE dict.transmission_type IS 'Типы трансмиссий';
COMMENT ON COLUMN dict.transmission_type.id IS 'Идентификатор типа трансмиссии';
COMMENT ON COLUMN dict.transmission_type.code IS 'Код типа трансмиссии';
COMMENT ON COLUMN dict.transmission_type.value IS 'Название типа трансмиссии';
COMMENT ON COLUMN dict.transmission_type.description IS 'Описание типа трансмиссии';
COMMENT ON COLUMN dict.transmission_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.transmission_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.transmission_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.transmission_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.drive_type
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

COMMENT ON TABLE dict.drive_type IS 'Типы приводов';
COMMENT ON COLUMN dict.drive_type.id IS 'Идентификатор типа привода';
COMMENT ON COLUMN dict.drive_type.code IS 'Код типа привода';
COMMENT ON COLUMN dict.drive_type.value IS 'Название типа привода';
COMMENT ON COLUMN dict.drive_type.description IS 'Описание типа привода';
COMMENT ON COLUMN dict.drive_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.drive_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.drive_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.drive_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.transmission
(
    id                   UUID           DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                 INT4           NOT NULL UNIQUE,
    value                VARCHAR(256)   NOT NULL,
    description          VARCHAR(2048),
    transmission_type_id UUID,
    gears_amount         INT4           NOT NULL,
    drive_type_id        UUID,
    has_torque_converter BOOLEAN        NOT NULL,
    created_by           VARCHAR(128)   NOT NULL,
    created_at           TIMESTAMPTZ(6) DEFAULT NOW(),
    updated_by           VARCHAR(128),
    updated_at           TIMESTAMPTZ(6),

    CONSTRAINT fk_transmission_type_id
        FOREIGN KEY (transmission_type_id) REFERENCES dict.transmission_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_drive_type_id
        FOREIGN KEY (drive_type_id) REFERENCES dict.drive_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.transmission IS 'Типы трансмиссий';
COMMENT ON COLUMN dict.transmission.id IS 'Идентификатор трансмиссии';
COMMENT ON COLUMN dict.transmission.code IS 'Код трансмиссии';
COMMENT ON COLUMN dict.transmission.value IS 'Название типа трансмиссии';
COMMENT ON COLUMN dict.transmission.description IS 'Описание типа трансмиссии';
COMMENT ON COLUMN dict.transmission.transmission_type_id IS 'Ссылка на тип трансмиссии';
COMMENT ON COLUMN dict.transmission.gears_amount IS 'Количество передач';
COMMENT ON COLUMN dict.transmission.drive_type_id IS 'Ссылка на тип привода';
COMMENT ON COLUMN dict.transmission.has_torque_converter IS 'Присутствует гидротрансформатор';
COMMENT ON COLUMN dict.transmission.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.transmission.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.transmission.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.transmission.updated_at IS 'Время изменения записи';


CREATE TABLE dict.wheel_type
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

COMMENT ON TABLE dict.wheel_type IS 'Типы рулей';
COMMENT ON COLUMN dict.wheel_type.id IS 'Идентификатор типа руля';
COMMENT ON COLUMN dict.wheel_type.code IS 'Код типа руля';
COMMENT ON COLUMN dict.wheel_type.value IS 'Название типа руля';
COMMENT ON COLUMN dict.wheel_type.description IS 'Описание типа руля';
COMMENT ON COLUMN dict.wheel_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.wheel_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.wheel_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.wheel_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.steering
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                INT4            NOT NULL UNIQUE,
    value               VARCHAR(256)    NOT NULL,
    description         VARCHAR(2048),
    wheel_type_id       UUID,
    has_power_assisted  BOOLEAN         NOT NULL,
    has_wheel_heated    BOOLEAN,
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_wheel_type_id
        FOREIGN KEY (wheel_type_id) REFERENCES dict.wheel_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.steering IS 'Типы рулевых механизмов';
COMMENT ON COLUMN dict.steering.id IS 'Идентификатор рулевого механизма';
COMMENT ON COLUMN dict.steering.code IS 'Код рулевого механизма';
COMMENT ON COLUMN dict.steering.value IS 'Название типа рулевого механизма';
COMMENT ON COLUMN dict.steering.description IS 'Описание типа рулевого механизма';
COMMENT ON COLUMN dict.steering.wheel_type_id IS 'Ссылка на тип руля';
COMMENT ON COLUMN dict.steering.has_power_assisted IS 'Есть усилитель';
COMMENT ON COLUMN dict.steering.has_wheel_heated IS 'Есть обогрев руля';
COMMENT ON COLUMN dict.steering.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.steering.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.steering.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.steering.updated_at IS 'Время изменения записи';


CREATE TABLE dict.interior
(
    id                      UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code                    INT4            NOT NULL UNIQUE,
    value                   VARCHAR(256)    NOT NULL,
    description             VARCHAR(2048),
    material_type_id        UUID,
    color_id                UUID,
    has_heated_seat         BOOLEAN         NOT NULL,
    has_air_conditioning    BOOLEAN         NOT NULL,
    created_by              VARCHAR(128)    NOT NULL,
    created_at              TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by              VARCHAR(128),
    updated_at              TIMESTAMPTZ(6),

    CONSTRAINT fk_material_type_id
        FOREIGN KEY (material_type_id) REFERENCES dict.material_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_color_id
        FOREIGN KEY (color_id) REFERENCES dict.color (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.interior IS 'Интерьеры автомобилей';
COMMENT ON COLUMN dict.interior.id IS 'Идентификатор интерьера';
COMMENT ON COLUMN dict.interior.code IS 'Код интерьера';
COMMENT ON COLUMN dict.interior.value IS 'Название типа интерьера';
COMMENT ON COLUMN dict.interior.description IS 'Описание типа интерьера';
COMMENT ON COLUMN dict.interior.material_type_id IS 'Ссылка на материал отделки (салона)';
COMMENT ON COLUMN dict.interior.color_id IS 'Ссылка на цвет отделки (салона)';
COMMENT ON COLUMN dict.interior.has_heated_seat IS 'Есть подогрев сидений';
COMMENT ON COLUMN dict.interior.has_air_conditioning IS 'Есть кондиционер';
COMMENT ON COLUMN dict.interior.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.interior.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.interior.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.interior.updated_at IS 'Время изменения записи';
