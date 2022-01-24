# eID-Login Best-Practices Leitfaden

## Hintergrund

Im Rahmen von "Projekt 396" (eID-Templates - Anwendungsintegration mobiler
elektronischer Identitäten auf substanziellem Sicherheitsniveau) im Auftrag des
[Bundesamtes für Sicherheit in der Informationstechnik
(BSI)](https://www.bsi.bund.de/) wurden durch die [ecsec
GmbH](https://www.ecsec.de/) sogenannte eID-Templates für Dokumente mit
eID-Funktion zur höheren Verbreitung der Nutzung der Online-Ausweisfunktion bei
den Anwendern und Dienstanbietern für gängige Webanwendungen entwickelt und
Ausweisinhabern zur Nutzung zur Verfügung gestellt.

Da es sich bei der Funktion der entwickelten Software-Module vor allem um einen
Mechanismus zur Anmeldung an einer Webanwendung handelt, wird die Software im
folgenden "eID-Login" genannt.

Das vorliegende Dokument umfasst die im Rahmen des Projektes entstandenen
Best-Practices und kann als Leitfaden dienen, wenn ein eID-Login für weitere
Plattformen bzw. Anwendungen umgesetzt werden soll.

## Erzeugen einer PDF-Datei

Aus den Markdown-Dateien kann mittels `pandoc` eine PDF-Datei erzeugt werden.
Hierfür kann das Skript `generate.sh` im Ordner `de` verwendet werden. Der
letzte Stand des Dokuments findet sich jeweils in den
[Releases](https://github.com/eid-login/eid-login-bestpractice/releases).
