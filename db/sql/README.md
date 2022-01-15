login:
```bash
mysql -u root -p
```

create .sql file:
```bash
mysqldump -u root -p pokemon > ./pokemon.sql
```

import .sql file:
```sql
source .\pokemon.sql
```
```bash
mysql -u root -p pokemon < ./pokemon.sql
```

select all pokemon attacks:
```sql
select p.name as pokemon, l.level as level, a.name as attacke, a.typ as typ, l.methode as methode from (select * from lernt where pokemon = (select id from pokemon where name = "Glumanda")) as l join pokemon as p on l.pokemon = p.id join attacke as a on l.attacke = a.id order by l.level;
```

select all tms:
```sql
select a.name as attacke, i.bezeichnung as item, at.Spiel as spiel from attacke_tm as at join attacke as a on at.attacke = a.id join item as i on at.item = i.id;
```

Effektivitaetsmatrix:
```
        | Normal  | Feuer   | Wasser  | Pflanze | Elektro | Eis     | Kampf   | Gift    | Boden   | Flug    | Psycho  | Kaefer  | Gestein | Geist   | Drache  | Unlicht | Stahl   | Fee     |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Normal  |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |    x1   |    x1   |    x0   |    x1   |    x1   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Feuer   |    x1   |    x1   |    x1   |    x1   |    x2   |   x0.5  |    x2   |   x0.5  |    x1   |   x0.5  |    x2   |    x1   |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Wasser  |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x2   |    x1   |    x2   |   x0.5  |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Pflanze |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |   x0.5  |    x2   |    x1   |   x0.5  |   x0.5  |   x0.5  |    x1   |   x0.5  |    x2   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Elektro |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |   x0.5  |    x1   |   x0.5  |    x1   |    x1   |    x2   |    x0   |    x1   |    x1   |   x0.5  |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Eis     |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x2   |    x1   |    x1   |    x1   |   x0.5  |    x2   |    x1   |    x1   |    x2   |    x2   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Kampf   |    x1   |   x0.5  |    x2   |    x2   |    x2   |    x1   |   x0.5  |    x2   |    x1   |    x1   |    x1   |   x0.5  |    x0   |   x0.5  |    x1   |    x2   |   x0.5  |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Gift    |    x1   |    x2   |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |    x2   |   x0.5  |   x0.5  |    x1   |   x0.5  |    x0   |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Boden   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x2   |    x    |    x2   |   x0.5  |    x2   |    x1   |    x0   |    x1   |    x2   |    x1   |    x2   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Flug    |    x2   |    x1   |    x1   |    x1   |    x1   |    x1   |    x2   |   x0.5  |   x0.5  |    x1   |    x2   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |   x0.5  |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Psycho  |    x2   |    x1   |    x0   |    x1   |    x1   |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |    x2   |    x2   |    x1   |    x1   |   x0.5  |   x0.5  |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Kaefer  |   x0.5  |   x0.5  |    x2   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x2   |   x0.5  |   x0.5  |   x0.5  |    x1   |   x0.5  |    x2   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Gestein |   x0.5  |    x1   |    x1   |    x1   |    x2   |    x1   |    x2   |    x1   |    x1   |    x2   |    x1   |    x1   |    x1   |    x2   |    x1   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Geist   |    x1   |    x1   |   x0.5  |    x0   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |   x0.5  |    x2   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Drache  |    x1   |    x0   |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Unlicht |   x0.5  |   x0.5  |   x0.5  |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |    x1   |    x2   |    x1   |    x1   |   x0.5  |    x2   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Stahl   |    x1   |    x2   |    x1   |    x1   |    x2   |    x1   |    x1   |    x2   |    x1   |   x0.5  |    x1   |    x1   |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |
--------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
Fee     |    x2   |    x1   |    x2   |    x1   |    x1   |    x2   |    x1   |    x1   |    x2   |   x0.5  |    x1   |   x0.5  |    x1   |    x1   |    x1   |   x0.5  |    x1   |    x1   |
```