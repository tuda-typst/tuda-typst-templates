// https://github.com/tudace/tuda_latex_templates/blob/4.06/examples/DEMO-TUDaThesis.tex

#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *
#import "@preview/metalogo:1.2.0": LaTeX

#show: tudapub.with(
  language: "de",
  title: [TUDaThesis -- Abschlussarbeiten im Corporate Design der TU Darmstadt],
  subtitle: [#LaTeX using TU Darmstadt's CI],
  thesis_type: "bachelor",
  author: "Marei Peischl",
  date_of_submission: datetime.today(),
  reviewer_names: ("Gutachter*in 1", "Gutachter*in 2", [...]),
  location: "Darmstadt",
  logo_sub_content_text: [
    Studienbereich\
    Computational Engineering\
    \
    Institut
    \
    Arbeitsgruppe
  ],
  logo_tuda: image("logos/tuda_logo.svg"),
  show_pages: (
    title_page: true,
    outline_table_of_contents: true,
    thesis_statement_pursuant: false,
  ),
  bib: bibliography("DEMO-TUDaBibliography.bib"),
)

#heading(level: 1, numbering: none)[Über diese Datei]

Die Datei `DEMO-TUDaThesis.tex` ist ein grundlegendes Template für Abschlussarbeiten im Stil des Corporate Designs der TU Darmstadt.
Sie ist Teil des TUDa-CI-Bundle und wurde in Teilen durch das tuddesign-Paket von C. v. Loewenich und J. Werner inspiriert.
Einige Elemente sind in dieser Datei Beispielhaft verwendet. Für weitere Informationen sei auf die Dokumentation @tuda-ci verwiesen.

Sie verwendet die Dokumentenklasse `tudapub.cls`, allerdings mit erweiterten Einstellungen.
In diesem Dokument werden überwiegend die speziell auf Abschlussarbeiten ausgelegten Funktionen beschrieben.
Weitere Konfigurationsmöglichkeiten finden sich in der allgemeinen TUDa-CI Dokumentation @tuda-ci.

Es wird empfohlen die Datei mit Lua#LaTeX zu kompilieren. Es sollte bei Problemen auf jeden Fall geprüft und wenn möglich auf Lua#LaTeX umgestellt werden.

#heading(level: 1)[Verwendung]
Die Klasse kann wie für Dokumentenklassen üblich eingebunden werden

```

\documentclass[thesis]{tudapub}

```

Die Option `thesis` wechselt hierbei in den Modus, der spezielle Features für Abschlussarbeiten freischaltet, die in diesem Dokument beschrieben werden.

Darüber hinaus lässt sich die Klasse verwenden wie die Standard-KOMA-Script-Klasse, auf der sie basiert.
Voreingestellt ist hierbei `scrreprt`.

Allgemein bietet KOMA-Script viele Möglichkeiten zu Anpassungen. Wie in der tudapub-Demo-Datei beschrieben, können hier jedoch nicht alle erläutert werden, ein Blick in die offizielle Dokumentation ist daher häufig hilfreich @scrguide-de.

#heading(level: 2)[Sprachanpassung]
Der Modus für Abschlussarbeiten setzt einige sprachabhängige Bezeichnungen.
Teilweise ist Deutsch für diese Elemente als Hauptsprache vorgeschrieben (z. B. die Selbstständigkeitserklärung). Für die korrekte Verarbeitung wird daher ein Paket zur Sprachanpassung benötigt.
TUDa-CI verwendet hierfür das babel-Paket.

Dies wird jedoch nicht automatisch geladen, da hierfür die Konfiguration der Sprachen bekannt sein müsste. Die Demo-Dateien für Abschlussarbeiten (`DEMO-TUDaThesis.tex`/`DEMO-TUDaPhD.tex`) laden hierfür die Konfiguration:

```

  \usepackage[english, main=german]{babel}


```

Diese ist für ein Dokument mit Deutsch als Hauptsprache und Englischen Elementen.
Die Hauptsprache wird als Wert der Option `main=` übergeben.
Das Laden von `german` wird in den Fällen, in denen es von TUDa-CI benötigt wird, automatisch ausgelöst.
Für eine bessere Übersichtlichkeit ist es dennoch hilfreich es dort aufzuführen.

Falls die Hauptsprache nicht Deutsch ist, wäre daher die folgende Konfiguration sinnvoll:

```
\usepackage[german, main=<Hauptsprache>]{babel}
```

#heading(level: 2)[Übergabe der Titeldaten]

Die Daten werden analog zur klassischen Titeleierzeugung mit `\maketitle` übergeben. Allerdings wurden die Felder um ein paar speziellere Daten erweitert. Sofern nicht anders angegeben, verfügen alle Makros über ein notwendiges Argument für die Datenübergabe, z. B.

```
\title{\LaTeX{} im Corporate Design der TU Darmstadt}
```

Es ist zu beachten, dass für die Erzeugung der Titelseite nach Übergabe aller Daten `\maketitle` aufgerufen werden muss.

Falls eine Layoutanpassung der Titelseite notwendig ist, gelten die in der TUDa-CI-Dokumentation @tuda-ci geschilderten Optionen. Dort finden sich auch Hinweise zur Platzierung von Sponsorenlogos.

/ `\title`: Titel, wird in sehr großer Schrift im obersten Block der Titelseite platziert. Die Schriftgröße ist aufgrund der Häufigkeit für lange Titel kleiner gewählt als für andere Publikationen.

/ `\subtitle`: Untertitel. Dieses Feld kann alternativ für eine Übersetzung genutzt werden.

/ `\author`: Der Autor/dir Autoren. Mehere Autoren werden durch `\and` getrennt.

/ `\studentID`: Matrikelnummer. Nach den Vorgaben des Templates ist diese Angabe immer optional.

/ `\birthplace`: Geburtsort.

/ `\reviewer`: Gutachter. Mehrere Gutachter werden, wie Autoren durch `\and` getrennt. Die Nummerierung läuft von links nach rechts.
 
*Änderung des Bezeichners*\
Die Änderung des Bezeichners ist über ein optionales Argument möglich:

```
      \reviewer[Ersatzbezeichner]{Name1 \and Name2}

```

Um die numerische Benennung abzuändern ist es zusätzlich möglich statt dem Ersatzbezeichner eine Kommaliste zu übergeben:

```
      \reviewer*[Bezeichner1, Bezeichner2]{Name1 \and Name2}

```

In diesem Fall entfällt die Nummerierung vor dem Bezeichner. Soll z. B. den Formulierungen der Promotionsordnung entsprochen werden, gilt:

```
      \reviewer[Erstreferent\_in,Koreferent\_in]{Name1 \and Name2}

```

Für die Erstellung Fachbereichsspezifischer Templates existiert hierfür auch ein Makro, dass ohne den Aufruf von `\reviewer` Änderungen zulässt.

```
      \setupReviewName{Ersatzwort für „Gutachten“}

```

Setzt die ersten beiden Bezeichner. Alternativ ist es auch möglich Positionen einzeln zu benennen `\setupReviewName[1]{Erstferent}`, eine Übergabe als Komma-Liste ist als `\setupReviewName*{Bezeicher1,Bezeicher2}` möglich.

Ab Version 3.26 werden die Gutachter nicht mehr auf der Titelrückseite genannt. Dies wird über die `thesis` Option `reviewer-on-uppertitleback` gesteuert. Voreingestellt ist der Wert `false`.

/ `\institution`: Einrichtung. Dieser Eintrag, wie auch die beiden folgenden, werden unterhalb des Logos auf der Titelseite platziert.

/ `\department`: Fach-/Studienbereich, allerdings ist die oben genannte Option zu bevorzugen. Die Verarbeitung des Arguments erfolgt jedoch analog.

Dieses Makro verfügt jedoch zusätzlich über die Möglichkeit abweichende Einträge gegenüber den Vorgaben anzugeben. Insbesondere wenn eine gesonderte Formulierung gegenüber der voreingestellten "im Fachbereich" und ihren Varianten notwendig ist. Hierfür liefert `\department` ein optionales Argument:


```
  \department[Ersatztext]{Kürzel/Bezeichnung}


```

Zusätzlich gibt es ab Version 2.01 auch die Möglichkeit den gesamten Text "im Fachbereich \<Bereichsbezeichnung>", sowie die Angabe in der Infobox auf der Titelseite zu ersetzen. Dies geschieht über die gesternte Variante:

```
  \department*[Text für die Box]{Text zwischen Typ und Autor}


```

/ `\group`: Arbeitsgruppe.

/ `\submissiondate`: Datum der Einreichung

/ `\examdate`: Datum der Disputation

/ `\date`: Beliebiges Datum. Wird über `datename` bezeichnet.

/ `\publishers`: Wird hier für die Ortsangabe verwendet und ist mit "Darmstadt", bzw. "Darmstadt, Technische Universität Darmstadt" (bei Dissertationen) vorbelegt.

/ `\tuprints`: Übergabe der Daten, sofern das Dokument über TUprints Veröffentlicht werden soll.

```
  \tuprints{
      printid=12345,
      urn=123456,
      year=2022
  }


```

Falls das Argument kein Gleichheitszeichen erkennt, wird der Wert als `printid` gesetzt und keine URN angegeben.

Die printid is die ID-Nummer des TUprints-Eintrags. Die urn ist ein dauerhaft eindeutig zitierfähiger Bezeichner für das Dokument. Die Nummer entspricht bei TUprints der printid mit Ergänzung einer Prüfziffer. Beide Angaben sind in den Details des TUprints-Eintrags zu finden.

*Lizenzangabe*

Ab Version 2.07 ist es zudem möglich einen eigenen Lizenztext über den Schlüssel `license=<Text>` zu übergeben. Dieser ersetzt dann die voreingestellte Lizenzangabe.

Es existieren (seit v3.08) vorgefertigte Werte für die Option `license`, um eine einfachere Anpassung zu ermöglichen. Diese lauten:

#grid(
  columns: (1fr, 1fr),
  [
    #link("https://creativecommons.org/licenses/by/4.0/")[`cc-by-4.0`] Voreinstellung seit Version 4.0\
    #link("https://creativecommons.org/licenses/by-sa/4.0/")[`cc-by-sa-4.0`]\
    #link("https://creativecommons.org/licenses/by-nc-sa/4.0/")[`cc-by-nc-sa-4.0`]\
    #link("https://creativecommons.org/licenses/by-nc-/4.0/")[`cc-by-nc-4.0`]\
  ],
  [
    #link("https://creativecommons.org/licenses/by-nd/4.0/")[`cc-by-nd-4.0`]\
    #link("https://creativecommons.org/licenses/by-nc-nd/4.0/")[`cc-by-nc-nd-4.0`]\
    #link("https://rightsstatements.org/page/InC/1.0/")[`inc-1.0`] (Ab Version 3.36)\
    #link("https://creativecommons.org/licenses/by-nc-nd/2.0/")[`cc-by-nc-nd-2.0-de`]\
  ]
)

Die Einführung dieser Option war Bestandteil der Vorbereitung zur Anpassung der Standardlizenz.
Die entsprechende Diskussion findet sich unter #link("https://github.com/tudace/tuda_latex_templates/issues/251"). Die Anpassung der Voreinstellung bei TUDa-CI geschah mit Version 4.0.

Unterstützung bei der Wahl einer passenden Creative Commons Lizenz bietet die ULB der TUDa unter https://www.ulb.tu-darmstadt.de/dpub oder das CC-Projekt sebst über seinen Lizenzfinder unter #link("http://creativecommons.org/choose/").
Die TU Darmstadt empfiehlt in Ihrer Publikationsrichtlinie und Open-Access-Policy die Nutzung der offenen CC BY 4.0 Lizenz.

Falls ein von den oben gelisteten Schlüsseln abweichender Wert gesetzt wird, wird ebendieser direkt an der Stelle des Lizenztextes verwendet. Sofern der Text Gleichheitszeichen oder Kommata enthält ist eine Gruppierung notwendig.
/ `\titlegraphic`: Hier kann Code übergeben werden, der den farbigen Block im unteren Teil der Titelseite ersetzt. Details sind in der allgemeinen TUDaPub-Dokumentation beschrieben @tuda-ci.
/ `\titleintro`: Ab Version 2.03 kann zusätzlich über diesen Hook ein beliebiger Text direkt nach dem Untertitel und vor den automatischen Daten ergänzt werden.
/ `\titleaddendum`: Wie `\titleintro` jedoch als letztes Element des Blocks.

#heading(level: 2)[Weitere Makros]
Das Makro `\affidavit` erzeugt eine Selbstständigkeitserklärung mit Unterschriftenzeile. Hier wird der oben übergebene Name/Signatur eingefügt.
In diesem Dokument findet sich das Affidavit direkt nach der Titelei.

Ab Version 3.32 entfällt die seit Version 3.06 unterstütze Unterscheidung zwischen einem Affidavit für digitale oder gedruckte Abgaben. Aus Kompatibilitätsgründen werden die Optionen weiterhin verstanden, allerdings bewirken nun beide das gleiche. Der Text entstammt von #link("https://www.tu-darmstadt.de/studieren/studierende_tu/studienorganisation_und_tucan/hilfe_und_faq/artikel_details_de_en_37824.de.jsp") (Stand 2023-06-19). Es ist zwingend erforderlich, dass Studierende vor der Abgabe einer Arbeit überprüfen, ob der Text der geforderten Fassung entspricht.

Dissertationen verwenden hier einen anderen Text, für die Unterscheidung wird die Affidavit-Option `affidavit=dr` intern verwendet.

Version 3.20 ermöglicht zusätzlich die Übergabe weiterer Optionen für den Signatur-Namen, ein Signatur-Bild oder die Ortsangabe.
Inwieweit diese Optionen verwendet werden dürfen ist jeweils vor der Verwendung durch die Nutzer:in abzuklären.
TUDa-CI kann hierfür keine gesicherte Aussage treffen.

```
\affidavit[
    signature=Signaturname,
    signature-image={\includegraphics[width=\width]{signaturbild}}
]

```

Eine vertikale Verschiebung des Signaturbildes ist nicht direkt implementiert, ist jedoch mit der Verwendung des LaTeX-Makros `\raisebox{<Verschiebung>}{<Inhalt>}` problemlos möglich.

Es besteht zusätzlich die Möglichkeit ein anderssprachiges Affidavit als Ergänzung mit abzudrucken. Um die Struktur und die ggf. notwendige Sprachumschaltung zu erledigen, existiert hierfür ab Version 2.03 eine Umgebung:


```
\begin{affidavit*}[Babel-Sprachoption]{Überschrift}
    Text
\end{affidavit*}

```

Diese Variante verfügt bewusst über keine Unterschriftenzeile, da diese Version laut Verständnis der Entwickler keine rechtliche Verbindlichkeit besitzt.

Die Umgebung kann jedoch auch für besondere Formen der Erklärung genutzt werden. In diesem Fall kann eine zusätzliche Signaturzeile über

```
\AffidavitSignature[Stadt]

```

hinzugefügt werden. Die Vorbelegung für Stadt ist hierbei "Darmstadt".
Ab Version 3.20 ist die Übergabe einer zusätzlichen Option für den Ort der Signatur auch als Option möglich.

```
\affidavit[signature-location=Stadt]
```

#heading(level: 2)[Layout-Optionen mit Verstoß gegen das Corporate Design]

Die Zeilenlängen sind laut Corporate Design aus typografischer Sicht zu lang.
Daher existiert die Klassenoption `custommargins`, die für dieses Dokument aktiviert wurde (Wert `true`). Sie verfügt über die Werte `true`, `false` und `geometry` mit folgender Bedeutung:

/ `custommargins=false`: Standardeinstellung von `tudapub`. Die Ränder entsprechen den Vorgaben des Corporate Design Guidelines. Die Einstellung wird durch `geometry` durchgeführt. Eigene Anpassungen werden durch das Ausführen von `\maketitle` überschrieben.
/ `custommargins=true`: Die Einstellungen des Corporate Design Guidelines werden nicht aktiviert. `geometry` wird nicht geladen. Dieser Modus entspricht der Standardeinstellung von KOMAScript. Dadurch werden die Ränder nicht fest definiert, sondern auf Basis des `typearea`-Paketes berechnet #cite(form: "prose", <scrguide-de>).
/ `custommargins=geometry`: Diese Variante wurde auf Wunsch zur Verfügung gestellt, allerdings wird darauf hingewiesen, dass manuelle Randeinstellungen oft nicht zu einem harmonischen Satzspiegel führt.
  `geometry` wird, wie bei `false` geladen und vorkonfiguriert. Es ist allerdings möglich kleinere Anpassung durch die Verwendung des Makros `\geometry` zu setzen. Die Einstellungen, die zu Beginn des Dokuments gelten werden gespeichert und nach der Titelseite wiederhergestellt.

  Hierbei ist zu beachten, dass die Einstellungen als Ausgangspunkt den Voreingestellten Satzspiegel nutzen (je nach Option mit Randnotizspalte oder ohne). Es ist möglich diese Optionen vor den eigenen mit zurückzusetzen:

```
\geometry{
reset,

}
```

Die gilt insbesondere für die Optionen `includehead`, `includefoot`, `includemp`.

*Hinweis zu den Kopf-/Fußzeilen*\
Wenn die Option `marginpar=true` gesetzt bleibt, ragen die Kopf- und Fußzeile über die Marginalspalte hinaus. Aus ästhetischen Gründen wird daher empfohlen in diesem Fall die Kopf- und Fußzeile mit `marginpar=false` auf den Textbereich zu beschränken.

Auch ist das Standard-Layout der Kolumnentitel wenig vorteilhaft, da die Kolumnentitel damit local größer sein können als die eigentliche Überschrift. (`headline=automark`)
Deswegen kann über

```
\pagestyle{TUDa.headings}
```

ein einfacherer Seitenstil ausgewählt werden, der die Nutzung mit lebenden Kolumnentitel erheblich vereinfacht. Dieser Stil ist über `scrlayer-scrpage` realisiert und kann entsprechend der KOMAScript-Dokumentation angepasst werden.

*Hinweis zur Bindekorrektur*\
Bei Verwendung einer Bindekorrektur (`BCOR=<Länge>`) wird diese nicht automatisch auch auf der Titelseite eingefügt. Für diesen Fall wurde mit Version 3.0 zusätzlich die Option `BCORtitlepage` hinzugefügt. Falls diese aktiviert wird, nimmt die Titelseite den Wert der Typearea Option `BCOR` auf der ersten Seite als Zusatz zum linken Rand hinzu.

#heading(level: 2)[Spezielle Optionen für Abschlussarbeiten]
Die Klasse unterstützt alle Optionen der `tudapub`-Klasse. Darüber hinaus besteht über Wertzuweisung der Option `thesis` die Möglichkeit spezielle Einstellungen zu wählen.
Es ist prinzipiell möglich die Optionen auch direkt als Optionen zur `tudapub`-Klasse zu übergeben, allerdings ist dies aufgrund der schlechteren Übersicht nicht zu empfehlen.

Für dieses Dokument wurden beispielsweise die Optionen als

```
thesis={type=dr,dr=rernat}
```

übergeben.

Im folgenden findet sich die Bedeutung der einzelnen Optionen:
/ `type=<Wert>`: Auswahl des Typus. Dieser wird auf die Titelseite gesetzt und wählt zudem aus welche Daten für die Titelseite zwingend übergeben werden müssen.
  Es stehen die folgenden Werte zur Verfügung (die Werte in Klammern sind die notwendigen Titeldaten):
  - `sta`: Studienarbeit (title, author, date)
  - `diplom`: Diplomarbeit (title, author, submissiondate, reviewer, department)
  - `bachelor`: Bachelorarbeit (title, author, submissiondate, department, reviewer)
  - `master`: Masterarbeit (title, author, submissiondate, department, reviewer)
  - `pp`: Project-Proposal (title, author, date, department)
  - `dr`: vorgelegte Dissertation (title, author, submissiondate, department, reviewer)
  - `drfinal`: genehmigte Dissertation (title, author, submissiondate, examdate, department, reviewer)
  Wird ein Typus angegeben, der nicht erkannt wird, so wird der Text direkt übergeben. Notwendige Titelfelder über den Titel hinaus gibt es in diesem Fall nicht.
/ `dr=<Kürzel>`: Lädt einen der vordefinierten Texte für die Titelseite. Als Werte stehen bislang `rernat`, `rerpol`, `ing` und `phil` zur Verfügung. Zum Beispiel lädt der Wert `phil`:
  #quote[
      Zur Erlangung des Grades eines Doktor der Philosophie (Dr. phil.)
  ]
  Sofern keiner dieser Werte dem angestrebten Titel entspricht, kann ein Text direkt übergeben werden.

```
  \drtext{Zur Erlangung des Grades \ldots}

```

/ `department=<Kürzel>`: Die Fachbereiche sind fest als Textbausteine in Deutscher sowie Englischer Sprache hinterlegt. Diese Option ermöglicht die Auswahl als Dokumentenklassenoption. Aus Kompatibilitätsgründen kann jedoch auch das Makro `department`-Makro hierfür genutzt werden. Zur Verfügung stehen:\
#table(
  columns: (auto, auto),
  stroke: none,
  [arch], [-> Architektur],
  [bauing], [-> Bau- und Umweltingenieurwissenschaften],
  [bio], [-> Biologie],
  [chem], [-> Chemie],
  [etit], [-> Elektrotechnik und Informationstechnik],
  [gugw], [-> Gesellschafts- und Geschichtswissenschaften],
  [humanw], [-> Humanwissenschaften],
  [inf], [-> Informatik],
  [mb], [-> Maschinenbau],
  [matgeo], [-> Material- und Geowissenschaften],
  [math], [-> Mathematik],
  [phys], [-> Physik],
  [wi], [-> Rechts- und Wirtschaftswissenschaften]
)

Neben den Fachbereichen existieren für Abschlussarbeiten, die keine Dissertationen sind, auch Studienbereiche.
Falls das Kürzel nicht als Fachbereich hinterlegt ist, wird automatisch auf die Studienbereiche geprüft. Die Studienbereiche haben die folgenden Kürzel:

#table(
  columns: (auto, auto),
  stroke: none,
  [ce], [-> Computational Engineering],
  [ese], [-> Energy Science and Engineering],
  [ist], [-> Information Systems Engineering],
  [mech], [-> Mechanik],
  [metro], [-> Mechatronik]
)

Falls etwas anderes als eines dieser Kürzel übergeben wird, wird der Text direkt verwendet und eine entsprechende Warnung ausgegeben.

Die Auswahl der Fachrichtung erzeugt zusätzlich eine Box auf der Titelseite unterhalb des Logos. Falls diese automatische Erstellung nicht gewünscht ist, kann dies über die Option `instbox=false` deaktiviert werden.
/ `ignore-missing-data`: Diese Option ist ein Schalter, der es ermöglicht die Fehlermeldung über nicht übergebene Titeldaten auszuschalten. In diesem Fall wird lediglich eine Warnung erzeugt, falls die angegeben Daten nicht mit den Anforderungen übereinstimmen.

*Abweichung von den Vorgaben für die Titelseite*\
Da es möglich sein kann von dieser Vorgabe abzuweichen, existiert für Sonderfälle die Dokumentenklassenoption `instbox=false`. Damit wird die automatische Verarbeitung der Daten für die Boxen auf der der Titelseite unterdrückt. In diesem Fall ist der Autor jedoch selbst für die Einhaltung der Vorschriften verantwortlich. Weitere Information zur Konstruktion der Boxen findet sich in den Verwendungshinweisen der Basisklasse TUDaPub. Zusätzlich sei auf die Möglichkeiten des `\department`-Makros verwiesen, sofern die Abweichung sich auf den Text beschränkt.

#heading(level: 2)[Erhöhter Zeilenabstand -- Hinweise zum setspace-Paket]
Sofern die Vorgaben es erfordern, ist es möglich mit dem setspace-Paket den Durchschuss zu erhöhen. Allerdings beeinflusst dies natürlich sämtliche Zeilenabstände. Ein erhöhter Zeilenabstand sollte daher erst nach der Titelseite aktiviert werden. Allgemein ist es jedoch empfehlenswert auch für Verzeichnisse und sonstige Sonderelemente außerhalb des Fließtextes auf bei normalen Einstellungen zu bleiben.

Setspace liefert hierfür die Möglichkeit, das Paket ohne Optionen zu laden und später über Makros, wie `\onehalfspacing` das Umschalten zu verzögern. Alternativ kann auch durch die Umgebungen, wie `singlespace` lokal wieder zum Normalzustand gewechselt werden, sofern dies erforderlich ist.
