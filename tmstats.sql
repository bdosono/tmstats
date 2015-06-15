# Create tables for TMSTATS (Toastmasters Stats)

# Club table

drop table clubs;
drop table loaded;
drop table clubchanges;
drop table distperf;

CREATE TABLE IF NOT EXISTS clubs (
    # This table is derived from the Toastmasters clublist and has mostly static data about clubs.
    district INT,
    division CHAR(2),
    area CHAR(2),
    clubnumber INT,
    clubname VARCHAR(100) ,
    charterdate date,
    suspenddate date,
    address VARCHAR(200) ,
    city VARCHAR(100) ,
    state VARCHAR(100) ,
    zip VARCHAR(20) ,
    country VARCHAR(100) ,
    phone VARCHAR(40) ,
    meetingtime VARCHAR(100) ,
    meetingday VARCHAR(100) ,
    clubstatus VARCHAR(100) ,
    clubwebsite VARCHAR(100) ,
    clubemail VARCHAR(100) ,
    facebook VARCHAR(100) ,
    advanced BOOL,
    firstdate date, 
    lastdate date,
    primary key(clubnumber, firstdate)
) CHARACTER SET utf8;
        
# Data currency table

CREATE TABLE IF NOT EXISTS loaded (
    tablename VARCHAR(8),
    loadedfor date,
    primary key(tablename, loadedfor)
);
        
# Club changes table

CREATE TABLE IF NOT EXISTS clubchanges (
    item VARCHAR(100),
    old VARCHAR(200),
    new VARCHAR(200),
    clubnumber INT,
    changedate date,
    primary key(item, clubnumber, changedate)
);

CREATE TABLE IF NOT EXISTS distperf (
    # This table is derived from the Toastmasters "District Performance" report.  Its data changes daily.
    district INT,
    division CHAR(2),
    area CHAR(2),
    clubnumber INT,
    clubname VARCHAR(100),
    newmembers INT,
    laterenewals INT,
    octrenewals INT,
    aprrenewals INT,
    totalrenewals INT,
    totalcharter INT,
    totaltodate INT,
    dist CHAR(1),
    month VARCHAR(12),
    asof date,
    primary key(clubnumber, asof)
) CHARACTER SET utf8;
        