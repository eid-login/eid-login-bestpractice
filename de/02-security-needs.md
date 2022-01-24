# Anforderungen an die Sicherheit einer eID-Login Implementierung

## Nutzung verschlüsselter Kommunikation

Daten mit Bezug zum eID-Login dürfen nur auf verschlüsselten Wegen mit anderen Systemen ausgetauscht werden.
Dies erfordert die Nutzung von HTTPS zur Anbindung aller Systeme, sei es die Kommunikation mit dem Identitätsanbieter oder mit dem Browser des Endnutzers.

## Nutzung von Attributen und der Pseudonymfunktion

Soweit es nicht für die Nutzung der eID im Sinne des Dienstes notwendig ist, sollen keine Attribute der eID angefordert und/oder verarbeitet bzw. gespeichert werden.
Soweit möglich soll auf die [Pseudonymfunktion](https://www.personalausweisportal.de/Webs/PA/DE/verwaltung/technik/pseudonym/pseudonym-node.html) der eID zurückgegriffen werden.
Für den Zweck einer Anmeldung ist z.B. der Zugriff auf die Attribute wie eine in der eID hinterlegte Adresse nicht erforderlich und sollte daher auch nicht angefordert werden.
Ist jedoch geplant, Attribute der eID innerhalb des Dienstes, unabhängig von der Anmeldung am Dienst, weiter zu nutzen, z.B. für Zwecke des e-Commerce, so ist darauf zu achten, dass diese Attribute sicher vor fremden Zugriffen gespeichert werden und der Benutzer die Hoheit über seine Daten im Sinne der Datenschutz-Grundverordnung (DSGVO) behält.

## Security by Design Principles

Um eine eID-Login Implementierung möglichst sicher umzusetzen, sollen soweit möglich die ["Security by Design Principles"](https://wiki.owasp.org/index.php/Security_by_Design_Principles) berücksichtigt werden.

Folgende Grundsätze müssen auf jeden Fall Anwendung finden:

* Sichere Grundeinstellungen (Establish Secure Defaults)\
Der Betreiber des Dienstanbieters soll bei der Konfiguration des eID-Login keine Auswahl von Protokollparametern treffen müssen, da bereits sichere Werte voreingestellt sind.

* Zuverlässige Ausnahmebehandlung (Fail Securely)\
Konstrukte im Quellcode, die zu einem risikobehafteten Systemzustand führen können, sollen systematisch vermieden werden, was durch Code Reviews und Tests überprüft werden muss.

* Vertraue keinem externen Dienst (Don’t Trust Services)\
Die zuverlässige Validierung der von einem externen Dienst erhaltenen Daten muss durch die Mechanismen des eingesetzten Single Sign-On-Protokolls (z.B. SAML) erfolgen.

* Keine Sicherheit durch Verschleierung (Avoid Security by Obscurity)\
Es dürfen nur sicherheitstechnisch wohluntersuchte Standardprotokolle in Verbindung mit geeigneten kryptographischen Algorithmen gemäß der einschlägigen Empfehlungen des BSI (vgl. [hier](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR02102/BSI-TR-02102.html) und [hier](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03116/BSI-TR-03116-4.html)) zum Einsatz kommen.

* Bevorzuge einfache Sicherheitslösungen (Keep Security Simple)\
Der eID-Login soll alle benötigten Komponenten, wie z.B. eine SAML Service Provider Implementierung mitbringen.
Es soll vermieden werden, dass zusätzliche externe Software installiert werden muss.

* Korrekte Behebung von Sicherheitsproblemen (Fix Security Issues Correctly)\
Automatisierte Tests sollen Teil des Entwicklungszyklus sein und sukzessive auch um Tests für gegebenenfalls auftretende Sicherheitslücken ergänzt werden.

* Mehrstufige Sicherheitsmechanismen (Principle of Defense in Depth)\
Mehrstufige Abwehrmechanismen, die über die SAML-basierte Anmeldung an einem Benutzerkonto hinausgehen, sind unabhängig von der mit dem eID-Login realisierten starken Authentifizierung.
Jedoch ist bei der Implementierung sicherzustellen, dass alle von der jeweiligen Plattform bereitgestellten Sicherheitsmechanismen Anwendung finden, um z.B. den nicht autorisierten Zugriff auf die mit dem eID-Login verbundenen Ressourcen zu unterbinden.
