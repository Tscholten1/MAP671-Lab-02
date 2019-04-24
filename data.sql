/* Add your SQL below to extract and analyze your state data from at least four layers */
/* If you database setup, you could run this query to get all layers in one pass. ** */
/* *************************************************************** */

/* 1: Extract your state polygon with table attribute name and create new table with info */

create table
	us_state_wi
as
select
	geom,
	name
from 
    us_states
where 
    name = 'Wisconsin';

/* *************************************************************** */

/* 2: Extract your urban area polygons */


create table
	urbanareas_wi
as
select
	geom,
	state,
	gis_acres
from 
    urbanareas
where 
    state like '%WI%';





/* *************************************************************** */

/* 3: Extract your waterbodies polygons */


create table
	nhd_waterbodies_wi
as
select
	geom,
	name,
	feature,
	area_sq_mi
from 
    nhd_waterbodies
where 
    state like '%WI%';





/* *************************************************************** */

/* 4: Extract your stream lines ordered by size of stream */

create table
	nhd_streams_wi
as
select
	geom,
	name,
	length_mi,
	strahler
from 
    "NHD_Streams"
where 
    state like '%WI%'
order by 
    length_mi ASC;