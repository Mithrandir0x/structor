create database if not exists airline_ontime;
use airline_ontime;

drop table if exists flights;
drop table if exists airports;
drop table if exists airlines;
drop table if exists planes;

create table airports (
    iata string, airport string, city string,
    state string, country string, lat double,
    lon double
)
STORED AS ORC
location '/apps/hive/warehouse/airline_ontime.db/airports';

create table airlines (
    code string, description string
)
STORED AS ORC
location '/apps/hive/warehouse/airline_ontime.db/airlines';

create table planes (
    tailnum string, owner_type string, manufacturer string,
    issue_date string, model string, status string,
    aircraft_type string, engine_type string, year int
)
STORED AS ORC
location '/apps/hive/warehouse/airline_ontime.db/planes';

create table flights (
  FlightDate date, DepTime int, CRSDepTime int,
  ArrTime int, CRSArrTime int, UniqueCarrier string,
  FlightNum int, TailNum string, ActualElapsedTime int,
  CRSElapsedTime int, AirTime int, ArrDelay int,
  DepDelay int, Origin string, Dest string,
  Distance int, TaxiIn int, TaxiOut int,
  Cancelled int, CancellationCode string, Diverted string,
  CarrierDelay int, WeatherDelay int, NASDelay int,
  SecurityDelay int, LateAircraftDelay int
)
PARTITIONED BY (Year int)
STORED AS ORC
location '/apps/hive/warehouse/airline_ontime.db/flights'
TBLPROPERTIES("orc.bloom.filter.columns"="*");

alter table flights add partition (year=1987);
alter table flights add partition (year=1988);
alter table flights add partition (year=1989);
alter table flights add partition (year=1990);
alter table flights add partition (year=1991);
alter table flights add partition (year=1992);
alter table flights add partition (year=1993);
alter table flights add partition (year=1994);
alter table flights add partition (year=1995);
alter table flights add partition (year=1996);
alter table flights add partition (year=1997);
alter table flights add partition (year=1998);
alter table flights add partition (year=1999);
alter table flights add partition (year=2000);
alter table flights add partition (year=2001);
alter table flights add partition (year=2002);
alter table flights add partition (year=2003);
alter table flights add partition (year=2004);
alter table flights add partition (year=2005);
alter table flights add partition (year=2006);
alter table flights add partition (year=2007);
alter table flights add partition (year=2008);
