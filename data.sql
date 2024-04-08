-- Einträge für die Tabelle "Wohnort"
INSERT INTO Wohnort (ID, Stadt, PLZ, Straße, Hausnummer) VALUES
                                                             (1, 'Berlin', 10115, 'Hauptstraße', '123'),
                                                             (2, 'London', 12345, 'King Street', '456'),
                                                             (3, 'Madrid', 28001, 'Calle Principal', '789');


-- Einträge für die Tabelle "Beruf"
INSERT INTO Beruf (ID, Name) VALUES
                                 (1, 'Softwareentwickler'),
                                 (2, 'Lehrer'),
                                 (3, 'Arzt');




-- Einträge für die Tabelle "Bürger"
INSERT INTO Bürger (Email_Adresse, Wohnort_ID, Beruf_ID, Vorname, Passwort, Nachname) VALUES
                                                                                          ('maxmustermann@example.com', 1, 1, 'Max', 'Less12AB', 'Mustermann'),
                                                                                          ('lisamusterfrau@example.com', 2, 2, 'Lisa', 'EdFG12CV', 'Musterfrau'),
                                                                                          ('johndoe@example.com', 3, 3, 'John', 'KesF34MM', 'Doe');

-- Einträge für die Tabelle "Gruppe"
INSERT INTO Gruppe (ID, Bürger_Email_Adresse, Sprache, Gruppenbezeichnung, Öffentlich) VALUES
                                                                                           (1, 'maxmustermann@example.com', 'Deutsch', 'Fussballverein', 1),
                                                                                           (2, 'lisamusterfrau@example.com', 'Englisch', 'Book Club', 0),
                                                                                           (3, 'johndoe@example.com', 'Spanisch', 'Reiseclub', 1);

-- Einträge für die Tabelle "Events"
INSERT INTO Events (Bürger_Email_Adresse, ID, Stadt, PLZ, Straße, Hausnummer, Beschreibung, Titel, Startdatum, Preis) VALUES
                                                                                                                          ('maxmustermann@example.com', 1, 'Berlin', 10115, 'Hauptstraße', '123', 'Fußballspiel im Stadion', 'Fußballspiel', '2024-04-10', 20.50),
                                                                                                                          ('lisamusterfrau@example.com', 2, 'London', 12345, 'King Street', '456', 'Book club meeting to discuss latest novel', 'Book Club Meeting', '2024-04-15', 0),
                                                                                                                          ('johndoe@example.com', 3, 'Madrid', 28001, 'Calle Principal', '789', 'Planen Sie Ihre nächste Reise mit anderen Mitgliedern', 'Reiseplanungstreffen', '2024-04-20', 0);



-- Einträge für die Tabelle "Gewerbliche_Anbieter"
INSERT INTO Gewerbliche_Anbieter (Bürger_Email_Adresse, Gründungsjahr) VALUES
                                                                           ('maxmustermann@example.com', 2005),
                                                                           ('lisamusterfrau@example.com', 2010),
                                                                           ('johndoe@example.com', 2015);

-- Einträge für die Tabelle "Moderator"
INSERT INTO Moderator (Bürger_Email_Adresse) VALUES
                                                 ('maxmustermann@example.com'),
                                                 ('lisamusterfrau@example.com'),
                                                 ('johndoe@example.com');

-- Einträge für die Tabelle "Anzeige"
INSERT INTO Anzeige (ID, Bürger_Email_Adresse, Title, Beschreibung) VALUES
                                                                        (1, 'maxmustermann@example.com', 'Fußballspiel', 'Ein Fußballspiel im Stadion.'),
                                                                        (2, 'lisamusterfrau@example.com', 'Book Club Meeting', 'Eine Zusammenkunft des Buchclubs.'),
                                                                        (3, 'johndoe@example.com', 'Reiseplanungstreffen', 'Planen Sie Ihre nächste Reise mit uns.');

-- Einträge für die Tabelle "Spezialisierung"
INSERT INTO Spezialisierung (ID, S_Name) VALUES
                                             (1, 'Webentwicklung'),
                                             (2, 'Bildung'),
                                             (3, 'Gesundheit');

-- Einträge für die Tabelle "Fähigkeit"
INSERT INTO Fähigkeit (ID, F_Name) VALUES
                                       (1, 'Kommunikation'),
                                       (2, 'Problem solving'),
                                       (3, 'Teamarbeit');

-- Einträge für die Tabelle "Nachricht"
INSERT INTO Nachricht (ID, Bürger_Email_Adresse, Anzeige_ID, Text) VALUES
                                                                       (1, 'maxmustermann@example.com', 1, 'Ich bin interessiert am Fußballspiel. Kann ich teilnehmen?'),
                                                                       (2, 'lisamusterfrau@example.com', 2, 'Wann ist das nächste Buchclub-Treffen?'),
                                                                       (3, 'johndoe@example.com', 3, 'Hat jemand Vorschläge für eine Reiseziel?');






-- Einträge für die Tabelle "Zusammenwohnen"
INSERT INTO Zusammenwohnen (Bürger1_Email_Adresse, Bürger2_Email_Adresse) VALUES
                                                                              ('maxmustermann@example.com', 'lisamusterfrau@example.com'),
                                                                              ('lisamusterfrau@example.com', 'johndoe@example.com'),
                                                                              ('johndoe@example.com', 'maxmustermann@example.com');

-- Einträge für die Tabelle "Ist_in"
INSERT INTO Ist_in (Gruppe_ID, Bürger_Email_Adresse) VALUES
                                                         (1, 'maxmustermann@example.com'),
                                                         (2, 'lisamusterfrau@example.com'),
                                                         (3, 'johndoe@example.com');




-- Einträge für die Tabelle "Teilnehmen"
INSERT INTO Teilnehmen (Bürger_Email_Adresse, Event_ID) VALUES
                                                            ('maxmustermann@example.com', 1),
                                                            ('lisamusterfrau@example.com', 2),
                                                            ('johndoe@example.com', 3);
-- Einträge für die Tabelle "Bewerten"
INSERT INTO Bewerten (Bürger_Email_Adresse, Event_ID, Skala) VALUES
                                                                 ('maxmustermann@example.com', 1, 4),
                                                                 ('lisamusterfrau@example.com', 2, 5),
                                                                 ('johndoe@example.com', 3, 3);

-- Einträge für die Tabelle "G_Anbieter_haben_S"
INSERT INTO "G_Anbieter_haben_S" (Gewerbliche_Anbieter_Bürger_Email_Adresse, Spezialisierung_ID) VALUES
                                                                                                     ('maxmustermann@example.com', 1),
                                                                                                     ('lisamusterfrau@example.com', 2),
                                                                                                     ('johndoe@example.com', 3);

-- Einträge für die Tabelle "Besitzen"
INSERT INTO Besitzen (Bürger_Email_Adresse, Fähigkeit_ID) VALUES
                                                              ('maxmustermann@example.com', 1),
                                                              ('lisamusterfrau@example.com', 2),
                                                              ('johndoe@example.com', 3);
