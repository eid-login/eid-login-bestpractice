# Informationen zur genutzten Technologieplattform, bisherige Implementierungen und genutzte Lizenzen

## Nutzung von PHP und Javascript

Für die Implementierung des eID-Login wurde serverseitig auf die Sprache PHP gesetzt, da sie eine der weitest verbreiteten Sprachen für Webanwendungen ist.
So konnten Implementierungen für [WordPress](https://github.com/eid-login/eid-login-wordpress), [TYPO3](https://github.com/eid-login/eid-login-typo3) und [Nextcloud](https://github.com/eid-login/eid-login-nextcloud) erstellt werden, alles Plattformen, welche sich im deutschsprachigen Raum größter Beliebtheit erfreuen.

Die niedrigste PHP Version für eine Implementierung sollte 7.1 sein.
Dies ist in der Kompatibilität der genutzten Bibliotheken (s.u.) begründet.

Um dem Benutzer eine zeitgemäße Nutzungserfahrung zu verschaffen und den UX-Konzepten der Plattformen zu entsprechen, kommt darüber hinaus Javascript zum Einsatz.
Der Einsatz von Javascript ist jedoch auch kritisch zu betrachten, da mit ihm oft Probleme bezüglich der Zugänglichkeit von Funktionalitäten entsteht.
Falls eine Zielplattform nicht zwingend Javascript für seine UI/UX vorsieht, sollte daher auf den Einsatz soweit als möglich verzichtet werden.

## Nutzung von speziell angepassten Bibliotheken

Für die Erstellung von SAML Anfragen und die entsprechende Verarbeitung der Antworten ist im Zuge des eID-Templates Projektes das [SAML PHP Toolkit](https://github.com/onelogin/php-saml) von OneLogin genutzt worden.
Diese stabile, kontinuierliche gepflegte Bibliothek vereinfacht die Nutzung von SAML für den Entwickler erheblich.

Aufgrund der Anforderung, auch die Kommunikation nach TR-03130 zu unterstützen, musste diese Bibliothek und ihre Abhängigkeit [xmlseclibs](https://github.com/robrichards/xmlseclibs/) jedoch erweitert werden.
Es wurde die Unterstützung für das SAML Redirect-Binding, AuthnRequest-Extensions sowie das Signaturverfahren [RSA-SSA PSS](https://datatracker.ietf.org/doc/html/rfc4056) hinzugefügt.

Die erweiterte Version des SAML PHP Toolkit steht [hier](https://github.com/eid-login/php-saml) zur freien Verwendung zur Verfügung, während [hier](https://github.com/eid-login/xmlseclibs) die angepasste Version von xmlsseclibs zu finden ist.

Wenn auf die Unterstützung von TR-03130 verzichtet wird, können die Standard-Bibliotheken verwendet werden.

## Verwendete Lizenzen

Eine Bedingung bei der Implementierung der eID-Login Komponenten im Rahmen des eID-Templates Projektes war, auf die Nutzung von proprietären Elementen, die einer späteren Veröffentlichung der Komponenten unter einer freien Software-Lizenz entgegenstehen, zu verzichten.
Es wurden daher die Komponenten unter den freien Software-Lizenzen der jeweiligen Plattform veröffentlicht.
Werden nun bei der Entwicklung eines eID-Login für eine weitere Plattform Teile von den bestehenden Komponenten genutzt, so sind die bisher genutzten Software-Lizenzen zu respektieren.
Des weiteren wäre es wünschenswert, wenn neue Implementierungen auch ohne lizenzrechtlichen Zwang unter einer freien Software-Lizenz veröffentlicht werden.
So würde der bisher im Projekt genutzte Open-Source Gedanke weitergeführt und darüber hinaus eine unabhängige Sicherheits- und Qualitätskontrolle durch die Gemeinschaft der Nutzer ermöglicht.
