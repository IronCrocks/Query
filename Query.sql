-- Создание таблиц

CREATE TABLE view_orders
(
    Idorder INT PRIMARY KEY,
    name NVARCHAR(20),
    Seller_name NVARCHAR(20)
)

CREATE TABLE view_orderitem
(
    Idorderitem INT PRIMARY KEY,
    Idorder INT,
    Name NVARCHAR(20),
    qu INT,
    FOREIGN KEY (Idorder)  REFERENCES view_orders (Idorder)
)

CREATE TABLE view_modelcalc
(
    Idmodelcalc INT PRIMARY KEY,
    Idorderitem INT,
    Good_marking NVARCHAR(20),
    qustore INT,
    FOREIGN KEY (Idorderitem)  REFERENCES view_orderitem (Idorderitem)
)

-- Заполнение тестовых данных

INSERT INTO view_orders 
VALUES
(1,'Ф-100\0922','Иванов'),
(2,'А-101\0922','Петров'),
(3,'А-102\0922','Иванов'),
(4,'Ф-103\0922','Сидоров')

INSERT INTO view_orderitem 
VALUES
(1,1,'Окно',2),
(2,1,'Дверь',1),
(3,2,'Окно',1),
(4,1,'Окно',3),
(5,2,'Дверь',1),
(6,3,'Окно',1),
(7,1,'Окно',1)

INSERT INTO view_modelcalc 
VALUES
(1,1,'A1',3),
(2,2,'B2',1),
(3,1,'A1',4),
(4,2,'C10',5),
(5,2,'A1',1),
(6,3,'B2',2),
(7,3,'C10',4),
(8,4,'A1',1)

-- Выборка данных

1.	Сколько каждого материала должно уходить на каждый заказ? (итоговая сумма)

Select view_orders.Name, view_modelcalc.Good_marking, SUM(view_orderitem.qu * view_modelcalc.qustore)
From view_orders 
Join view_orderitem on view_orders.Idorder=view_orderitem.Idorder
Join view_modelcalc on view_orderitem.Idorderitem=view_modelcalc.Idorderitem
Group by view_orders.Name, view_modelcalc.Good_marking

2.	Сколько всего материалов каких материалов должно уйти на все заказы?

Select view_modelcalc.Good_marking, SUM(view_orderitem.qu * view_modelcalc.qustore)
From view_orders 
Join view_orderitem on view_orders.Idorder=view_orderitem.Idorder
Join view_modelcalc on view_orderitem.Idorderitem=view_modelcalc.Idorderitem
Group by view_modelcalc.Good_marking

3.	Сколько и какого материала должно уйти на изделия Окно для продавца Иванова

Select view_modelcalc.Good_marking, SUM(view_orderitem.qu * view_modelcalc.qustore)
From view_orders 
Join view_orderitem on view_orders.Idorder=view_orderitem.Idorder
Join view_modelcalc on view_orderitem.Idorderitem=view_modelcalc.Idorderitem
Where view_orders.Seller_name = "Иванов" AND view_orderitem.Name="Окно"
Group by view_modelcalc.Good_marking