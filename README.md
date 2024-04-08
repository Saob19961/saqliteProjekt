Zusammenfassung
In diesem Projekt wurde eine SQLite-Datenbank entwickelt, die verschiedene Anforderungen erfüllt, um die Integrität der Daten zu gewährleisten und bestimmte Funktionalitäten sicherzustellen.

Kennzeichnung nicht optionaler Attribute: Alle nicht optionalen Attribute sind entsprechend gekennzeichnet, um ihre Bedeutung im Datenbankschema klar zu definieren.

Einschränkungen für Textattribute: Textattribute dürfen keine leeren Zeichenketten enthalten und müssen ausschließlich darstellbare ASCII-Zeichen enthalten.

Format von E-Mail-Adressen: E-Mail-Adressen sind gemäß dem Format X@Y.Z strukturiert, wobei X, Y und Z nicht leere Zeichenketten sind, die nur aus lateinischen Buchstaben und Ziffern bestehen.

Format von Datum und Uhrzeit: Datum und Uhrzeit sind gemäß dem Format "YYYY-MM-DD HH:MM:SS" formatiert.

Besondere Anforderungen an Passwörter: Passwörter müssen zwischen 4 und 8 Zeichen lang sein und mindestens zwei Ziffern und zwei Großbuchstaben enthalten, wobei auf einen Konsonanten immer zwei Ziffern folgen.

Einschränkungen für Bewertungsskala: Die Bewertungsskala ist auf die Werte {1, ..., 5} beschränkt.

Einschränkungen für Bezeichnungen: Bezeichnungen für Spezialisierung, Beruf, Gruppe und Fähigkeit bestehen nur aus lateinischen Buchstaben.

Besondere Regeln für Datenbankoperationen: Modifikationen bei nicht-künstlichen Primärschlüsseln werden kaskadiert, und Annoncen mit zugeordneten Nachrichten können nicht gelöscht werden.

Umgesetzte Anfragen: Verschiedene Anfragen wurden umgesetzt, darunter die Auswahl von Events von gewerblichen Anbietern, die Auswahl von Bürgern, die mit anderen Bürgern zusammenwohnen und den gleichen Beruf haben, und die Auswahl von gewerblichen Anbietern mit einem Gründungsjahr nach 1997.

Die README.md-Datei enthält eine detaillierte Dokumentation dieser Anforderungen sowie eine Erläuterung der Implementierungsdetails und Entscheidungen im Projekt.
