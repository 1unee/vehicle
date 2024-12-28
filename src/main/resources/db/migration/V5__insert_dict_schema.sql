-- Вставка данных в таблицу dict.measure_value
INSERT INTO dict.measure_value (measure_unit_id, value, created_by)
VALUES ((SELECT id FROM dict.measure_unit WHERE code = 1), 2.5, 'admin'),
       ((SELECT id FROM dict.measure_unit WHERE code = 2), 0.75, 'admin');


-- Вставка данных в таблицу dict.vehicle_type
INSERT INTO dict.vehicle_type (code, value, description, created_by)
VALUES (0, 'Легковые автомобили', 'Транспорт для перевозки пассажиров', 'admin'),
       (1, 'Грузовики', 'Транспорт для перевозки грузов', 'admin'),
       (2, 'Мотоциклы', 'Двух- или трехколесные транспортные средства', 'admin'),
       (3, 'Водные средства', 'Транспорт для перемещения по воде', 'admin'),
       (4, 'Воздушные средства', 'Транспорт для перемещения по воздуху', 'admin');


-- Вставка данных в таблицу dict.car_class
INSERT INTO dict.car_class (code, letter, value, description)
VALUES (1, 'A', 'Малый', 'Длина до 3,8 м, объем двигателя до 1,2 л'),
       (2, 'B', 'Компактный', 'Длина около 4 м, объем двигателя до 2 л'),
       (3, 'C', 'Средний', 'Длина до 4,5 м, объем двигателя 1,6–2 л'),
       (3, 'D', 'Большой', 'Длина от 4,4 м до 4,8 м, объем двигателя 2–2,5 л'),
       (4, 'E', 'Бизнес', 'Длина около 5 м, объем двигателя от 2,5 л'),
       (5, 'F', 'Люкс', 'Длина более 5 метров, объем двигателя не ограничен'),
       (6, 'G', 'Спортивный', 'Спортивные автомобили (купе и кабриолеты)'),
       (7, 'K', 'Минивэн', 'Однообъемные модели (компакт- и минивэны)'),
       (8, 'J', 'Внедорожник', 'Внедорожники и кроссоверы');


-- Вставка данных в таблицу dict.truck_class
INSERT INTO dict.truck_class (vehicle_type_id, code, value, description, max_payload, created_by)
VALUES
    ((SELECT id FROM dict.vehicle_type WHERE code = 1), 1, 'Класс 1', 'Грузовики малой грузоподъемности', (SELECT id FROM dict.measure_value WHERE measure_unit_id = (SELECT id FROM dict.measure_unit WHERE code = 2)), 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1), 2, 'Класс 2', 'Грузовики средней грузоподъемности', (SELECT id FROM dict.measure_value WHERE measure_unit_id = (SELECT id FROM dict.measure_unit WHERE code = 1)), 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1), 3, 'Класс 3', 'Грузовики большой грузоподъемности', (SELECT id FROM dict.measure_value WHERE measure_unit_id = (SELECT id FROM dict.measure_unit WHERE code = 1)), 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 0), 4, 'Класс A', 'Легковые автомобили с малой грузоподъемностью', (SELECT id FROM dict.measure_value WHERE measure_unit_id = (SELECT id FROM dict.measure_unit WHERE code = 1)), 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1), 5, 'Класс 4', 'Грузовики с экстра большой грузоподъемностью', (SELECT id FROM dict.measure_value WHERE measure_unit_id = (SELECT id FROM dict.measure_unit WHERE code = 3)), 'admin');


-- Вставка данных в таблицу dict.motorcycle_class
INSERT INTO dict.motorcycle_class (vehicle_type_id, code, value, description, wheel_amount, created_by)
VALUES
    ((SELECT id FROM dict.vehicle_type WHERE code = 2), 1, 'Спортивные мотоциклы', 'Мотоциклы для гонок', 2, 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 2), 2, 'Туристические мотоциклы', 'Мотоциклы для дальних поездок', 2, 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 2), 3, 'Квадроциклы', 'Мотоциклы с четырьмя колесами, предназначенные для бездорожья', 4, 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 2), 4, 'Трициклы', 'Мотоциклы с тремя колесами, часто используемые для особых задач', 3, 'admin');


-- Вставка данных в таблицу dict.watercraft_class
INSERT INTO dict.watercraft_class (vehicle_type_id, code, value, description, displacement, created_by)
VALUES ((SELECT id FROM dict.vehicle_type WHERE code = 3), 1, 'Катера', 'Малые моторные суда',
        (SELECT id FROM dict.measure_value WHERE value = 10.0), 'admin'),
       ((SELECT id FROM dict.vehicle_type WHERE code = 3), 2, 'Яхты', 'Суда для отдыха и путешествий',
        (SELECT id FROM dict.measure_value WHERE value = 100.0), 'admin');


-- Вставка данных в таблицу dict.aircraft_class
INSERT INTO dict.aircraft_class (vehicle_type_id, code, value, description, "range", created_by)
VALUES ((SELECT id FROM dict.vehicle_type WHERE code = 4), 1, 'Дроны', 'Беспилотные летательные аппараты',
        (SELECT id FROM dict.measure_value WHERE value = 15.0), 'admin'),
       ((SELECT id FROM dict.vehicle_type WHERE code = 4), 2, 'Пассажирские самолеты',
        'Самолеты для перевозки пассажиров',
        (SELECT id FROM dict.measure_value WHERE value = 3000.0), 'admin');


-- Вставка данных в таблицу dict.public_transport_class
INSERT INTO dict.public_transport_class (vehicle_type_id, code, value, description, created_by)
VALUES ((SELECT id FROM dict.vehicle_type WHERE code = 0), 1, 'Автобусы',
        'Общественный транспорт для перевозки пассажиров', 'admin'),
       ((SELECT id FROM dict.vehicle_type WHERE code = 0), 2, 'Троллейбусы', 'Транспорт на электрической тяге',
        'admin');


-- Вставка данных в таблицу dict.trailer_class
INSERT INTO dict.trailer_class (vehicle_type_id, code, value, description, binding_type, max_payload, created_by)
VALUES ((SELECT id FROM dict.vehicle_type WHERE code = 1), 1, 'Прицепы', 'Прицепы для легковых автомобилей',
        'Сцепное устройство',
        (SELECT id FROM dict.measure_value WHERE value = 2.0), 'admin'),
       ((SELECT id FROM dict.vehicle_type WHERE code = 1), 2, 'Полуприцепы', 'Полуприцепы для грузовиков',
        'Седельное устройство',
        (SELECT id FROM dict.measure_value WHERE value = 15.0), 'admin');


-- Вставка данных в таблицу dict.purpose_type
INSERT INTO dict.purpose_type (code, value, description, created_by)
VALUES (0, 'Строительство', 'Машины, предназначенные для строительных работ', 'admin'),
       (1, 'Сельское хозяйство', 'Машины для аграрных нужд', 'admin');


-- Вставка данных в таблицу dict.special_machinery_class
INSERT INTO dict.special_machinery_class (vehicle_type_id, code, value, description, purpose_type_id, has_equipment,
                                          created_by)
VALUES ((SELECT id FROM dict.vehicle_type WHERE code = 1), 1, 'Экскаваторы', 'Машины для землеройных работ',
        (SELECT id FROM dict.purpose_type WHERE code = 0), TRUE, 'admin'),
       ((SELECT id FROM dict.vehicle_type WHERE code = 1), 2, 'Комбайны', 'Машины для уборки урожая',
        (SELECT id FROM dict.purpose_type WHERE code = 1), TRUE, 'admin');


-- Вставка данных в таблицу dict.brand
INSERT INTO dict.brand (code, value, description, created_by)
VALUES (1, 'Toyota', 'Японский автопроизводитель, известный надежными автомобилями.', 'admin'),
       (2, 'BMW', 'Немецкий автопроизводитель премиум-класса, специализирующийся на спортивных автомобилях.', 'admin'),
       (3, 'Mercedes-Benz', 'Немецкий автопроизводитель, известный своими роскошными и инновационными автомобилями.', 'admin'),
       (4, 'Ford', 'Американский автопроизводитель, пионер массового производства автомобилей.', 'admin'),
       (5, 'Honda', 'Японский автопроизводитель, популярный своими автомобилями и мотоциклами.', 'admin'),
       (6, 'Volkswagen', 'Крупнейший автопроизводитель Германии, выпускающий широкий ассортимент автомобилей.', 'admin'),
       (7, 'Tesla', 'Американский производитель электрических автомобилей и энергетических решений.', 'admin'),
       (8, 'Hyundai', 'Южнокорейский автопроизводитель, известный своей доступной ценой и качеством.', 'admin'),
       (9, 'Nissan', 'Японский производитель автомобилей, известный инновационными технологиями.', 'admin'),
       (10, 'Chevrolet', 'Американский бренд автомобилей, часть концерна General Motors.', 'admin'),
       (11, 'Kia', 'Южнокорейский автопроизводитель, предлагающий качественные и доступные автомобили.', 'admin'),
       (12, 'Porsche', 'Немецкий автопроизводитель, специализирующийся на спортивных и люксовых автомобилях.', 'admin'),
       (13, 'Ferrari', 'Итальянский производитель люксовых спортивных автомобилей.', 'admin'),
       (14, 'Lamborghini', 'Итальянский производитель суперкаров, известный своими мощными двигателями и дизайном.', 'admin'),
       (15, 'Jaguar', 'Британский автопроизводитель, специализирующийся на роскошных и спортивных автомобилях.', 'admin'),
       (16, 'Land Rover', 'Британский бренд, специализирующийся на внедорожниках премиум-класса.', 'admin'),
       (17, 'Mitsubishi', 'Японский автопроизводитель, известный своими внедорожниками и компактными автомобилями.', 'admin'),
       (18, 'Suzuki', 'Японский бренд, выпускающий компактные автомобили и мотоциклы.', 'admin'),
       (19, 'Subaru', 'Японский автопроизводитель, известный своей системой полного привода и надежностью.', 'admin'),
       (20, 'Mazda', 'Японский бренд, известный дизайном и эффективными двигателями.', 'admin')


-- Вставка данных в таблицу dict.model
INSERT INTO dict.model (brand_id, code, value, description, created_by)
VALUES ('1', 1, 'Corolla', 'Малый городской автомобиль', 'admin'),
       ('1', 2, 'Camry', 'Среднеразмерный седан', 'admin'),
       ('2', 3, 'Mustang', 'Спортивный автомобиль', 'admin'),
       ('3', 4, 'X5', 'Кроссовер среднего размера', 'admin'),
       ('4', 5, 'Model S', 'Электрический седан', 'admin'),
       ('5', 6, 'A6', 'Среднеразмерный седан', 'admin');


-- Вставка данных в таблицу dict.generation
INSERT INTO dict.generation (model_id, code, value, description, created_by)
VALUES ('1', 1, 'Eighth generation', 'Восьмое поколение модели', 'admin'),
       ('2', 2, 'Fifth generation', 'Пятое поколение модели', 'admin'),
       ('3', 3, 'Sixth generation', 'Шестое поколение модели', 'admin'),
       ('4', 4, 'Fourth generation', 'Четвертое поколение модели', 'admin'),
       ('5', 5, 'Second generation', 'Второе поколение модели', 'admin'),
       ('6', 6, 'Third generation', 'Третье поколение модели', 'admin');


-- Вставка данных в таблицу dict.fuel_type
INSERT INTO dict.fuel_type (code, value, description, created_by)
VALUES (1, 'Petrol', 'Бензин', 'admin'),
       (2, 'Diesel', 'Дизельное топливо', 'admin'),
       (3, 'Electric', 'Электрический привод', 'admin'),
       (4, 'Hybrid', 'Гибридное топливо (бензин + электричество)', 'admin');


-- Вставка данных в таблицу dict.emission_type
INSERT INTO dict.emission_type (code, value, description, created_by)
VALUES (1, 'Euro 5', 'Европейский стандарт выбросов 5', 'admin'),
       (2, 'Euro 6', 'Европейский стандарт выбросов 6', 'admin'),
       (3, 'Euro 7', 'Европейский стандарт выбросов 7', 'admin');


-- Вставка данных в таблицу dict.engine
INSERT INTO dict.engine (code, value, description, fuel_type_id, power, torque, emission_type_id, volume, has_turbo,
                         cylinder_amount, created_by)
VALUES
    (1, '1.6L I4', '4-цилиндровый двигатель 1.6 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '110', '200',
     (SELECT id FROM dict.emission_type WHERE code = 1), '1.6', false, 4, 'admin'),
    (2, '2.4L I4', '4-цилиндровый двигатель 2.4 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '150', '220',
     (SELECT id FROM dict.emission_type WHERE code = 2), '2.4', false, 4, 'admin'),
    (3, '5.0L V8', '8-цилиндровый двигатель 5.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '400', '600',
     (SELECT id FROM dict.emission_type WHERE code = 2), '5.0', false, 8, 'admin'),
    (4, '1.8L I4', '4-цилиндровый двигатель 1.8 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '130', '250',
     (SELECT id FROM dict.emission_type WHERE code = 1), '1.8', false, 4, 'admin'),
    (5, '3.0L V6', '6-цилиндровый двигатель 3.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '250', '400',
     (SELECT id FROM dict.emission_type WHERE code = 2), '3.0', true, 6, 'admin'),
    (6, '4.5L V8', '8-цилиндровый двигатель 4.5 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '320', '500',
     (SELECT id FROM dict.emission_type WHERE code = 1), '4.5', false, 8, 'admin'),
    (7, '2.2L I4', '4-цилиндровый двигатель 2.2 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '160', '280',
     (SELECT id FROM dict.emission_type WHERE code = 1), '2.2', false, 4, 'admin'),
    (8, '6.2L V8', '8-цилиндровый двигатель 6.2 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '450', '650',
     (SELECT id FROM dict.emission_type WHERE code = 2), '6.2', true, 8, 'admin'),
    (9, '2.8L I4', '4-цилиндровый двигатель 2.8 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '200', '350',
     (SELECT id FROM dict.emission_type WHERE code = 2), '2.8', true, 4, 'admin'),
    (10, '3.6L V6', '6-цилиндровый двигатель 3.6 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '280', '420',
     (SELECT id FROM dict.emission_type WHERE code = 1), '3.6', false, 6, 'admin'),
    (11, '1.4L I4', '4-цилиндровый двигатель 1.4 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '110', '190',
     (SELECT id FROM dict.emission_type WHERE code = 1), '1.4', false, 4, 'admin'),
    (12, '1.2L I3', '3-цилиндровый двигатель 1.2 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '85', '150',
     (SELECT id FROM dict.emission_type WHERE code = 1), '1.2', false, 3, 'admin'),
    (13, '3.0L I6', '6-цилиндровый двигатель 3.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '300', '500',
     (SELECT id FROM dict.emission_type WHERE code = 2), '3.0', false, 6, 'admin'),
    (14, '1.6L Turbo I4', '4-цилиндровый турбодвигатель 1.6 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 1), '180', '300',
     (SELECT id FROM dict.emission_type WHERE code = 2), '1.6', true, 4, 'admin'),
    (15, '4.0L I6', '6-цилиндровый двигатель 4.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '350', '550',
     (SELECT id FROM dict.emission_type WHERE code = 1), '4.0', false, 6, 'admin'),
    (16, '5.0L Supercharged V8', '8-цилиндровый двигатель с наддувом 5.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '500', '700',
     (SELECT id FROM dict.emission_type WHERE code = 1), '5.0', true, 8, 'admin'),
    (17, '3.3L V6 Turbo', '6-цилиндровый турбодвигатель 3.3 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '350', '600',
     (SELECT id FROM dict.emission_type WHERE code = 2), '3.3', true, 6, 'admin'),
    (18, '2.0L Hybrid I4', 'Гибридный 4-цилиндровый двигатель 2.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 4), '150', '250',
     (SELECT id FROM dict.emission_type WHERE code = 2), '2.0', false, 4, 'admin'),
    (19, '6.0L V12', '12-цилиндровый двигатель 6.0 литра',
     (SELECT id FROM dict.fuel_type WHERE code = 2), '600', '900',
     (SELECT id FROM dict.emission_type WHERE code = 2), '6.0', false, 12, 'admin');


-- Вставка данных в таблицу dict.body
INSERT INTO dict.body (code, value, description, seat_capacity, material_type_id, color_id, created_by)
VALUES (1, 'Седан', 'Тип кузова с четырьмя дверями и багажником.', 5,
        (SELECT id FROM dict.material_type WHERE code = 1 LIMIT 1), NULL, 'admin'),
       (2, 'Хэтчбек', 'Тип кузова с задней дверью, открывающейся вверх.', 5,
        (SELECT id FROM dict.material_type WHERE code = 2 LIMIT 1), NULL, 'admin'),
       (3, 'Купе', 'Компактный спортивный кузов с двумя дверями.', 2,
        (SELECT id FROM dict.material_type WHERE code = 3 LIMIT 1), NULL, 'admin');


-- Вставка данных в таблицу dict.transmission_type
INSERT INTO dict.transmission_type (code, value, description, created_by)
VALUES (1, 'Механическая', 'Тип трансмиссии с ручным переключением передач.', 'admin'),
       (2, 'Автоматическая', 'Тип трансмиссии с автоматическим переключением передач.', 'admin'),
       (3, 'Вариатор', 'Тип трансмиссии, который плавно изменяет передаточное число.', 'admin');


-- Вставка данных в таблицу dict.drive_type
INSERT INTO dict.drive_type (code, value, description, created_by)
VALUES (1, 'Передний привод', 'Транспортное средство с приводом на передние колеса.', 'admin'),
       (2, 'Задний привод', 'Транспортное средство с приводом на задние колеса.', 'admin'),
       (3, 'Полный привод', 'Транспортное средство с приводом на все четыре колеса.', 'admin');


-- Вставка данных в таблицу dict.transmission
INSERT INTO dict.transmission (code, value, description, transmission_type_id, gears_amount, drive_type_id,
                               has_torque_converter, created_by)
VALUES (1, 'Механическая 5-ступенчатая', 'Механическая трансмиссия с 5 передачами.',
        (SELECT id FROM dict.transmission_type WHERE code = 1 LIMIT 1), 5,
        (SELECT id FROM dict.drive_type WHERE code = 1 LIMIT 1), FALSE, 'admin'),
       (2, 'Автоматическая 6-ступенчатая', 'Автоматическая трансмиссия с 6 передачами.',
        (SELECT id FROM dict.transmission_type WHERE code = 2 LIMIT 1), 6,
        (SELECT id FROM dict.drive_type WHERE code = 2 LIMIT 1), TRUE, 'admin');


-- Вставка данных в таблицу dict.wheel_type
INSERT INTO dict.wheel_type (code, value, created_by)
VALUES (1, 'Левый', 'admin'),
       (2, 'Правый', 'admin');


-- Вставка данных в таблицу dict.steering
INSERT INTO dict.steering (code, value, description, wheel_type_id, has_power_assisted, has_wheel_heated, created_by)
VALUES (1, 'Гидравлический', 'Рулевой механизм с гидроусилителем.',
        (SELECT id FROM dict.wheel_type WHERE code = 1 LIMIT 1), TRUE, FALSE, 'admin'),
       (2, 'Электрический', 'Рулевой механизм с электрическим усилителем.',
        (SELECT id FROM dict.wheel_type WHERE code = 2 LIMIT 1), TRUE, TRUE, 'admin');


-- Вставка данных в таблицу dict.interior
INSERT INTO dict.interior (code, value, description, material_type_id, color_id, has_heated_seat, has_air_conditioning,
                           created_by)
VALUES (1, 'Кожаный', 'Интерьер автомобиля с кожаной отделкой.',
        (SELECT id FROM dict.material_type WHERE code = 5 LIMIT 1), NULL, TRUE, TRUE, 'admin'),
       (2, 'Тканевый', 'Интерьер с тканевой отделкой.', (SELECT id FROM dict.material_type WHERE code = 4 LIMIT 1),
        NULL, FALSE, TRUE, 'admin');


-- Вставка данных в таблицу dict.exhaust_system
INSERT INTO dict.exhaust_system (code, value, description, created_by)
VALUES (1, 'Стандартная', 'Обычная система выхлопа для стандартных автомобилей.', 'admin'),
       (2, 'Спортивная', 'Система выхлопа с улучшенными характеристиками для спортивных автомобилей.', 'admin');


-- Вставка данных в таблицу dict.cooling_system
INSERT INTO dict.cooling_system (code, value, description, created_by)
VALUES (1, 'Обычная', 'Обычная система охлаждения для стандартных автомобилей.', 'admin'),
       (2, 'Классическая с водяным охлаждением', 'Классическая система охлаждения с использованием антифриза.',
        'admin');