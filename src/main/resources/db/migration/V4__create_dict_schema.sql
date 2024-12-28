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
    id          UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    code        INT4            NOT NULL UNIQUE,
    value       VARCHAR(256)    NOT NULL,
    description VARCHAR(2048),
    created_by  VARCHAR(128)    NOT NULL,
    created_at  TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by  VARCHAR(128),
    updated_at  TIMESTAMPTZ(6)
);

COMMENT ON TABLE dict.vehicle_type IS 'Типы транспортного средства (ТС)';
COMMENT ON COLUMN dict.vehicle_type.id IS 'ID';
COMMENT ON COLUMN dict.vehicle_type.code IS 'Код типа транспортного средства';
COMMENT ON COLUMN dict.vehicle_type.value IS 'Название класса автомобиля';
COMMENT ON COLUMN dict.vehicle_type.description IS 'Описание характеристик класса';
COMMENT ON COLUMN dict.vehicle_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.vehicle_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.vehicle_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.vehicle_type.updated_at IS 'Время изменения записи';


CREATE TABLE dict.car_class
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    letter          VARCHAR(1)      NOT NULL,
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.car_class IS 'Классы автомобилей';
COMMENT ON COLUMN dict.car_class.id IS 'Идентификатор класса автомобиля';
COMMENT ON COLUMN dict.car_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.car_class.code IS 'Код класса автомобиля';
COMMENT ON COLUMN dict.car_class.value IS 'Название класса автомобиля';
COMMENT ON COLUMN dict.car_class.description IS 'Описание характеристик класса';
COMMENT ON COLUMN dict.car_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.car_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.car_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.car_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.truck_class
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id     UUID,
    code                INT4            NOT NULL UNIQUE,
    value               VARCHAR(256)    NOT NULL,
    description         VARCHAR(2048),
    max_payload         UUID,
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_truck
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_max_payload
        FOREIGN KEY (max_payload) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.truck_class IS 'Классы грузовых автомобилей';
COMMENT ON COLUMN dict.truck_class.id IS 'Идентификатор класса грузового автомобиля';
COMMENT ON COLUMN dict.truck_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.truck_class.code IS 'Код класса грузового автомобиля';
COMMENT ON COLUMN dict.truck_class.value IS 'Название класса грузового автомобиля';
COMMENT ON COLUMN dict.truck_class.max_payload IS 'Ссылка (значение) грузоподъемности грузового автомобиля (обычно в тоннах)';
COMMENT ON COLUMN dict.truck_class.description IS 'Описание класса грузового автомобиля';
COMMENT ON COLUMN dict.truck_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.truck_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.truck_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.truck_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.motorcycle_class
(
    id              UUID           DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    wheel_amount    INT4            NOT NULL,
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_motorcycle
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.motorcycle_class IS 'Классы мотоциклов';
COMMENT ON COLUMN dict.motorcycle_class.id IS 'Идентификатор класса мотоцикла';
COMMENT ON COLUMN dict.motorcycle_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.motorcycle_class.code IS 'Код класса мотоцикла';
COMMENT ON COLUMN dict.motorcycle_class.value IS 'Название класса мотоцикла';
COMMENT ON COLUMN dict.motorcycle_class.wheel_amount IS 'Количество колес у мотоцикла';
COMMENT ON COLUMN dict.motorcycle_class.description IS 'Описание класса мотоцикла';
COMMENT ON COLUMN dict.motorcycle_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.motorcycle_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.motorcycle_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.motorcycle_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.watercraft_class
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    displacement    UUID            NOT NULL,
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_watercraft
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_displacement
        FOREIGN KEY (displacement) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.watercraft_class IS 'Классы водных средств';
COMMENT ON TABLE dict.watercraft_class IS 'Классы водных средств';
COMMENT ON COLUMN dict.watercraft_class.id IS 'Идентификатор класса водного средства';
COMMENT ON COLUMN dict.watercraft_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.watercraft_class.code IS 'Код класса водного средства';
COMMENT ON COLUMN dict.watercraft_class.value IS 'Название класса водного средства';
COMMENT ON COLUMN dict.watercraft_class.displacement IS 'Ссылка (значение) водоизмещения водного средства (обычно в тоннах)';
COMMENT ON COLUMN dict.watercraft_class.description IS 'Описание класса водного средства';
COMMENT ON COLUMN dict.watercraft_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.watercraft_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.watercraft_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.watercraft_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.aircraft_class
(
    id                    UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id       UUID,
    code                  INT4            NOT NULL UNIQUE,
    value                 VARCHAR(256)    NOT NULL,
    description           VARCHAR(2048),
    "range"               UUID,
    created_by            VARCHAR(128)    NOT NULL,
    created_at            TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by            VARCHAR(128),
    updated_at            TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_aircraft
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_range
        FOREIGN KEY ("range") REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.aircraft_class IS 'Классы воздушных средств';
COMMENT ON COLUMN dict.aircraft_class.id IS 'Идентификатор класса воздушного средства';
COMMENT ON COLUMN dict.aircraft_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.aircraft_class.code IS 'Код класса воздушного средства';
COMMENT ON COLUMN dict.aircraft_class.value IS 'Название класса воздушного средства';
COMMENT ON COLUMN dict.aircraft_class.range IS 'Ссылка (значение) дальности полета воздушного средства (обычно в км)';
COMMENT ON COLUMN dict.aircraft_class.description IS 'Описание класса воздушного средства';
COMMENT ON COLUMN dict.aircraft_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.aircraft_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.aircraft_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.aircraft_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.public_transport_class
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_public_transport
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.public_transport_class IS 'Классы общественного транспорта';
COMMENT ON COLUMN dict.public_transport_class.id IS 'Идентификатор класса общественного транспорта';
COMMENT ON COLUMN dict.public_transport_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.public_transport_class.code IS 'Код класса общественного транспорта';
COMMENT ON COLUMN dict.public_transport_class.value IS 'Название класса общественного транспорта';
COMMENT ON COLUMN dict.public_transport_class.description IS 'Описание класса общественного транспорта';
COMMENT ON COLUMN dict.public_transport_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.public_transport_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.public_transport_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.public_transport_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.trailer_class
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id UUID,
    code            INT4            NOT NULL UNIQUE,
    value           VARCHAR(256)    NOT NULL,
    description     VARCHAR(2048),
    binding_type    VARCHAR(256),
    max_payload     UUID,
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_trailer
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_max_payload
        FOREIGN KEY (max_payload) REFERENCES dict.measure_value (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.trailer_class IS 'Классы прицепов';
COMMENT ON COLUMN dict.trailer_class.id IS 'Идентификатор класса прицепа';
COMMENT ON COLUMN dict.trailer_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.trailer_class.code IS 'Код класса прицепа';
COMMENT ON COLUMN dict.trailer_class.value IS 'Название класса прицепа';
COMMENT ON COLUMN dict.trailer_class.binding_type IS 'Тип крепления прицепа';
COMMENT ON COLUMN dict.trailer_class.max_payload IS 'Ссылка (значение) грузоподъемности прицепа (обычно в тоннах)';
COMMENT ON COLUMN dict.trailer_class.description IS 'Описание класса прицепа';
COMMENT ON COLUMN dict.trailer_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.trailer_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.trailer_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.trailer_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.purpose_type
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

COMMENT ON TABLE dict.purpose_type IS 'Типы назначения специальной техники';
COMMENT ON COLUMN dict.purpose_type.id IS 'Идентификатор типа назначения специальной техники';
COMMENT ON COLUMN dict.purpose_type.code IS 'Код типа назначения специальной техники';
COMMENT ON COLUMN dict.purpose_type.value IS 'Название типа назначения специальной техники';
COMMENT ON COLUMN dict.purpose_type.description IS 'Описание типа назначения специальной техники';
COMMENT ON COLUMN dict.purpose_type.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.purpose_type.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.purpose_type.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.purpose_type.updated_at IS 'Время изменения записи';



CREATE TABLE dict.special_machinery_class
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id     UUID,
    code                INT4            NOT NULL UNIQUE,
    value               VARCHAR(256)    NOT NULL,
    description         VARCHAR(2048),
    purpose_type_id     UUID,
    has_equipment       BOOLEAN         NOT NULL,
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id_special_machinery
        FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.special_machinery_class IS 'Классы специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.id IS 'Идентификатор класса специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.special_machinery_class.code IS 'Код класса специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.value IS 'Название класса специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.description IS 'Описание класса специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.purpose_type_id IS 'Ссылка на назначение специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.has_equipment IS 'Наличие навесного оборудования у специальной техники';
COMMENT ON COLUMN dict.special_machinery_class.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.special_machinery_class.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.special_machinery_class.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.special_machinery_class.updated_at IS 'Время изменения записи';


CREATE TABLE dict.brand
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

COMMENT ON TABLE dict.brand IS 'Бренды производителей';
COMMENT ON COLUMN dict.brand.id IS 'Идентификатор бренда';
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
    model_id        UUID                REFERENCES dict.model (id) ON DELETE SET NULL,
    code            INT4                NOT NULL UNIQUE,
    value           VARCHAR(256)        NOT NULL,
    description     VARCHAR(2048),
    created_by      VARCHAR(128)        NOT NULL,
    created_at      TIMESTAMPTZ(6)      DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_model_id
        FOREIGN KEY (model_id) REFERENCES dict.model (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE dict.generation IS 'Поколения транспортных средств';
COMMENT ON COLUMN dict.generation.id IS 'Идентификатор поколения';
COMMENT ON COLUMN dict.generation.code IS 'Код поколения';
COMMENT ON COLUMN dict.generation.value IS 'Название поколения';
COMMENT ON COLUMN dict.generation.model_id IS 'Ссылка на модель';
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

-- todo: нужна ли эта таблица вообще ?
-- CREATE TABLE dict.safety_systems
-- (
--     id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
--     code            INT4            NOT NULL UNIQUE,
--     value           VARCHAR(256)    NOT NULL,
--     description     VARCHAR(2048),
--     type            VARCHAR(50), -- Тип системы (активная/пассивная)
--     is_abs          BOOLEAN,     -- Наличие ABS
--     is_esc          BOOLEAN,     -- Наличие ESC
--     airbags_amount  INT4,        -- Количество подушек безопасности
--     created_by      VARCHAR(128)    NOT NULL,
--     created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
--     updated_by      VARCHAR(128),
--     updated_at      TIMESTAMPTZ(6)
-- );
--
-- COMMENT ON TABLE dict.safety_systems IS 'Системы безопасности автомобилей';
-- COMMENT ON COLUMN dict.safety_systems.id IS 'Идентификатор системы безопасности';
-- COMMENT ON COLUMN dict.safety_systems.code IS 'Код системы безопасности';
-- COMMENT ON COLUMN dict.safety_systems.value IS 'Название типа системы безопасности';
-- COMMENT ON COLUMN dict.safety_systems.description IS 'Описание типа системы безопасности';
-- COMMENT ON COLUMN dict.created_by IS 'Пользователь, создавший запись';
-- COMMENT ON COLUMN dict.created_at IS 'Время создания записи';
-- COMMENT ON COLUMN dict.updated_by IS 'Пользователь, изменивший запись';
-- COMMENT ON COLUMN dict.updated_at IS 'Время изменения записи';


CREATE TABLE dict.exhaust_system
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

COMMENT ON TABLE dict.exhaust_system IS 'Системы выхлопа';
COMMENT ON COLUMN dict.exhaust_system.id IS 'Идентификатор системы выхлопа';
COMMENT ON COLUMN dict.exhaust_system.code IS 'Код системы выхлопа';
COMMENT ON COLUMN dict.exhaust_system.value IS 'Название системы выхлопа';
COMMENT ON COLUMN dict.exhaust_system.description IS 'Описание системы выхлопа';
COMMENT ON COLUMN dict.exhaust_system.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.exhaust_system.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.exhaust_system.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.exhaust_system.updated_at IS 'Время изменения записи';


CREATE TABLE dict.cooling_system
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

COMMENT ON TABLE dict.cooling_system IS 'Системы охлаждения';
COMMENT ON COLUMN dict.cooling_system.id IS 'Идентификатор системы охлаждения';
COMMENT ON COLUMN dict.cooling_system.code IS 'Код системы охлаждения';
COMMENT ON COLUMN dict.cooling_system.value IS 'Название системы охлаждения';
COMMENT ON COLUMN dict.cooling_system.description IS 'Описание системы охлаждения';
COMMENT ON COLUMN dict.cooling_system.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.cooling_system.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.cooling_system.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.cooling_system.updated_at IS 'Время изменения записи';
