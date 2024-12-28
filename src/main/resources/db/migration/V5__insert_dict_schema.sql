-- Вставка данных в таблицу dict.measure_value
INSERT INTO dict.measure_value (measure_unit_id, value, created_by)
VALUES ((SELECT id FROM dict.measure_unit WHERE code = 1), 2.5, 'admin'),
       ((SELECT id FROM dict.measure_unit WHERE code = 2), 0.75, 'admin');


-- Вставка данных в таблицу dict.vehicle_type
INSERT INTO dict.vehicle_type (top_vehicle_type_id, code, value, description, created_by)
VALUES
    -- Основные типы транспорта (код в виде X000000)
    (NULL, 1000000, 'Сухопутное', 'Корневой тип транспорта, использующий дорогу или землю для перемещения (например, автомобили, автобусы, велосипеды)', 'admin'),
    (NULL, 2000000, 'Воздушное', 'Корневой тип транспорта, использующий воздух для перемещения (например, самолёты, вертолёты)', 'admin'),
    (NULL, 3000000, 'Водное', 'Корневой тип транспорта, использующий воду для перемещения (например, корабли, лодки)', 'admin'),
    (NULL, 4000000, 'Гибрид', 'Корневой тип транспорта, который сочетает несколько типов движения (например, автомобили, умеющие плавать)', 'admin'),
    (NULL, 5000000, 'Космическое', 'Корневой тип транспорта, используемый в космосе (например, космические корабли, ракеты)', 'admin'),

    -- сухопутные корневые категории ТС (код в виде 1X00000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1100000, 'Одноколесное', 'Наземное транспортное средство с одним колесом для передвижения (например, моноколесо)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1200000, 'Двухколесное', 'Наземное транспортное средство с двумя колесами для передвижения (например, мотоцикл, велосипед, самокат, скутер)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1300000, 'Трехколесное', 'Наземное транспортное средство с тремя колесами, может быть использовано для малых грузов (например, трицикл)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1400000, 'Четырехколесное', 'Наземное транспортное средство с четырьмя колесами для передвижения (например, легковой автомобиль, внедорожник)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1500000, 'Многоколесное', 'Наземное транспортное средство с большим количеством колес (более четырех), используется чаще всего для крупных грузов', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1000000), 1600000, 'Гусеничное', 'Наземное транспортное средство с гусеницами', 'admin'),

    -- одноколесные сухопутные ТС (код в виде 11X0000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1100000), 1110000, 'Моноколесо', 'Транспортное средство с одним колесом, обычно для личного использования, требует высокого уровня баланса.', 'admin'),

    -- двухколесные сухопутные ТС (код в виде 12X0000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1200000), 1210000, 'Мотоцикл', 'Транспортное средство с двумя колесами, используемое для личных поездок, может быть с разными типами двигателей (например, спортбайк, круизер).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1200000), 1220000, 'Велосипед', 'Транспортное средство с двумя колесами, приводимое в движение силами человека, используется для передвижения по земле или отдых.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1200000), 1230000, 'Самокат', 'Малое транспортное средство с двумя колесами, приводимое в движение ногами или мотором, используется для коротких поездок в городе.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1200000), 1240000, 'Скутер', 'Двухколесное транспортное средство с мотором для городской езды, обычно с малым объемом двигателя.', 'admin'),

    -- трехколесные сухопутные ТС (код в виде 13X0000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1300000), 1310000, 'Трицикл', 'Трехколесное транспортное средство, использующееся для перевозки малых грузов или пассажиров (например, трицикл для детей, трицикл для взрослых).', 'admin'),

    -- четырехколесные сухопутные ТС (код в виде 14X0000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1400000), 1410000, 'Легковой автомобиль', 'Транспортное средство для перевозки пассажиров, может быть оснащено различными типами двигателей (например, бензиновый, дизельный, электромобиль).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1400000), 1420000, 'Грузовое', 'Транспортное средство, предназначенное для перевозки грузов, включая фуры, самосвалы и т. д.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1400000), 1430000, 'Прицеп', 'Транспортное средство, предназначенное для перевозки дополнительных грузов.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1400000), 1440000, 'Спецтехника', 'Специальная техника для различных целей (строительство, сельское хозяйство и т.д.)', 'admin'),

    -- Подкатегории для легкового автомобиля (код в виде 141X000)
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1411000, 'Категория A (малый)', 'Длина до 3,8 м, объем двигателя до 1,2 л', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1412000, 'Категория B (компактный)', 'Длина около 4 м, объем двигателя до 2 л', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1413000, 'Категория C (средний)', 'Длина до 4,5 м, объем двигателя 1,6–2 л', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1414000, 'Категория D (большой)', 'Длина от 4,4 м до 4,8 м, объем двигателя 2–2,5 л', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1415000, 'Категория E (бизнес)', 'Длина около 5 м, объем двигателя от 2,5 л', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1416000, 'Категория F (люкс)', 'Длина более 5 метров, объем двигателя не ограничен', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1417000, 'Категория G (спортивный)', 'Спортивные автомобили (купе и кабриолеты)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1418000, 'Категория K (минивэн)', 'Однообъемные модели (компакт- и минивэны)', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1410000), 1419000, 'Категория J (внедорожник)', 'Внедорожники и кроссоверы', 'admin'),

    -- подкатегории для четырехколесных грузовых траспортных средств
    ((SELECT id FROM dict.vehicle_type WHERE code = 1420000), 1421000, 'Открытый груз', 'Грузовое средство с закрытым местом для груза', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1420000), 1422000, 'Закрытый груз', 'Грузовое средство с открытым местом для груза', 'admin'),

    -- многоколесные сухопутные ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 1500000), 1510000, 'Тягач', 'Транспортное средство, используемое для буксировки прицепов, обычно используется в грузовых перевозках.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1500000), 1520000, 'Прицеп', 'Транспортное средство, предназначенное для перевозки дополнительных грузов, прикрепляется к тягачу или легковому автомобилю.', 'admin'),

    -- гусеничные наземные тс
    ((SELECT id FROM dict.vehicle_type WHERE code = 1600000), 1610000, 'Танк', 'Военное транспортное средство.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 1600000), 1610000, 'Комбайн', 'Спецтехника для сельского хозяйства.', 'admin'),

    -- воздушные ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 2000000), 2100000, 'Самолёт', 'Воздушное транспортное средство, которое использует аэродинамическую подъемную силу для полета (например, пассажирский самолет, грузовой самолет).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 2000000), 2200000, 'Вертолет', 'Воздушное транспортное средство, использующее вращающиеся лопасти для подъема и движения в воздухе.', 'admin'),

    -- подкатегории водных ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 3000000), 3100000, 'Наводное', 'Водные транспортные средства, используемые для передвижения по поверхности воды (например, корабли, лодки).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 3000000), 3200000, 'Подводное', 'Транспортные средства, предназначенные для эксплуатации под водой (например, подводные лодки, батискафы).', 'admin'),

    -- наводные ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 3100000), 3110000, 'Корабль', 'Большое водное транспортное средство, используемое для перевозки пассажиров и грузов по воде (например, круизные лайнеры, грузовые суда).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 3100000), 3120000, 'Лодка', 'Малое водное транспортное средство, используемое для передвижения по воде (например, моторная лодка, парусная лодка).', 'admin'),

    -- подводное ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 3200000), 3210000, 'Батискаф', 'Подводное транспортное средство, предназначенное для глубоководных исследований, обычно используется в научных целях.', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 3200000), 3220000, 'Подводная лодка', 'Морское судно, предназначенное для эксплуатации под водой, может использоваться для военных или научных целей.', 'admin'),

    -- космическое ТС
    ((SELECT id FROM dict.vehicle_type WHERE code = 5000000), 5100000, 'Космический корабль', 'Транспортное средство, предназначенное для путешествий в космосе (например, орбитальный аппарат, космический шаттл).', 'admin'),
    ((SELECT id FROM dict.vehicle_type WHERE code = 5000000), 5200000, 'Ракета', 'Космическое транспортное средство, использующееся для запуска спутников или для межпланетных исследований.', 'admin');


-- Вставка данных в таблицу dict.brand
INSERT INTO dict.brand (country_id, code, value, description, created_by)
VALUES
    ((SELECT id FROM dict.country WHERE code = 6), 1, 'Toyota', 'Японский автопроизводитель, известный надежными автомобилями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 7), 2, 'BMW', 'Немецкий автопроизводитель премиум-класса, специализирующийся на спортивных автомобилях.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 7), 3, 'Mercedes-Benz', 'Немецкий автопроизводитель, известный своими роскошными и инновационными автомобилями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 2), 4, 'Ford', 'Американский автопроизводитель, пионер массового производства автомобилей.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 5, 'Honda', 'Японский автопроизводитель, популярный своими автомобилями и мотоциклами.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 7), 6, 'Volkswagen', 'Крупнейший автопроизводитель Германии, выпускающий широкий ассортимент автомобилей.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 2), 7, 'Tesla', 'Американский производитель электрических автомобилей и энергетических решений.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 12), 8, 'Hyundai', 'Южнокорейский автопроизводитель, известный своей доступной ценой и качеством.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 9, 'Nissan', 'Японский производитель автомобилей, известный инновационными технологиями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 2), 10, 'Chevrolet', 'Американский бренд автомобилей, часть концерна General Motors.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 12), 11, 'Kia', 'Южнокорейский автопроизводитель, предлагающий качественные и доступные автомобили.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 7), 12, 'Porsche', 'Немецкий автопроизводитель, специализирующийся на спортивных и люксовых автомобилях.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 10), 13, 'Ferrari', 'Итальянский производитель люксовых спортивных автомобилей.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 10), 14, 'Lamborghini', 'Итальянский производитель суперкаров, известный своими мощными двигателями и дизайном.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 8), 15, 'Jaguar', 'Британский автопроизводитель, специализирующийся на роскошных и спортивных автомобилях.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 8), 16, 'Land Rover', 'Британский бренд, специализирующийся на внедорожниках премиум-класса.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 17, 'Mitsubishi', 'Японский автопроизводитель, известный своими внедорожниками и компактными автомобилями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 18, 'Suzuki', 'Японский бренд, выпускающий компактные автомобили и мотоциклы.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 19, 'Subaru', 'Японский автопроизводитель, известный своей системой полного привода и надежностью.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 6), 20, 'Mazda', 'Японский бренд, известный дизайном и эффективными двигателями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 1), 21, 'Lada', 'Российский автопроизводитель, известный доступными и практичными автомобилями.', 'admin'),
    ((SELECT id FROM dict.country WHERE code = 1), 22, 'Moskvich', 'Российский автопроизводитель с богатой историей, выпускающий автомобили для массового рынка.', 'admin');


-- Вставка данных в таблицу dict.model
INSERT INTO dict.model (brand_id, code, value, description, created_by)
VALUES
    -- Toyota
    (1, 1, 'Corolla', 'Малый городской автомобиль', 'admin'),
    (1, 2, 'Camry', 'Среднеразмерный седан', 'admin'),
    (1, 3, 'RAV4', 'Компактный кроссовер', 'admin'),
    (1, 4, 'Highlander', 'Среднеразмерный внедорожник', 'admin'),
    (1, 5, 'Supra', 'Спортивный автомобиль', 'admin'),
    (1, 6, 'Land Cruiser', 'Внедорожник премиум-класса', 'admin'),
    -- BMW
    (2, 7, 'X5', 'Кроссовер среднего размера', 'admin'),
    (2, 8, 'X3', 'Компактный кроссовер', 'admin'),
    (2, 9, '3 Series', 'Среднеразмерный седан', 'admin'),
    (2, 10, '5 Series', 'Полноразмерный седан', 'admin'),
    (2, 11, '7 Series', 'Седан премиум-класса', 'admin'),
    (2, 12, 'M3', 'Спортивный седан', 'admin'),
    -- Mercedes-Benz
    (3, 13, 'C-Class', 'Среднеразмерный седан', 'admin'),
    (3, 14, 'E-Class', 'Полноразмерный седан', 'admin'),
    (3, 15, 'S-Class', 'Седан премиум-класса', 'admin'),
    (3, 16, 'GLA', 'Компактный кроссовер', 'admin'),
    (3, 17, 'GLE', 'Среднеразмерный внедорожник', 'admin'),
    (3, 18, 'AMG GT', 'Спортивный автомобиль', 'admin'),
    -- Tesla
    (4, 19, 'Model S', 'Электрический седан', 'admin'),
    (4, 20, 'Model 3', 'Компактный электрический седан', 'admin'),
    (4, 21, 'Model X', 'Электрический внедорожник', 'admin'),
    (4, 22, 'Model Y', 'Компактный электрический кроссовер', 'admin'),
    (4, 23, 'Cybertruck', 'Электрический пикап', 'admin'),
    -- Audi
    (5, 24, 'A6', 'Среднеразмерный седан', 'admin'),
    (5, 25, 'A4', 'Компактный седан', 'admin'),
    (5, 26, 'Q5', 'Компактный кроссовер', 'admin'),
    (5, 27, 'Q7', 'Среднеразмерный внедорожник', 'admin'),
    (5, 28, 'e-tron', 'Электрический внедорожник', 'admin'),
    (5, 29, 'R8', 'Спортивный автомобиль', 'admin'),
    -- Ford
    (6, 30, 'Mustang', 'Спортивный автомобиль', 'admin'),
    (6, 31, 'F-150', 'Полноразмерный пикап', 'admin'),
    (6, 32, 'Explorer', 'Среднеразмерный внедорожник', 'admin'),
    (6, 33, 'Focus', 'Компактный седан', 'admin'),
    (6, 34, 'Bronco', 'Внедорожник среднего размера', 'admin'),
    -- Nissan
    (7, 35, 'Altima', 'Среднеразмерный седан', 'admin'),
    (7, 36, 'Rogue', 'Компактный кроссовер', 'admin'),
    (7, 37, 'Leaf', 'Электрический хэтчбек', 'admin'),
    (7, 38, 'Murano', 'Среднеразмерный кроссовер', 'admin'),
    (7, 39, 'GT-R', 'Спортивный автомобиль', 'admin'),
    -- Hyundai
    (8, 40, 'Elantra', 'Компактный седан', 'admin'),
    (8, 41, 'Sonata', 'Среднеразмерный седан', 'admin'),
    (8, 42, 'Tucson', 'Компактный кроссовер', 'admin'),
    (8, 43, 'Santa Fe', 'Среднеразмерный кроссовер', 'admin'),
    (8, 44, 'Kona', 'Компактный электрический кроссовер', 'admin'),
    -- Kia
    (9, 45, 'Sportage', 'Компактный кроссовер', 'admin'),
    (9, 46, 'Sorento', 'Среднеразмерный внедорожник', 'admin'),
    (9, 47, 'Optima', 'Среднеразмерный седан', 'admin'),
    (9, 48, 'Soul', 'Компактный хэтчбек', 'admin'),
    (9, 49, 'Telluride', 'Кроссовер премиум-класса', 'admin'),
    -- Volkswagen
    (10, 50, 'Golf', 'Компактный хэтчбек', 'admin'),
    (10, 51, 'Passat', 'Среднеразмерный седан', 'admin'),
    (10, 52, 'Tiguan', 'Компактный кроссовер', 'admin'),
    (10, 53, 'Atlas', 'Среднеразмерный внедорожник', 'admin'),
    (10, 54, 'ID.4', 'Электрический внедорожник', 'admin'),
    -- Lada
    (11, 55, 'Granta', 'Компактный седан', 'admin'),
    (11, 56, 'Vesta', 'Среднеразмерный седан', 'admin'),
    (11, 57, 'Niva', 'Внедорожник', 'admin'),
    (11, 58, 'XRAY', 'Компактный кроссовер', 'admin'),
    -- Moskvich
    (12, 59, 'Moskvich 3', 'Компактный кроссовер', 'admin'),
    (12, 60, 'Moskvich 2140', 'Классический седан', 'admin'),
    -- Дополнительные бренды
    (13, 61, 'Wrangler', 'Внедорожник', 'admin'),
    (14, 62, 'Defender', 'Внедорожник премиум-класса', 'admin'),
    (15, 63, '911', 'Люксовый спортивный автомобиль', 'admin'),
    (16, 64, 'Aventador', 'Суперкар', 'admin'),
    (17, 65, 'Swift', 'Компактный хэтчбек', 'admin'),
    (18, 66, 'Outlander', 'Среднеразмерный внедорожник', 'admin'),
    (19, 67, 'Forester', 'Кроссовер', 'admin'),
    (20, 68, 'CX-5', 'Кроссовер', 'admin'),
    -- прочие
    (21, 69, 'Impreza', 'Компактный автомобиль', 'admin'),
    (22, 70, 'Levorg', 'Универсал', 'admin'),
    (23, 71, 'MX-5', 'Кабриолет', 'admin'),
    (24, 72, 'Hilux', 'Пикап', 'admin'),
    (25, 73, 'Yaris', 'Городской автомобиль', 'admin'),
    (26, 74, 'Avalon', 'Полноразмерный седан', 'admin'),
    (27, 75, 'Sienna', 'Минивэн', 'admin');


-- Вставка данных в таблицу dict.generation
INSERT INTO dict.generation (code, value, description, created_by)
VALUES
    (1, 'Первое поколение', 'Первое поколение автомобиля', 'admin'),
    (2, 'Второе поколение', 'Второе поколение автомобиля', 'admin'),
    (3, 'Третье поколение', 'Третье поколение автомобиля', 'admin'),
    (4, 'Четвертое поколение', 'Четвертое поколение автомобиля', 'admin'),
    (5, 'Пятое поколение', 'Пятое поколение автомобиля', 'admin'),
    (6, 'Шестое поколение', 'Шестое поколение автомобиля', 'admin'),
    (7, 'Седьмое поколение', 'Седьмое поколение автомобиля', 'admin'),
    (8, 'Восьмое поколение', 'Восьмое поколение автомобиля', 'admin'),
    (9, 'Девятое поколение', 'Девятое поколение автомобиля', 'admin'),
    (10, 'Десятое поколение', 'Десятое поколение автомобиля', 'admin'),
    (11, 'Одиннадцатое поколение', 'Одиннадцатое поколение автомобиля', 'admin'),
    (12, 'Двенадцатое поколение', 'Двенадцатое поколение автомобиля', 'admin'),
    (13, 'Первый рестайлинг', 'Первый рестайлинг автомобиля', 'admin'),
    (14, 'Второй рестайлинг', 'Второй рестайлинг автомобиля', 'admin'),
    (15, 'Третий рестайлинг', 'Третий рестайлинг автомобиля', 'admin'),
    (16, 'Ограниченная версия', 'Ограниченная серия автомобиля', 'admin'),
    (17, 'Специальная серия', 'Специальная серия автомобиля', 'admin'),
    (18, 'Коллекционная версия', 'Коллекционная серия автомобиля', 'admin'),
    (19, 'Концепт', 'Концептуальная модель автомобиля', 'admin'),
    (20, 'Прототип', 'Прототип автомобиля', 'admin');



-- Вставка данных в таблицу dict.fuel_type
INSERT INTO dict.fuel_type (code, value, description, created_by)
VALUES (1, 'Бензин', 'Бензин', 'admin'),
       (2, 'Дизель', 'Дизельное топливо', 'admin'),
       (3, 'Электричество', 'Электрический привод', 'admin'),
       (4, 'Гибрид', 'Гибридное топливо', 'admin');


-- Вставка данных в таблицу dict.emission_type
INSERT INTO dict.emission_type (code, value, description, created_by)
VALUES (1, 'Евро 5', 'Европейский стандарт выбросов 5', 'admin'),
       (2, 'Евро 6', 'Европейский стандарт выбросов 6', 'admin'),
       (3, 'Евро 7', 'Европейский стандарт выбросов 7', 'admin');


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
        (SELECT id FROM dict.transmission_type WHERE code = 1), 5,
        (SELECT id FROM dict.drive_type WHERE code = 1), FALSE, 'admin'),
       (2, 'Автоматическая 6-ступенчатая', 'Автоматическая трансмиссия с 6 передачами.',
        (SELECT id FROM dict.transmission_type WHERE code = 2), 6,
        (SELECT id FROM dict.drive_type WHERE code = 2), TRUE, 'admin');


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