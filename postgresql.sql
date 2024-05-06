-- melihat table
select * from pg_tables where schemaname='public';
-- \dt


-- membuat table
create table barang (kode int,nama varchar(100) not null,harga int,jumlah int default 0,waktu_dibuat timestamp not null default current_timestamp);

-- melihat struktur table
-- \d nama_table

-- menambahkan kolom
alter table barang add column deskripsi text;

-- menghapus kolom
alter table barang drop column deskripsi;

-- mengubah nama kolom
alter table barang rename nama to name;

-- not nul
-- mengindikasikan bahwa sebuah kolom tidak boleh kosong aka wajib diisi

-- default keyword
-- memberikan nilai default pada sebuah kolom

-- membuat ulang table
truncate barang;
-- digunakan untuk menghapus table lama dan data yang ada di dalamnya
-- lalu membuat tabel baru dengan tipe dan nama kolom yang sama tentu dengan isi kosong

-- menghapus tabel
drop table barang;

create table products (id varchar(10) not null, name varchar(100) not null, description text, price int not null, quantity int not null default 0, created_at timestamp not null default current_timestamp);

-- memasukkan data ke tabel
insert into products(id, name, price, quantity) values ('P0001', 'Mie Ayam Original', 15000, 100);

insert into products(id, name, description, price, quantity) values ('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 100);

insert into products(id, name, price, quantity) values ('P0003', 'Mie Ayam Ceker', 20000, 100), ('P0004', 'Mie Ayam Spesial', 25000, 100), ('P0005', 'Mie Ayam Yamin', 15000, 100);

-- membaca data dari tabel
-- membaca data semua kolom
select * from products;
-- membaca data kolom tertentu
select id, name, price, quantity from products;

-- menambahkan primary key pada tabel yang sudah dibuat
alter table products add primary key (id);

-- mencari data menggunakan where clause
select id, name, price, quantity from products where price = 15000;

select id, name, price, quantity from products where id = 'P0001';

-- menambah tipe data enum
create type PRODUCT_CATEGORY as enum ('Makanan', 'Minuman', 'Lain-Lain');

alter table products add column category PRODUCT_CATEGORY;

-- memperbarui satu kolom
update products set category = 'Makanan' where id = 'P0001';
update products set category = 'Makanan' where id = 'P0002';
update products set category = 'Makanan' where id = 'P0003';
update products set category = 'Makanan' where id = 'P0004';
update products set category = 'Makanan' where id = 'P0005';

-- memperbarui beberapa kolom
update products set category = 'Makanan', description = 'Mie Ayam + Ceker' where id = 'P0003';