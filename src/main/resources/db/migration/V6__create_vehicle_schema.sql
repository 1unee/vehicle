CREATE TABLE dict.vehicle
(
    id                  UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_type_id     UUID,
    model_id            UUID,
    generation_id       UUID,
    body_id             UUID,
    engine_id           UUID,
    transmission_id     UUID,
    steering_id         UUID,
    interior_id         UUID,
    created_by          VARCHAR(128)    NOT NULL,
    created_at          TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by          VARCHAR(128),
    updated_at          TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_type_id FOREIGN KEY (vehicle_type_id) REFERENCES dict.vehicle_type (id),
    CONSTRAINT fk_model_id FOREIGN KEY (model_id) REFERENCES dict.model (id),
    CONSTRAINT fk_generation_id FOREIGN KEY (generation_id) REFERENCES dict.generation (id),
    CONSTRAINT fk_body_id FOREIGN KEY (body_id) REFERENCES dict.body (id),
    CONSTRAINT fk_engine_id FOREIGN KEY (engine_id) REFERENCES dict.engine (id),
    CONSTRAINT fk_transmission_id FOREIGN KEY (transmission_id) REFERENCES dict.transmission (id),
    CONSTRAINT fk_steering_id FOREIGN KEY (steering_id) REFERENCES dict.steering (id),
    CONSTRAINT fk_interior_id FOREIGN KEY (interior_id) REFERENCES dict.interior (id),
    CONSTRAINT fk_exhaust_system_id FOREIGN KEY (exhaust_system_id) REFERENCES dict.exhaust_system (id),
    CONSTRAINT fk_cooling_system_id FOREIGN KEY (cooling_system_id) REFERENCES dict.cooling_system (id)
);

COMMENT ON COLUMN dict.vehicle.vehicle_type_id IS 'Ссылка на тип транспортного средства';
COMMENT ON COLUMN dict.vehicle.model_id IS 'Ссылка на модель транспортного средства';
COMMENT ON COLUMN dict.vehicle.generation_id IS 'Ссылка на поколение транспортного средства';
COMMENT ON COLUMN dict.vehicle.body_id IS 'Ссылка на кузов транспортного средства';
COMMENT ON COLUMN dict.vehicle.engine_id IS 'Ссылка на двигатель транспортного средства';
COMMENT ON COLUMN dict.vehicle.transmission_id IS 'Ссылка на трансмиссию транспортного средства';
COMMENT ON COLUMN dict.vehicle.steering_id IS 'Ссылка на тип рулевого механизма транспортного средства';
COMMENT ON COLUMN dict.vehicle.interior_id IS 'Ссылка на интерьер автомобиля';
COMMENT ON COLUMN dict.vehicle.created_by IS 'Пользователь, создавший запись';
COMMENT ON COLUMN dict.vehicle.created_at IS 'Время создания записи';
COMMENT ON COLUMN dict.vehicle.updated_by IS 'Пользователь, изменивший запись';
COMMENT ON COLUMN dict.vehicle.updated_at IS 'Время изменения записи';


CREATE TABLE vehicle.file
(
    id              UUID            DEFAULT UUID_GENERATE_V4() PRIMARY KEY,
    vehicle_id      UUID            NOT NULL,
    name            VARCHAR(256)    NOT NULL,
    file_type_id    UUID            NOT NULL,
    url             VARCHAR(1024)   NOT NULL,
    bytes_amount    INT8            NOT NULL,
    created_by      VARCHAR(128)    NOT NULL,
    created_at      TIMESTAMPTZ(6)  DEFAULT NOW(),
    updated_by      VARCHAR(128),
    updated_at      TIMESTAMPTZ(6),

    CONSTRAINT fk_vehicle_id FOREIGN KEY (vehicle_id)
        REFERENCES dict.vehicle (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_file_type_id FOREIGN KEY (file_type_id)
        REFERENCES dict.file_type (id)
            ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT chk_file_size CHECK (bytes_amount > 0)
);

COMMENT ON COLUMN vehicle.file.vehicle_id IS 'Ссылка на транспортное средство, к которому относится файл';
COMMENT ON COLUMN vehicle.file.name IS 'Имя файла';
COMMENT ON COLUMN vehicle.file.file_type_id IS 'Ссылка на тип файла (его расширение)';
COMMENT ON COLUMN vehicle.file.url IS 'URL для скачивания файла с файл-сервера';
COMMENT ON COLUMN vehicle.file.bytes_amount IS 'Размер файла в байтах';
COMMENT ON COLUMN vehicle.file.created_by IS 'Пользователь, загрузивший файл';
COMMENT ON COLUMN vehicle.file.created_at IS 'Дата и время загрузки файла';
COMMENT ON COLUMN vehicle.file.updated_by IS 'Пользователь, изменивший файл';
COMMENT ON COLUMN vehicle.file.updated_at IS 'Дата и время изменения файла';
