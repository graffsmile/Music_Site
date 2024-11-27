CREATE SCHEMA IF NOT EXISTS "Music_Site(v3)"
    AUTHORIZATION postgres;

create table if not exists Album (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	artist VARCHAR(40) not null,
	release_date date not null check (release_date > '1990-01-01') 
);

create table if not exists Artist (
	id SERIAL primary key,
	name VARCHAR(40) not null);

create table if not exists Genre (
	id SERIAL primary key,
	name VARCHAR(40) not null);

create table if not exists Artist_Genre (
	ArtistID integer references Artist(id),
	GenreID integer references Genre(id),
	constraint ag primary key (ArtistID, GenreID)
);


create table if not exists Artist_Album (
	ArtistID integer references Artist(id),
	AlbumID integer references Album(id),
	constraint pk primary key (ArtistID, AlbumID)
	);

create table if not exists Track (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	track_duration integer not null check (track_duration > '60'),
	AlbumID integer references Album(id));

create table if not exists Collection (
	id SERIAL primary key,
	title VARCHAR(40) not null,
	release_date date not null check (release_date > '1990-01-01'));

create table if not exists Track_Collection (
	TrackID integer references Track(id),
	CollectionID integer references Collection(id),
	constraint TC primary key (TrackID, CollectionID)
	);
