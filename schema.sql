












CREATE TABLE IF NOT EXISTS Bürger (
                        Email_Adresse Varchar (420) NOT NULL  COLLATE nocase PRIMARY KEY
                        CHECK (
                            LENGTH(Email_Adresse) <= 420  AND
                            Email_Adresse LIKE '%_@_%._%' AND
                         NOT GLOB('*[^a-zA-Z0-9]*', SUBSTR(Email_Adresse, 1, INSTR(Email_Adresse, '@') - 1)) AND
                         NOT GLOB('*[^a-zA-Z0-9]*', SUBSTR(Email_Adresse, INSTR(Email_Adresse, '@') + 1, INSTR(Email_Adresse, '.') - INSTR(Email_Adresse, '@') - 1)) AND
                         NOT GLOB('*[^a-zA-Z]*', SUBSTR(Email_Adresse, INSTR(Email_Adresse, '.') + 1, LENGTH(Email_Adresse) - INSTR(Email_Adresse, '.')))
 ),
                        Wohnort_ID INTEGER NOT NULL ,
                        Beruf_ID INTEGER NOT NULL ,
                        Vorname Varchar (30) NOT NULL  CHECK (Vorname NOT GLOB ('[^ -~]*')),
                        Passwort Varchar (30) NOT NULL   CHECK(
                                LENGTH(TRIM(Passwort)) BETWEEN 4 AND 8 AND
                                GLOB('*[A-Z]*[A-Z]*',Passwort) AND
                                GLOB('*[0-9]*[0-9]*',Passwort) AND
                             GLOB('*[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ][0-9]*[0-9]*', Passwort)
                            ),
                        Nachname Varchar (30) NOT NULL  CHECK (Nachname NOT GLOB ('[^ -~]*')),
                        FOREIGN KEY (Wohnort_ID) REFERENCES Wohnort(ID) on delete cascade on update cascade ,
                        FOREIGN KEY (Beruf_ID) REFERENCES Beruf(ID) on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS Gruppe (
                        ID INTEGER NOT NULL PRIMARY KEY ,
                        Bürger_Email_Adresse  varchar (25) NOT NULL COLLATE nocase,
                        Sprache Varchar (30) NOT NULL  CHECK (Sprache <> ' ' AND Sprache GLOB '[ -~]*'),
                        Gruppenbezeichnung VARCHAR(30) NOT NULL CHECK (
                                    Gruppenbezeichnung <> ' ' AND
                                    Gruppenbezeichnung COLLATE NOCASE NOT GLOB ('^[A-Za-z]+')
                            ),
                        Öffentlich INTEGER NOT NULL,
                        FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE if not exists Events (
                        Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase   ,
                        ID INTEGER PRIMARY KEY NOT NULL ,
                        Stadt Varchar (30) NOT NULL  CHECK (Stadt <> ' ' AND Stadt GLOB '[ -~]*'),
                        PLZ INTEGER NOT NULL CHECK (PLZ > 0),
                        Straße Varchar (30) NOT NULL  CHECK (Straße <> ' ' AND Straße GLOB '[ -~]*'),
                        Hausnummer Varchar (30) NOT NULL  CHECK (Hausnummer <> ' ' AND Hausnummer GLOB '[ -~]*'),
                        Beschreibung TEXT NOT NULL  CHECK (Beschreibung <> ' ' AND Beschreibung GLOB '[ -~]*'),
                        Titel Varchar (30) NOT NULL  CHECK (Titel <> ' ' AND Titel GLOB '[ -~]*'),
                        Startdatum date NOT NULL,
                        Enddatum date ,
                        Preis DECIMAL(10, 2) NOT NULL CHECK (Preis >= 0),
                        FOREIGN KEY(Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE if not exists Beruf (
                       ID INTEGER PRIMARY KEY NOT NULL ,
                       Name VARCHAR(25) NOT NULL CHECK (Name <> ' ' AND Name COLLATE NOCASE NOT GLOB ('^[A-Za-z]+'))
);


CREATE TABLE if not exists Gewerbliche_Anbieter (
                                        Bürger_Email_Adresse varchar(25) NOT NULL PRIMARY KEY COLLATE nocase,
                                        Gründungsjahr INTEGER NOT NULL CHECK (Gründungsjahr > 0),
                                        FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS Moderator (
                           Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase PRIMARY KEY,
                           FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS Spezialisierung (
                                 ID INTEGER NOT NULL PRIMARY KEY ,
                                 S_Name TEXT NOT NULL CHECK (S_Name <> ' ' AND S_Name COLLATE NOCASE NOT GLOB ('^[A-Za-z]+'))

);


CREATE TABLE IF NOT EXISTS Fähigkeit (
                                         ID INTEGER PRIMARY KEY NOT NULL,
                                         F_Name VARCHAR(25) NOT NULL CHECK (
                                                     F_Name <> ' ' AND
                                                     F_Name NOT GLOB ('^[A-Za-z]+')
                                             )
);



CREATE TABLE if not exists Nachricht (
                           ID INTEGER NOT NULL PRIMARY KEY ,
                           Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase,
                           Anzeige_ID INTEGER NOT NULL,
                           Text TEXT NOT NULL CHECK (Text <> ' '  AND Text GLOB '[ -~]*'),
                           FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade ,
                           FOREIGN KEY (Anzeige_ID) REFERENCES Anzeige(ID) on delete cascade on update cascade
);


CREATE TABLE if not exists Anzeige (
                         ID INTEGER NOT NULL PRIMARY KEY ,
                         Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase,
                         Title varchar(25) NOT NULL CHECK (Title <> ' ' AND Title GLOB '[ -~]*'),
                         Beschreibung TEXT NOT NULL CHECK (Beschreibung <> ' ' AND Beschreibung GLOB '[ -~]*'),
                         FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS Wohnort (
                         ID INTEGER NOT NULL PRIMARY KEY ,
                         Stadt varchar(25) NOT NULL CHECK (Stadt <> ' ' AND Stadt GLOB '[ -~]*'),
                         PLZ INTEGER NOT NULL CHECK (PLZ >= 0),
                         Straße varchar(25) NOT NULL CHECK (Straße <> ' ' AND Straße GLOB '[ -~]*'),
                         Hausnummer varchar(25) NOT NULL CHECK (Hausnummer <> ' ' AND Hausnummer GLOB '[ -~]*')
);


CREATE TABLE if not exists Zusammenwohnen (
                                Bürger1_Email_Adresse TEXT NOT NULL COLLATE nocase,
                                Bürger2_Email_Adresse TEXT NOT NULL COLLATE nocase,
                                PRIMARY KEY (Bürger1_Email_Adresse, Bürger2_Email_Adresse),
                                FOREIGN KEY (Bürger1_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade ,
                                FOREIGN KEY (Bürger2_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);


CREATE TABLE if not exists Ist_in (
                        Gruppe_ID INTEGER NOT NULL,
                        Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase,
                        PRIMARY KEY (Gruppe_ID, Bürger_Email_Adresse),
                        FOREIGN KEY (Gruppe_ID) REFERENCES Gruppe(ID) on delete cascade on update cascade ,
                        FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade
);





CREATE TABLE IF NOT EXISTS Bewerten (
                          Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase,
                          Event_ID INTEGER NOT NULL,
                          Skala INTEGER NOT NULL check ( Skala >=1 AND Skala <=5 ),
                          PRIMARY KEY (Bürger_Email_Adresse, Event_ID),
                          FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade ,
                          FOREIGN KEY (Event_ID) REFERENCES Events(ID) on delete cascade on update cascade
);


CREATE TABLE if not exists Teilnehmen (
                            Bürger_Email_Adresse varchar(25) NOT NULL COLLATE nocase,
                            Event_ID INTEGER NOT NULL,
                            PRIMARY KEY (Bürger_Email_Adresse, Event_ID),
                            FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade ,
                            FOREIGN KEY (Event_ID) REFERENCES Events(ID) on delete cascade on update cascade
);





CREATE TABLE IF NOT EXISTS "G_Anbieter_haben_S" (
                                      Gewerbliche_Anbieter_Bürger_Email_Adresse Varchar (30) NOT NULL COLLATE nocase,
                                      Spezialisierung_ID INTEGER NOT NULL,
                                      PRIMARY KEY (Gewerbliche_Anbieter_Bürger_Email_Adresse, Spezialisierung_ID),
                                      FOREIGN KEY (Gewerbliche_Anbieter_Bürger_Email_Adresse) REFERENCES Gewerbliche_Anbieter (Bürger_Email_Adresse) on delete cascade on update cascade ,
                                      FOREIGN KEY (Spezialisierung_ID) REFERENCES Spezialisierung(ID) on delete cascade on update cascade
);






CREATE TABLE IF NOT EXISTS Besitzen (
                          Bürger_Email_Adresse Varchar (30) NOT NULL COLLATE nocase,
                          Fähigkeit_ID INTEGER NOT NULL,
                          PRIMARY KEY (Bürger_Email_Adresse, Fähigkeit_ID),
                          FOREIGN KEY (Bürger_Email_Adresse) REFERENCES Bürger(Email_Adresse) on delete cascade on update cascade ,
                          FOREIGN KEY (Fähigkeit_ID) REFERENCES Fähigkeit(ID) on delete cascade on update cascade
);







CREATE TRIGGER IF NOT EXISTS CheckTEILNAHME
    BEFORE INSERT ON bewerten
    FOR EACH ROW
BEGIN

    SELECT RAISE(ABORT, 'ERROR')
    WHERE NOT EXISTS (
        SELECT 1
        FROM teilnehmen
        WHERE teilnehmen.Bürger_Email_Adresse = NEW.Bürger_Email_Adresse
          AND teilnehmen.Event_ID = NEW.Event_ID
    );
END;




CREATE TRIGGER IF NOT EXISTS GruppTeilnehmen
    BEFORE INSERT ON Gruppe
    FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'ERROR.')
    WHERE NEW.Öffentlich = TRUE AND (
                                        SELECT COUNT(*)
                                        FROM Gruppe
                                        WHERE Gruppe.Bürger_Email_Adresse = NEW.Bürger_Email_Adresse AND Gruppe.Öffentlich = TRUE
                                    ) >= 2;
END;







CREATE TRIGGER IF NOT EXISTS Stop
    BEFORE DELETE ON Anzeige
    FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'ERROR')
    WHERE EXISTS (
        SELECT 1
        FROM Nachricht
        WHERE Nachricht.Anzeige_ID = OLD.ID
    );
END;








