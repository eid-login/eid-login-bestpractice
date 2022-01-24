---
title:  'eID-Login - Best-Practices Leitfaden'
author:
- ecsec GmbH - Tobias Assmann
lang: 'de'
toc-depth: 2
\fancyhf{}: clear header and footer settings.
\addtolength{\skip\footins}: Increase the space between footnotes and text.
header-includes: |
    \usepackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[R]{ecsec GmbH 2021}
    \fancyfoot[C]{\thepage}
    \addtolength{\skip\footins}{1cm}
...

# Einleitung

Im Rahmen von "Projekt 396" (eID-Templates - Anwendungsintegration mobiler elektronischer Identitäten auf substanziellem Sicherheitsniveau) im Auftrag des Bundesamtes für Sicherheit in der Informationstechnik (BSI) wurden durch die ecsec GmbH sogenannte eID-Templates für Dokumente mit eID-Funktion zur höheren Verbreitung der Nutzung der Online-Ausweisfunktion bei den Anwendern und Dienstanbietern für gängige Webanwendungen entwickelt und Ausweisinhabern zur Nutzung zur Verfügung gestellt.

Da es sich bei der Funktion der entwickelten Software-Module vor allem um einen Mechanismus zur Anmeldung an einer Webanwendung handelt, wird die Software im folgenden "eID-Login" genannt.

Das vorliegende Dokument umfasst die im Rahmen des Projektes entstandenen Best-Practices und kann als Leitfaden dienen, wenn ein eID-Login für weitere Plattformen bzw. Anwendungen umgesetzt werden soll.

## Stand des Dokumentes

* Version 1.0: Initiales Dokument

# Fachliche Hintergründe

Will man sich in einer Webanwendung authentifizieren, um zum Beispiel Zugriff auf geschützte Ressourcen zu erhalten, so erfolgt dies meist mit einer Kombination aus Benutzername und Passwort.
Vorteil dieses Verfahrens ist vor allem seine Verbreitung und Bekanntheit. Diese sorgen dafür, dass Entwicklern eine Fülle an direkt oder als Vorlage nutzbaren Lösungen zur Verfügung steht.
Außerdem sind potentielle Benutzer mit dem Verfahren vertraut und es gibt wenig bis keinen Bedarf an Unterstützung bei der Nutzung.

Diese Verfahren bringen jedoch auch erhebliche Nachteile mit sich. Die direkt in der Anwendung hinterlegten Daten zur Authentifizierung müssen in jeder Implementierung ausreichend geschützt sein, um sie vor Diebstahl zu bewahren. Passwörter sind oft zu einfach, so dass sie geknackt werden können, falls nicht geeignete Schutzmaßnahmen getroffen werden.

Eine Alternative dazu ist die sogenannte Zwei-Faktor-Authentisierung (2FA).
Es gibt sie in zahlreichen Varianten: manche Varianten ergänzen das zuvor eingegebene Passwort um einen zusätzlichen Faktor, andere ersetzen den Login mit Benutzername und Passwort komplett durch eine direkte Kombination zweier Faktoren.
Dabei bieten vor allem hardwaregestützte Verfahren - wie der eID-Login mit der Ausweiskarte - ein hohes Maß an Sicherheit und sollten ergänzend (beziehungsweise ersetzend) zu einem starken Passwort genutzt werden.

Dieses Dokument mit den gewonnenen Erfahrungen bei der Entwicklung von eID-Login Implementierungen soll nun Hilfestellung geben für weitere Umsetzungen, so dass auch weitere Plattformen mit dieser sichereren Form der Authentisierung ausgestattet werden können.

Weitere Informationen und Empfehlungen des BSI zu 2FA finden Sie [hier](https://www.bsi.bund.de/DE/Themen/Verbraucherinnen-und-Verbraucher/Informationen-und-Empfehlungen/Cyber-Sicherheitsempfehlungen/Accountschutz/Zwei-Faktor-Authentisierung/zwei-faktor-authentisierung_node.html).

# Technische Hintergründe

## Security Assertion Markup Language (SAML)

Bei der Implementierung eines eID-Login kommt die "Security Assertion Markup Language" (kurz: SAML) zum Einsatz.
Dieses weitreichend etablierte XML-Framework zum Austausch von Authentifizierungs- und Autorisierungsinformationen ermöglicht die Kommunikation zwischen einem Dienstanbieter ("Service Provider" oder kurz "SP") und einem Identitätsanbieter ("Identity Provider" oder kurz "IdP").
Es kann so eine Anmeldung bei einem Dienstanbieter auf Basis der vom Identitätsanbieter bereitgestellten Identitätsinformationen erfolgen.

Im Falle des eID-Login stammen die bereitgestellten Identitätsinformationen aus den beim Identitätsanbieter von der eID gelesenen Attributen bzw. aus einem abgeleiteten Pseudonym.
Weitere Informationen zu SAML finden Sie in der [Spezifikation](http://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).

## BSI TR-03130 eID-Server

Eine spezielle Lösung zum elektronischen Identitätsnachweis stellt die [Technische Richtlinie 03130 des Bundesamt für Sicherheit in der Informationstechnik (BSI)](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Technische-Richtlinien/TR-nach-Thema-sortiert/tr03130/TR-03130_node.html) dar.
Dieser auf SAML aufbauende Standard nutzt als Identitätsanbieter sogenannte eID-Server, welche höchsten Sicherheitsstandards genügen müssen.
Es sind bei der Nutzung von TR-03130 einige technische Besonderheiten zu berücksichtigen, welche im Rahmen dieses Dokumentes mit beschrieben werden.
