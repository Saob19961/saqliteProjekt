SELECT W.*
FROM Events W
         JOIN Gewerbliche_Anbieter GA ON W.Bürger_Email_Adresse = GA.Bürger_Email_Adresse
WHERE julianday(W.Enddatum) - julianday(W.Startdatum) > 2;


SELECT *
FROM Bürger E1
         JOIN Bürger E2 ON E1.Beruf_ID = E2.Beruf_ID AND E1.Wohnort_ID = E2.Wohnort_ID
WHERE E1.Email_Adresse != E2.Email_Adresse;



SELECT *
FROM Gewerbliche_Anbieter
WHERE Gründungsjahr > 1997;
