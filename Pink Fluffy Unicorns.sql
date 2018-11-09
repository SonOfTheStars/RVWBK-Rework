create or replace Table rvwbk_search_ausb_aktuell
(
int_key INTEGER NOT NULL AUTO_INCREMENT,
ausb_key varchar(255) NOT NULL UNIQUE,
ausb_label varchar(255) NOT NULL,
ausb_level int NOT NULL,
CONSTRAINT PK_aus_akt_ik PRIMARY KEY (int_key)
);

insert into rvwbk_search_ausb_aktuell
(ausb_key,ausb_label,ausb_level)
values
('ohne', 'Ohne Abschluss',1),
('ausland','Abschluss im Ausland erworben',2),
('Hauptschule_Klasse_9','Hauptschulabschlusss nach Klasse 9',3),
('Gymnasium_Klasse_9','Abgang aus Klasse 9 am Gymnasium mit Berechtigung zum Besuch der gymnasialen Oberstufe (Einführungsphase)',4),
('Hauptschule_Klasse_10','Hauptschulabschluss nach Klasse 10',5),
('Gymnasium_Klasse_10','Versetzung in die Jahrgangsstufe 10 (Einführungsphase) am Gymnasium (Berechtigung zum Besuch der gymnasialen Oberstufe)',6),
('Mittel_Fachoberschulreife_Normal','Mittlerer Schulabschluss (Fachoberschulreife)',7),
('Mittel_Fachoberschulreife_Qualifikation','Mittlerer Schulabschluss (Fachoberschulreife) mit Qualifikationsvermerk',8),
('Gymnasium_Klasse_11','Versetzung in die Jahrgangsstufe 11 am Gymnasium',9),
('Fachoberschulreife_Normal','Fachoberschulreife',10),
('Fachoberschulreife_Qualifikation','Fachoberschulreife mit Qualifikationsvermerk',11),
('Fachoberschulreife_Einschlägig','Fachoberschulreife + einschlägige Berufsausbildung',11),
('Fachhochschulreife','Fachhochschulreife (schulisch)',12);



create or replace Table rvwbk_search_fach_gewuenscht
(
int_key int NOT NULL AUTO_INCREMENT,
fach_key varchar(255) NOT NULL UNIQUE,
fach_label varchar(255) NOT NULL,
CONSTRAINT PK_fach_gew_ik PRIMARY KEY (int_key)
);

insert into rvwbk_search_fach_gewuenscht
(fach_key,fach_label)
values
('Wirtschaft_Verwaltung','Wirtschaft/Verwaltung'),
('Technik','Technik'),
('Gesundheit_Soziales','Gesundheit/Soziales'),
('Ernaehrung_Versorgung','Ernährung/Versorgung');


create or replace Table rvwbk_search_abschluss_gewuenscht
(
int_key int NOT NULL AUTO_INCREMENT,
abschl_key varchar(255) NOT NULL UNIQUE,
abschl_label varchar(255) NOT NULL,
bildungsgang_min_ausb_level int,
bildungsgang_max_ausb_level int,
CONSTRAINT PK_abs_gew_ik PRIMARY KEY (int_key)
);

insert into rvwbk_search_abschluss_gewuenscht
(abschl_key,abschl_label,bildungsgang_min_ausb_level,bildungsgang_max_ausb_level)
values
('Beruf','Beruf',1,12),
('ABI','ABI - Abitur (Vollabitur, Allgemeine Hochschulreife)',9,11),
('FHR','FHR - Fachhochschulreife',7,9),
('FOR','FOR - Mittlerer Schulabschluss',3,5),
('Hauptschule_10','Hauptschulabschluss nach Klasse 10',1,4),
('Hauptschule_9','Hauptschulabschluss nach Klasse 9',1,3),
('Foerder','Förderabschluss',1,2);



create or replace Table rvwbk_search_angebotener_bildungsgang
(
int_key int NOT NULL AUTO_INCREMENT,
bildungsgang_schule varchar(255),
bildungsgang_fach varchar(255),
bildungsgang_dauer decimal,
bildungsgang_abschluss varchar(255),
CONSTRAINT PK_ang_bild_ik PRIMARY KEY (int_key),
CONSTRAINT FK_bildungsgang_fach FOREIGN KEY (bildungsgang_fach) REFERENCES rvwbk_search_fach_gewuenscht(fach_key),
CONSTRAINT FK_bildungsgang_abschluss FOREIGN KEY (bildungsgang_abschluss) REFERENCES rvwbk_search_abschluss_gewuenscht(abschl_key)
);

insert into rvwbk_search_angebotener_bildungsgang
(bildungsgang_schule,bildungsgang_fach,bildungsgang_dauer,bildungsgang_abschluss)
values
('Testschule 1','Wirtschaft_Verwaltung',2,'Beruf'),
('Testschule 2','Technik',3,'ABI'),
('Testschule 3','Wirtschaft_Verwaltung',2,'FHR'),
('Testschule 4','Gesundheit_Soziales',2,'FHR'),
('Testschule 5','Technik',3,'FOR'),
('Testschule 6','Ernaehrung_Versorgung',3,'Beruf'),
('Testschule 7','Wirtschaft_Verwaltung',3,'FHR'),
('Testschule 8','Gesundheit_Soziales',3,'Hauptschule_10'),
('Testschule 9','Technik',3,'FHR'),
('Testschule 10','Ernaehrung_Versorgung',3,'FOR');

