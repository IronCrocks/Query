-- Создание таблиц

create table Products (
    Id int Primary Key Identity,
    Name nvarchar(20)
) 
create table Categories (
    Id int Primary Key Identity,
    Name nvarchar(20)
) 
create table ProductsCategories (
    ProductId int,
    CategoryId int
    Primary key (ProductId, CategoryId)
)

-- Заполнение данных

insert Products values('Pistol')  
insert Products values('Potato')
insert Products values('Jacket') 
insert Products values('SpaceShip')

insert Categories values('Fruits')  
insert Categories values('Vehicle')
insert Categories values('Weapon') 
insert Categories values('Suits') 

insert ProductsCategories values (1, 3)
insert ProductsCategories values (2, 1)
insert ProductsCategories values (3, 4)

-- Выборка данных

select Products.Name, Categories.Name from ProductsCategories
right join Products on ProductsCategories.ProductId = Products.Id
left join Categories on ProductsCategories.CategoryId = Categories.Id