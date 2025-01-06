--drop all the tables
DROP TABLE Distributor CASCADE CONSTRAINTS;
DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Domestic CASCADE CONSTRAINTS;
DROP TABLE Foreign CASCADE CONSTRAINTS;
DROP TABLE Award CASCADE CONSTRAINTS;
DROP TABLE Nominate CASCADE CONSTRAINTS;
DROP TABLE Critic CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;


--create all the tables
CREATE TABLE Distributor (
    Name VARCHAR2(100),
    Street_Address VARCHAR2(100),
    City VARCHAR2(100), -- 'Los Angeles'
    State VARCHAR2(100), -- 'VA', 'CA', etc
    Zip_Code VARCHAR2(100),
    Phone_Number VARCHAR2(100), -- 'xxx-xxx-xxxx'
    PRIMARY KEY (Name)
);

CREATE TABLE Movie (
    Title VARCHAR2(100),
    Release_Date DATE, -- '2018/XX/XX'
    Rating VARCHAR2(100), -- 'PG-13', 'G', 'PG', 'R', 'NC-17' etc
    Running_Time VARCHAR2(100), -- 'xHxxMxxS'
    Director VARCHAR2(100), -- 'John Woo'
    DName VARCHAR2(100),
    PRIMARY KEY (Title),
    FOREIGN KEY (DName) REFERENCES Distributor(Name)
);

CREATE TABLE Actor (
    MTitle VARCHAR2(100), 
    Name VARCHAR2(100), -- 'Pauly Shore',
    PRIMARY KEY (MTitle, Name),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title)
);

CREATE TABLE Domestic (
    MTitle VARCHAR2(100),
    HFlag INTEGER, -- 0 or 1
    AFlag INTEGER, -- 0 or 1
    CFlag INTEGER, -- 0 or 1
    Degree_Of_Funniness INTEGER, -- 1~5
    DFlag INTEGER, -- 0 or 1
    Short_Description VARCHAR2(100), -- 'love story', 'documentary', 'humanity', etc
    PRIMARY KEY (MTitle),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title)
);

CREATE TABLE Foreign (
    MTitle VARCHAR2(100),
    Language VARCHAR2(100), 
    English_SubTitle VARCHAR2(100), -- 'Yes' or 'No'
    PRIMARY KEY (MTitle),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title)
);

CREATE TABLE Award (
    Name VARCHAR2(100),
    Year INTEGER, 
    MTitle VARCHAR2(100),
    PRIMARY KEY (Name),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title)
);

CREATE TABLE Nominate (
    MTitle VARCHAR2(100),
    AName VARCHAR2(100),
    PRIMARY KEY (MTitle, Aname),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title),
    FOREIGN KEY (AName) REFERENCES Award(Name)
);

CREATE TABLE Critic (
    Phone_Number VARCHAR2(100), -- 'xxx-xxx-xxxx'
    Name VARCHAR2(100), -- 'Roger Ebert'
    PRIMARY KEY (Phone_Number)
);

CREATE TABLE Review (
    MTitle VARCHAR2(100),
    CPhone_Number VARCHAR2(100), -- 'xxx-xxx-xxxx'
    Evaluation INTEGER, -- 0~5,
    PRIMARY KEY (MTitle, CPhone_Number),
    FOREIGN KEY (MTitle) REFERENCES Movie(Title),
    FOREIGN KEY (CPhone_Number) REFERENCES Critic(Phone_Number)
);


--insertions
--Distributor
INSERT INTO Distributor (Name, Street_Address, City, State, Zip_Code, Phone_Number)
VALUES ('IFC Films', '818 S Mariposa Ave', 'Los Angeles', 'CA', '90005', '206-342-8631');
INSERT INTO Distributor (Name, Street_Address, City, State, Zip_Code, Phone_Number)
VALUES ('20th Century Studios', '1018 Laguna Ave', 'Los Angeles', 'CA', '90026', '212-439-2455');
INSERT INTO Distributor (Name, Street_Address, City, State, Zip_Code, Phone_Number)
VALUES ('Magnolia Pictures', '108 Coulter Lane', 'Richmond', 'VA', '23233', '532-533-6785');
INSERT INTO Distributor (Name, Street_Address, City, State, Zip_Code, Phone_Number)
VALUES ('Media Asia', '2575 Hurry Street', 'Salem', 'VA', '24153', '284-243-5827');
INSERT INTO Distributor (Name, Street_Address, City, State, Zip_Code, Phone_Number)
VALUES ('Greenwich Entertainment', '9 W. Clark Drive', 'Corona', 'NY', '11368', '528-572-4728');

--Movie
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Road House', TO_DATE('2024-06-27', 'YYYY-MM-DD'), 'R', '2H01M42S', 'John Woo', 'IFC Films');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Dune: Part Two', TO_DATE('2014-01-06', 'YYYY-MM-DD'), 'PG-13', '2H46M14S', 'John Woo', '20th Century Studios');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Poor Things', TO_DATE('2018-06-15', 'YYYY-MM-DD'), 'R', '2H21M42S', 'Hailey Lee', 'Media Asia');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Damsel', TO_DATE('2018-11-12', 'YYYY-MM-DD'), 'PG-13', '1H50M23S', 'Jinsoo Han', '20th Century Studios');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Kung Fu Panda 4', TO_DATE('2008-01-27', 'YYYY-MM-DD'), 'PG', '1H34M21S', 'Fred Geldon', 'Magnolia Pictures');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Trolls Band Together', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'PG', '1H31M42S', 'Noah Hong', 'IFC Films');
INSERT INTO Movie (Title, Release_Date, Rating, Running_Time, Director, DName)
VALUES ('Inception', TO_DATE('2010-08-29', 'YYYY-MM-DD'), 'PG-13', '2H28M31S', 'Gio Pilande', 'Greenwich Entertainment');

--Actor
INSERT INTO Actor (MTitle, Name)
VALUES ('Road House', 'Pauly Shore');
INSERT INTO Actor (MTitle, Name)
VALUES ('Road House', 'Jack Nicholson');
INSERT INTO Actor (MTitle, Name)
VALUES ('Dune: Part Two', 'Marlon Brando');
INSERT INTO Actor (MTitle, Name)
VALUES ('Dune: Part Two', 'Denzel Washington');
INSERT INTO Actor (MTitle, Name)
VALUES ('Dune: Part Two', 'Jack Nicholson');
INSERT INTO Actor (MTitle, Name)
VALUES ('Poor Things', 'Meryl Streep');
INSERT INTO Actor (MTitle, Name)
VALUES ('Damsel', 'Daniel Day-Lewis');
INSERT INTO Actor (MTitle, Name)
VALUES ('Kung Fu Panda 4', 'Pauly Shore');
INSERT INTO Actor (MTitle, Name)
VALUES ('Trolls Band Together', 'Tom Hanks');
INSERT INTO Actor (MTitle, Name)
VALUES ('Trolls Band Together', 'Daniel Day-Lewis');
INSERT INTO Actor (MTitle, Name)
VALUES ('Trolls Band Together', 'Cate Blanchett');
INSERT INTO Actor (MTitle, Name)
VALUES ('Inception', 'Audrey Hepburn');
INSERT INTO Actor (MTitle, Name)
VALUES ('Inception', 'Kate Winslet');

--Domestic
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Road House', 1, 1, 1, 1, 0, NULL);
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Dune: Part Two', 1, 1, 0, NULL, 0, NULL);
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Poor Things', 1, 0, 1, 1, 0, NULL);
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Damsel', 0, 0, 1, 4, 1, 'Documentary' );
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Trolls Band Together', 1, 1, 1, 3, 0, NULL);
INSERT INTO Domestic (MTitle, HFlag, AFlag, CFlag, Degree_Of_Funniness, DFlag, Short_Description)
VALUES ('Inception', 1, 1, 1, 3, 1, 'Love Story');

--Foreign
INSERT INTO Foreign (MTitle, Language, English_SubTitle)
VALUES ('Kung Fu Panda 4', 'Chinese', 'Yes');

--Award
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Adapted Screenplay', 2010, 'Inception');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Specific Effects', 2011, 'Inception');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Original Screenplay', 2024, 'Trolls Band Together');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Animated Feature Film', 2023, 'Trolls Band Together');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Makeup', 2019, 'Damsel');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Song', 2023, 'Damsel');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Foreign Language Film', 2018, 'Kung Fu Panda 4');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Production Design', 2023, 'Poor Things');
INSERT INTO Award (Name, Year, MTitle)
VALUES ('Best Sound', 2018, 'Dune: Part Two');

--Nominate
INSERT INTO Nominate (MTitle, AName)
VALUES ('Dune: Part Two', 'Best Sound');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Poor Things', 'Best Production Design');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Poor Things', 'Best Song');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Kung Fu Panda 4', 'Best Sound');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Kung Fu Panda 4', 'Best Foreign Language Film');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Kung Fu Panda 4', 'Best Animated Feature Film');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Damsel', 'Best Adapted Screenplay');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Damsel', 'Best Makeup');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Damsel', 'Best Song');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Trolls Band Together', 'Best Animated Feature Film');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Trolls Band Together', 'Best Original Screenplay');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Inception', 'Best Specific Effects');
INSERT INTO Nominate (MTitle, AName)
VALUES ('Inception', 'Best Adapted Screenplay');

--Critic
INSERT INTO Critic (Phone_Number, Name)
VALUES ('234-438-2494', 'Roger Ebert');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('383-284-1874', 'Gene Siskel');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('284-382-7392', 'Mark Kermode');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('947-284-4828', 'Pauline Kael');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('190-482-4839', 'Leonared Maltin');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('392-584-8372', 'Andrew Sarris');
INSERT INTO Critic (Phone_Number, Name)
VALUES ('492-482-4828', 'Manohla Dargis');

--Review
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Inception', '492-482-4828', 1);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Inception', '392-584-8372', 3);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Trolls Band Together', '190-482-4839', 4);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Trolls Band Together', '947-284-4828', 3);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Damsel', '284-382-7392', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Damsel', '383-284-1874', 2);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '234-438-2494', 3);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '383-284-1874', 0);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '284-382-7392', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '947-284-4828', 1);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '190-482-4839', 4);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '392-584-8372', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Kung Fu Panda 4', '492-482-4828', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Poor Things', '947-284-4828', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Poor Things', '190-482-4839', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Poor Things', '392-584-8372', 5);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Dune: Part Two', '234-438-2494', 1);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Dune: Part Two', '392-584-8372', 4);
INSERT INTO Review (MTitle, CPhone_Number, Evaluation)
VALUES ('Road House', '234-438-2494', 2);





--queries
--1
SELECT Name
FROM Distributor
WHERE City = 'Los Angeles';

--2
SELECT DISTINCT F.MTitle, F.Language
FROM Foreign F
JOIN Nominate N ON F.MTitle = N.MTitle
JOIN Award A ON N.AName = A.Name
AND Year = 2018;

--3
SELECT M.Title, M.Release_Date, M.Running_Time
FROM Movie M 
JOIN Domestic D ON M.Title = D.MTitle
JOIN Actor A ON M.Title = A.MTitle
WHERE  A.Name = 'Pauly Shore'
AND D.CFlag = 1
AND D.Degree_Of_Funniness = 1;

--4
SELECT M.Title
FROM Movie M
JOIN Domestic D ON M.Title = D.MTitle
JOIN Review R ON M.Title = R.MTitle
JOIN Critic C ON R.CPhone_Number = C.Phone_Number
WHERE D.AFlag = 1
AND M.Director = 'John Woo'
AND C.Name = 'Roger Ebert';

--5
SELECT A.Name
FROM Actor A
JOIN Award W ON A.MTitle = W.MTitle
GROUP BY A.Name
HAVING COUNT(W.Name) >= 2;

--6
SELECT COUNT(DISTINCT M.Title) AS Num_of_Movies_with_Average_Five_Stars
FROM Movie M
JOIN REVIEW R ON M.Title = R.MTitle
GROUP BY M.Title
HAVING AVG(R.Evaluation) = 5;

--7
SELECT M.Title
FROM Movie M
LEFT JOIN Nominate N ON M.Title = N.MTitle
WHERE N.MTitle IS NULL;

--8
SELECT M.Title
FROM Movie M
JOIN Review R ON M.Title = R.MTitle
GROUP BY M.Title
HAVING COUNT(DISTINCT R.CPhone_Number) = (SELECT COUNT(*)
                                        FROM Critic);
