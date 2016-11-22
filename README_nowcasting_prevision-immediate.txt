  README: Scribe Nowcasting Matrices

(Le français suit)

----------------------------------------

ENVIRONMENT CANADA

README file about the Scribe Nowcasting Matrices available
on the Meteorological Service of Canada's HTTP data server.

To read this file online, please go to:
http://dd.weatheroffice.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt

Files are produced or distributed by Environment Canada:
http://ec.gc.ca/

-------------------------------------------------------
Edition of 2014-10-14
-------------------------------------------------------

In this file:
* About
* License
* Download
* Description
* Data
* Filename
* Station's codes
* Contact Us



##############################################
###                About                   ###
##############################################

This document explains the Scribe Nowcasting Matrices that are produced            
for a selected number of Canadian Observation sites in the Canadian                
provinces and territories.                                                         
                                                                                   
The overarching README file of the datamart itself can be found here:              
http://dd.weatheroffice.gc.ca/about_dd_apropos.txt      


##############################################
###              License                   ###
##############################################

For the terms of use and conditions of the Scribe Nowcasting Weather               
Matrices created by Environment Canada, see the general datamart license           
at:                                                                                
http://dd.weatheroffice.gc.ca/doc/LICENCE_GENERAL.txt   


###############################################
###              Download                   ###
###############################################

The Scribe Nowcasting Weather Elements data are available at the following         
address:                                                                           
http://dd.weatheroffice.gc.ca/nowcasting/matrices/   


################################################
###       Description                        ###
################################################

The Scribe Nowcasting Weather Elements Data files contain a consistent set
of observed and forecasted weather elements for the short term and for a
number of forecast points generally corresponding to observation stations.
They are updated every hour. 

There are over 450 forecast points in the file. Hourly surface
observations (METAR, SPECI) and synoptic messages are processed as well as
Lightning observations. Numerical Weather Prediction models, Statistical 
models and Nowcasting systems are used in conjunction with the
observations to produce a very short term forecast.


################################################
###                 Data                     ###
################################################

Example of a Nowcasting matrix followed by it's content description.

Columns no.:
|  1    |  2 | 3 | 4 |  5  | 6|   7  | 8 |  9  | 10| 11| 12 | 13|  14 |  15 |16 | 17| 18|  19 |20|  
-------------------------------------------------------------------------------------------------|
 
STN: CYYZ    |SKY|CIG|        PRECIPITATION        |POP|   ACC  |    TEMP   |    WIND   |  VIS   |
DATE      HR |/10|   |PCPN1|POP|PCPN2|POP|PCPN3|POP|   | Qp | Tp|  T  |  Td | DD| VV|GST|(SM) |TP|
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0200| 10| 41| -S  |100|     |  0|     |  0|100| 0.2| SN| -6.0| -8.0|200| 22| 33| 2.00|PP|
20040122 0300| 10| 24| -S  |100|     |  0|     |  0|100| 0.2| SN| -6.0| -7.0|200| 15|   | 1.75|PP|
20040122 0400| 10| 23| -S  |100|     |  0|     |  0|100| 0.2| SN| -5.0| -6.0|200| 17|   | 2.50|PP|
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0500|  9| 25| -S  |100|     |  0|     |  0| 90| 0.0|   | -5.0| -6.0|206| 17|   | 7.98|  |
20040122 0600|  9| 87|     |  0|     |  0|     |  0|  0| 0.0|   | -5.0| -6.0|190| 11|   |12.00|  |
20040122 0700| 10| 50| -S  |100|     |  0|     |  0|100| 0.0|   | -4.0| -6.0|185|  9|   | 6.75|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0800| 10| 88| -S  |100|     |  0|     |  0| 80| 0.0|   | -3.0| -5.0|203| 17|   |10.21|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0900|  9|999| -SW |100|     |  0|     |  0| 60| 0.0|   | -2.7| -5.1|221| 18| 29|15.00|  |
20040122 1000|  9|999| -SW |100|     |  0|     |  0| 60| 0.0|   | -3.8| -7.2|229| 24| 34|15.00|  |
20040122 1100|  9|999| -SW |100|     |  0|     |  0| 30| 0.0|   | -4.8| -7.5|236| 30| 40|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1200|  9|999|     |  0|     |  0|     |  0|  8| 0.0|   | -5.9| -8.6|242| 36| 46|15.00|  |
20040122 1300|  9|999|     |  0|     |  0|     |  0| 11| 0.0|   | -5.9| -8.7|252| 38| 48|15.00|  |
20040122 1400|  9|999|     |  0|     |  0|     |  0| 15| 0.0|   | -6.0| -8.8|261| 39| 49|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1500|  9|999|     |  0|     |  0|     |  0| 16| 0.0|   | -6.0| -9.4|270| 41| 51|15.00|  |
20040122 1600|  9|999|     |  0|     |  0|     |  0| 22| 0.0|   | -6.0|-10.0|274| 41| 51|15.00|  |
20040122 1700|  9|999| -S  |100|     |  0|     |  0| 80| 0.2| SN| -6.0|-10.0|278| 41| 51|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1800| 10|999| -S  |100|     |  0|     |  0|100| 0.5| SN| -6.0|-10.0|282| 41| 51|15.00|  |
20040122 1900|  9|999| -S  |100|     |  0|     |  0| 80| 0.4| SN| -6.7|-10.8|281| 41| 51|15.00|  |
20040122 2000|  9|999| -S  |100|     |  0|     |  0| 80| 0.2| SN| -7.3|-11.7|279| 40| 50|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+ 


In this example the data sequence begins at 02Z with six hours of                  
observations before the run time 08Z, and ends 12 hours later at 20Z, for          
a total of 19 hours (6 hours of past observations, plus the current                
observation (run time) followed by 12 hours of forecast data.   

Looking at columns from left to right: 

Column no.

1 & 2: The first two columns identify the date and time. The current run time
       is the 7th line of the matrix (the one between the two dashed lines)

3 & 4: Column 3 gives the sky cover in tenths, and column 4 the ceiling height in hundreds of feet. 
       If no ceiling is forecasted the code "999" will be used. Note that this ceiling 
       value is there only for technical reasons and is not very reliable, certainly not for 
       aviation forecast.

5, 6 ,7 ,8 ,9, 10 : These six columns represent the precipitation types and related
       probability of occurrence, which should not be confused with the total (global) probability 
       of precipitation or POP in column 11. The precipitation type probability give the probability 
       of occurrence of this type, in this example only snow is observed and forecast, 
       with a probability of 100%. Total value should not exceed 100%.

        The following Scribe Nowcasting precipitation type codes are possible :
        (F): forecasted    (O): observed

        Rain Showers       RW  (F & O)
        Rain               R   (F & O) 
        Snow Showers       SW  (F & O)
        Snow               S   (F & O)
        Drizzle            L   (F & O)
        Freezing Rain      ZR  (F & O)
        Freezing Drizzle   ZL  (F & O)
        Ice Pellet Shower  IPW (F & O)
        Ice Pellet         IP  (F & O)
        Thunder            T   (F & O)
        Hail               H   (F & O)
        Not Available      NA  (F & O)         

        Intensity of precipitation given by:
        (-) very light to light
        ( ) (no sign) moderate
        (+) heavy

11:    Column 11 identified "POP" is the all types together probability of precipitation. In the observations 
       section, i.e. from 02Z to 07Z the POP observed could be les then 100%. In other words, 
       although if it is not precipitating at the station, a POP may exist du to some observed 
       information such as "vicinity showers" convective clouds, radar echoes or lightning around the station. 

12, 13 : The next two columns refer to the precipitation quantity, in mm/hr of water (or cm/hr for snow) 
       and the type of precipitation corresponding to this accumulation. In the example a total of 0.6 cm 
       of snow (not mm since it is snow) accumulated from 02Z to 04Z included, and a snow amount forecast 
       of 1.3 cm from 17Z to 20Z included. Only the dominant (higher POP type) precipitation type of 
       the possible 3 will be considered for the precipitation accumulated during a given hour.

14, 15 : These two columns contain the temperature and the dew point observations and forecasts; 

16, 17 ,18 : The  next three columns are dedicated to the wind: direction, speed (km/h) and gust (km/h).  

19, 20: The last two columns indicate the visibility (a reference distance value in nautical miles) 
        and the type of obstacle to visibility.  The observed values represent the visibility reported 
        in the METAR-SPECI. The forecasted visibilities use a predefined set of values corresponding 
        to visibility categories, e.g. poor are 0.3 or 0.5, average are 1.0
        and 3.0, and good are 9.0 or 15.0. An obstacle will be put for visibility lower than 6 miles, 
        observed or forecasted.

        The following visibility Scribe Nowcasting codes are possible :
        (F): forecasted    (O): observed

        Precipitation  PP (F & O)
        Fog            FG (F & O) 
        Fog banks      BF (F & O)
        Mist           BR (F & O)
        Risk Fog       RF (F)
        Ice Fog        IF (F & O)
        Blowing snow   BS (F & O)
        Drifting snow  DS (F & O)
        Haze           HZ (F & O)
        Smoke          FU (F & O)
        Blowing dust   BD (F & O)
        Not Available  NA (F & O)         



###############################################
###              Filename                   ###
###############################################

The Scribe Nowcasting Matrices file are using the following 
File nomenclature: 
SCRIBE.NWCSTG.MM.DD.HHZ.n.Z

where:
* SCRIBE.NWCNTG: Constant string. Means 'Scribe Nowcasting'.
* MM.DD.HHZ:  MM: Month, DD: date. HH: Run Time UST Z: UTC identification
* n: Constant string
* Z: Compress software file extension. See the web page of the program
 for more information
 http://pubs.opengroup.org/onlinepubs/9699919799/utilities/compress.html

ex. 'SCRIBE.NWCSTG.10.24.06Z.n.Z' is the SCRIBE Nowcasting file for October
24th at 06Z compressed.


###############################################
###        Station's code                   ###
###############################################

The station's codes and name correspondence is located at the end of the  
French section, at the end of this README file.


###############################################
###             Contact Us                  ###
###############################################

If you use the data available on the datamart, you are invited to
subscribe to the datamart's mailing list in order to be warned of any
updates or changes regarding the data available. You can subscribe here:
http://lists.cmc.ec.gc.ca/mailman/listinfo/dd_info

and once you are registered, please use that list to contact us through:
dd_info@lists.ec.gc.ca
for any comments or questions



----------------------------------------


                     README Matrices Scribe de prévision immédiates
 

ENVIRONNEMENT CANADA

Fichier README sur les  Matrices Scribe de Prévision Immédiates disponibles 
sur le serveur de données HTTP du Service météorologique du Canada.                                                                                                     

Pour lire le présent fichier en ligne, visitez l'adresse :                                                     
http://dd.meteo.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt

Les fichiers sont produits ou distribués par Environnement Canada :                                            
http://ec.gc.ca/                                                                                               

-------------------------------------------------------
Version du 2014-10-14
-------------------------------------------------------

Dans ce fichier :
* À propos
* Licence
* Téléchargement
* Description
* Données
* Nom de fichiers
* Pour nous joindre
* Code des stations

##############################################
###              À propos                  ###
##############################################

Le présent document décrit les matrices Scribe de prévisions immédiates
produites pour un nombre determiné de sites d'observation pour les 
provinces et les territoires canadiens. 

Le fichier README global pour le datamart peut être trouvé ici:
http://dd.meteo.gc.ca/about_dd_apropos.txt


##############################################
###       Licence                          ###
##############################################

Pour connaître les conditions d'utilisation des matrices Scribe de                 
prévisions immédiates créées par Environnement Canada, consultez les               
conditions générales d'utilisation du dépôt de données :                           
http://dd.meteo.gc.ca/doc/LICENCE_GENERAL.txt   


###############################################
###       Téléchargement                    ###
###############################################

Les matrices Scribe de prévisions immédiates sont disponibles à l'adresse:         
http://dd.meteo.gc.ca/nowcasting/matrices/  


################################################
###       Description                        ###
################################################

Le dossier http://dd.meteo.gc.ca/nowcasting/matrices/ contient                                     
les fichiers de matrices de prévisions immédiates. Ces matrices sont
mise à jour à chaque heure et contiennent un ensemble cohérent d'éléments
du temps observés et prévus à très court terme pour des points de prévision
correspondant généralement à des sites de stations d'observation. Il y a plus de 450 
points de prévision dans le fichier. Les observations horaires de surface
(METAR-SPECI) et synoptiques sont traitées ainsi que les observations de foudre.
On utilise des modèles de prévision numérique du temps, 
des modèles statistiques ainsi que des systèmes de prévisions immédiates de pair avec
les observations pour préparerles données prévues. 
################################################                                                               
###              Données                     ###                                                               
################################################


Exemple et description du contenu d'une matrice de prévision immédiate.

Colonne no.:
|  1    |  2 | 3 | 4 |  5  | 6|   7  | 8 |  9  | 10| 11| 12 | 13|  14 |  15 |16 | 17| 18|  19 |20|  
-------------------------------------------------------------------------------------------------|
 
STN: CYYZ    |SKY|CIG|        PRECIPITATION        |POP|   ACC  |    TEMP   |    WIND   |  VIS   |
DATE      HR |/10|   |PCPN1|POP|PCPN2|POP|PCPN3|POP|   | Qp | Tp|  T  |  Td | DD| VV|GST|(SM) |TP|
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0200| 10| 41| -S  |100|     |  0|     |  0|100| 0.2| SN| -6.0| -8.0|200| 22| 33| 2.00|PP|
20040122 0300| 10| 24| -S  |100|     |  0|     |  0|100| 0.2| SN| -6.0| -7.0|200| 15|   | 1.75|PP|
20040122 0400| 10| 23| -S  |100|     |  0|     |  0|100| 0.2| SN| -5.0| -6.0|200| 17|   | 2.50|PP|
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0500|  9| 25| -S  |100|     |  0|     |  0| 90| 0.0|   | -5.0| -6.0|206| 17|   | 7.98|  |
20040122 0600|  9| 87|     |  0|     |  0|     |  0|  0| 0.0|   | -5.0| -6.0|190| 11|   |12.00|  |
20040122 0700| 10| 50| -S  |100|     |  0|     |  0|100| 0.0|   | -4.0| -6.0|185|  9|   | 6.75|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0800| 10| 88| -S  |100|     |  0|     |  0| 80| 0.0|   | -3.0| -5.0|203| 17|   |10.21|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 0900|  9|999| -SW |100|     |  0|     |  0| 60| 0.0|   | -2.7| -5.1|221| 18| 29|15.00|  |
20040122 1000|  9|999| -SW |100|     |  0|     |  0| 60| 0.0|   | -3.8| -7.2|229| 24| 34|15.00|  |
20040122 1100|  9|999| -SW |100|     |  0|     |  0| 30| 0.0|   | -4.8| -7.5|236| 30| 40|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1200|  9|999|     |  0|     |  0|     |  0|  8| 0.0|   | -5.9| -8.6|242| 36| 46|15.00|  |
20040122 1300|  9|999|     |  0|     |  0|     |  0| 11| 0.0|   | -5.9| -8.7|252| 38| 48|15.00|  |
20040122 1400|  9|999|     |  0|     |  0|     |  0| 15| 0.0|   | -6.0| -8.8|261| 39| 49|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1500|  9|999|     |  0|     |  0|     |  0| 16| 0.0|   | -6.0| -9.4|270| 41| 51|15.00|  |
20040122 1600|  9|999|     |  0|     |  0|     |  0| 22| 0.0|   | -6.0|-10.0|274| 41| 51|15.00|  |
20040122 1700|  9|999| -S  |100|     |  0|     |  0| 80| 0.2| SN| -6.0|-10.0|278| 41| 51|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+
20040122 1800| 10|999| -S  |100|     |  0|     |  0|100| 0.5| SN| -6.0|-10.0|282| 41| 51|15.00|  |
20040122 1900|  9|999| -S  |100|     |  0|     |  0| 80| 0.4| SN| -6.7|-10.8|281| 41| 51|15.00|  |
20040122 2000|  9|999| -S  |100|     |  0|     |  0| 80| 0.2| SN| -7.3|-11.7|279| 40| 50|15.00|  |
-------------+---+---+-----+---+-----+---+-----+---+---+----+---+-----+-----+---+---+---+-----+--+ 

Dans cet exemple la séquence de données commence à 02Z puis est suivie par 6
heures d'observations précédentes l'heure de la passe 08Z, puis se termine 12
heures plus tard à 20Z, pour totaliser 19 heures de données (6 heures de
données passées, plus l'heure courante d'observation (moment de la passe) et
12 heures de données prévues)
 
Description des colonnes de gauche à droite.

Colonne no.

1 & 2: Les deux premières colonnes donne la date et l'heure. Le moment de la
       passe courante est la 7e ligne de la matrice (celle entre les deux lignes en pointillés)

3 & 4: la colonne 3 donne la nébulosité du ciel en dixièmes, et la colonne 4
       la hauteur du plafond en  centaines de pieds. Si aucun plafond n'est prévu le code «999» 
       sera utilisé. Notez que cette valeur du plafond est là seulement pour des raisons techniques et 
       n'est pas très fiable, certainement pas pour la prévision a l'aviation.

5, 6, 7, 8, 9, 10: Ces six colonnes représentes les types de précipitations
       avec leur probabilité d'occurrence, qui ne doit pas être confondu avec la
       probabilité globale des précipitations située dans la colonne 11 (POP). 
       La probabilité de précipitations du type donne la probabilité
       d'occurrence de ce type, dans l'exemple, seulement de la neige et des
       averses de neige sont observées et les prévues, avec une probabilité
       de 100%. La valeur totale sera jamais plus grande que 100%.

        (P): prévue    (O): observée

        Averses de pluie   RW  (P & O)
        Pluie              R   (P & O) 
        Averses de neige   SW  (P & O)
        Neige              S   (P & O)
        Bruine             L   (P & O)
        Pluie verglaçante  ZR  (P & O)
        Bruine verglaçant  ZL  (P & O)
        Averse de grésil   IPW (P & O)
        Grésil             IP  (P & O)
        Tonner             T   (P & O)
        Grêle              H   (P & O)
        Non disponible     NA  (P & O)

        l'intensité des précipitations est donnée par:
        (-) très faible à faible
        ( ) (pas de signe) modérée
        (+) Forte

11:     la colonne 11, nommée "POP", représente la probabilité de précipitations de tous les types 
        ensemble. Dans la section des observations, à savoir de 02Z à 07Z la POP observées pourraient 
        être inférieure à 100%. En d'autres termes, même s'il ne précipite pas à la station, un POP peut 
        exister si certaines informations existent dans les observations telles que
        "averses dans le voisinage", présence suffisante de nuages convectifs dans le METAR, échos radar ou 
        foudre autour de la station.

12, 13: Les deux colonnes suivantes se réfèrent à la quantité de précipitations, en mm/h d'eau (ou cm/h pour la neige)
        et au type de précipitations correspondant à cette accumulation. Dans l'exemple, un total de 0,6 cm
        de neige (pas des mm ici car il qu'il neige) accumulées de 02Z à 04Z est observé, et une accumulation de la neige 
        de 1,3 cm est prévue de 17Z à 20Z. Seul le type dominant de précipitations (type qui a le POP supérieur) des
        3 types possibles sera considéré pour l'accumulées pendant une heure donnée.

14, 15: Ces deux colonnes contiennent la température et le point de rosée observations et prévus;

16, 17, 18: Les trois colonnes suivantes sont dédiées au vent: la direction, la vitesse (km/h) et les rafales (km/h).

19, 20: Les deux dernières colonnes donnent la visibilité (une valeur de distance de référence en miles nautiques)
        et le type d'obstacle à la visibilité. Les valeurs observées représentent la visibilité signalée
        dans le METAR SPECI. Les visibilités prévues utilisent un ensemble prédéfini de valeurs correspondant
        à des catégories de visibilité, par exemple les faibles visibilités
        correspondent à des visibilités de 0.3 ou 0.5 mn, les visibilités passables
        sont de 1.0 et 3.0 mn et les bonnes visibilités sont de 9.0 et plus.
        Un obstacle accompagnera une visibilité inférieure à 6 miles, observés ou prévus

        Le code des types possibles de visibilité utilisés dans les
        matrices de prévisions immédiates sont:
        (P): prévue    (O): observée

        Dans les précipitations PP (F & O)
        Brouillard              FG (F & O) 
        Bancs de Brouillard     BF (F & O)
        Brume                   BR (F & O)
        Risque de Brouillard    RF (F)
        Brouillard glacé        IF (F & O)
        Poudrerie               BS (F & O)
        Poudrerie basse         DS (F & O)
        Brume sèche             HZ (F & O)
        Fumée                   FU (F & O)
        Chasse Poussière        BD (F & O) 
        Non disponible          NA (F & O)         


##############################################
###       Noms de fichier                  ###
##############################################

Les fichiers de matrices Nowcasting utilisent la nomenclature suivante:
SCRIBE.NWCSTG.MM.DD.HHZ.n.Z 

où:
* SCRIBE.NWCSTG: Chaîne de caractères constante. Signifie 'Scribe Nowcasting'
* MM.DD.HHZ: 
* n: chaîne de caractères constante
* Z: Extension du logiciel Compress. Voir la page web du logiciel pour plus 
 d'information
 http://pubs.opengroup.org/onlinepubs/9699919799/utilities/compress.html

ex. 'SCRIBE.NWCSTG.10.24.06Z.n.Z' représente le fichier de prévision 
immédiate pour le 24 octobre à 06Z.


##############################################
###       Pour nous joindre                ###
##############################################

Si vous utilisez les données disponibles sur le datamart, vous êtes
invités à vous inscrire à la liste de diffusion du datamart afin d'être
avertis de tout changement ou mise à jour sur les données disponibles.
Vous pouvez vous inscrire ici
http://lists.cmc.ec.gc.ca/mailman/listinfo/dd_info

Une fois enregistré, vous pouvez nous contacter à cette adresse pour
toute question ou commentaire:
dd_info@lists.ec.gc.ca


##############################################
###       Code des stations                ###
##############################################

ID   SYN   NOM                       LAT   LON     ELEV
 ABF 71152 BURGEO_(AU8)              47.62  -57.62   11
 ABR 71325 BEDFORD_RANGE_(AU7)       44.75  -63.67   10
 ABT 71666 BOUCTOUCHE_CDA_CS_(AU8)   46.42  -64.77   36
 ADN 71038 DOAKTOWN_AUTO_RCS_CA      46.58  -66.02   43
 AFY 71191 FUNDY_PARK_(ALMA)_CS_(AU7 45.60  -64.95   43
 AKC 71670 KOUCHIBOUGUAC_CS_(AU7)    46.77  -65.00   34
 AMR 71856 MILLERTOWN_RCS_CA         48.82  -56.53  204
 AMS 71787 MECHANIC_SETTLEMENT_(AU8) 45.68  -65.15  404
 APR 71493 PARRSBORO_(AU8)           45.40  -64.33   31
CACP 71920 BACCARO_PT_(AU8)          43.45  -65.47    6
CACQ 71744 MIRAMICHI_RCS_(AU8)       47.00  -65.45   34
CAJT 71159 STEPHENVILLE_RCS_(AU8)    48.55  -58.55   59
CAOH 71753 UPPER_STEWIACKE_RCS_(AU8) 45.22  -63.05   25
CARP 71634 RED_PINES_CA              47.43  -65.58  124
CGKL 71828 SCHEFFERVILLE_(AU8)       54.80  -66.80  517
CMGB 71000 GRANBY_CA                 45.37  -72.77   86
CMMY 71737 SAINT-MICHEL-DES-SAINTS   46.82  -74.10  430
CMSI 71967 SAINT-GERMAIN-DE-GRANTHAM 45.82  -72.53   85
CTBT 71694 BEATRICE_CLIMATE_(AU8)    45.13  -79.40  297
CTPM 71196 PEMBROKE_CLIMATE_CA       45.87  -77.25  162
CWAE 71000 WHISTLER                  50.13 -122.95  658
CWCA 71818 CARTWRIGHT                53.70  -57.03   15
CWCL 71474 CLINTON_(AU5)             51.13 -121.50 1057
CWDL 71958 DEASE_LAKE_CA             58.42 -130.03  807
CWEU 71917 EUREKA                    79.98  -85.93   10
CWFD 71094 CAPE_DYER_(AU5)           66.65  -61.38  725
CWGZ 71000 GRISE_FIORD               76.42  -82.90   41
CWIL 71084 HAT_ISLAND_(AUT)          68.32 -100.08   36
CWKM 71046 KUK_BEACH_(AU5)           69.60 -140.18   13
CWKW 71176 CAPE_KAKKIVIAK_(AUT)      59.98  -64.15  551
CWLI 71960 LIVERPOOL_BAY_(AU5)       69.60 -130.90  102
CWLX 71091 LONGSTAFF_BLUFF_(AUT)     68.88  -75.13  162
CWLY 71891 LYTTON_(AU5)              50.22 -121.57  225
CWNS 71000 NORTHEAST_MARGAREE_(AU8)  46.37  -60.98   54
CWOB 71097 BREVOORT_ISLAND_(AU5)     63.33  -64.13  376
CWPX 71064 CAPE_PEEL_WEST_(AUT)      69.03 -107.82  165
CWRF 71918 CAM_FOUR_(AU5)            68.43  -89.72  325
CWRH 71972 RESOLUTION_ISLAND_(AU5)   61.60  -64.63  369
CWRX 71088 ROWLEY_ISLAND_(AUT)       69.08  -79.03   41
CWSA 71600 SABLE_ISLAND_(WS2)        43.93  -60.02    4
CWSW 71000 SPARWOOD                  49.75 -114.88 1138
CWTU 71179 TUKIALIK_BAY_(AUT)        54.70  -58.35  683
CWTY 71724 TROIS_RIVIERES_(AU8)      46.35  -72.50    6
CWUP 71093 CAPE_HOOPER_(AU5)         68.47  -66.80  393
CWUW 71092 DEWAR_LAKES_(AU5)         68.65  -71.17  527
CWVD 71096 FOX_FIVE_(AU5)            67.53  -63.78  581
CWWU 71000 LONG_POND                 47.52  -52.98   13
CWXR 71059 CROKER_RIVER_(AUT)        69.27 -119.22   69
CWYK 71177 CAPE_KIGLAPAIT_(AUT)      57.13  -61.47  834
CWYM 71975 CAPE_MERCY_(AU5)          64.95  -63.58  583
CWZZ 71335 SAGLEK_(AU5)              58.33  -62.58  516
CYAB 71000 ARCTIC_BAY_CA             73.00  -85.03   22
CYAD 71000 LA_GRANDE_III             53.57  -76.20  236
CYAH 71003 LA_GRANDE_IV_CA           53.75  -73.68  306
CYAM 71260 SAULT_STE_MARIE           46.48  -84.50  195
CYAS 71000 KANGIRSUK                 60.02  -70.00  117
CYAW 71601 SHEARWATER                44.63  -63.50   44
CYAY 71819 ST._ANTHONY_NL_(NCA)      51.38  -56.10   33
CYAZ 71106 TOFINO                    49.08 -125.78   22
CYBB 71000 KUGAARUK                  68.53  -89.82   17
CYBC 71691 BAIE-COMEAU               49.12  -68.20   21
CYBD 71206 BELLA_COOLA               52.38 -126.60   40
CYBG 71727 BAGOTVILLE                48.33  -71.00  159
CYBK 71926 BAKER_LAKE                64.28  -96.07   18
CYBL 71205 CAMPBELL_RIVER            49.95 -125.27  108
CYBN 71534 BORDEN_AWOS_(AU5)         44.27  -79.90  222
CYBR 71140 BRANDON                   49.92  -99.95  409
CYBU 71130 NIPAWIN                   53.33 -104.00  373
CYBV 71000 BERENS_RIVER              52.37  -97.02  224
CYBW 71860 SPRINGBANK                51.10 -114.37 1201
CYBX 71808 BLANC_SABLON_(CON)        51.45  -57.18   37
CYCB 71925 CAMBRIDGE_BAY             69.10 -105.13   31
CYCD 71000 NANAIMO                   49.05 -123.87   34
CYCG 71884 CASTLEGAR                 49.30 -117.63  505
CYCO 71938 KUGLUKTUK                 67.82 -115.13   23
CYCP 71883 BLUE_RIVER                52.12 -119.28  681
CYCQ 71000 CHETWYND                  55.70 -121.63  610
CYCS 71000 CHESTERFIELD_INLET        63.33  -90.72   10
CYCX 71701 GAGETOWN_(WSD)            45.83  -66.43   51
CYCY 71090 CLYDE_(AU5)               70.48  -68.52   27
CYDA 71000 DAWSON                    64.05 -139.13  370
CYDB 71001 BURWASH_(AUT)             61.37 -139.03  805
CYDC 71000 PRINCETON                 49.47 -120.52  698
CYDF 71809 DEER_LAKE                 49.22  -57.40   29
CYDL 71686 DEASE_LAKE_CA             58.42 -130.03  803
CYDN 71036 DAUPHIN_(NCA)             51.10 -100.05  304
CYDP 71902 NAIN                      56.55  -61.68    7
CYDQ 71471 DAWSON_CREEK_CA           55.73 -120.17  655
CYED 71121 EDMONTON_NAMAO_(AU5)      53.67 -113.47  688
CYEG 71123 EDMONTON_INT              53.32 -113.58  723
CYEK 71812 ARVIAT_(AU5)              61.10  -94.07   10
CYEL 71268 ELLIOT_LAKE               46.35  -82.55  330
CYEN 71862 ESTEVAN                   49.22 -102.97  581
CYER 71099 FORT_SEVERN_(AU5)         56.02  -87.67   16
CYET 71167 EDSON_(NCA)               53.57 -116.45  926
CYEV 71957 INUVIK_AWOS               68.30 -133.48   68
CYFB 71909 IQALUIT                   63.75  -68.55   34
CYFC 71700 FREDERICTON               45.87  -66.53   21
CYFO 71000 FLIN_FLON                 54.68 -101.68  304
CYFR 71000 FORT_RESOLUTION           61.18 -113.68  160
CYFS 71946 FORT_SIMPSON              61.75 -121.23  170
CYFT 71000 MAKKOVIK                  55.08  -59.18   71
CYGE 71000 GOLDEN                    51.30 -116.98  787
CYGH 71000 FORT_GOOD_HOPE            66.23 -128.65   82
CYGK 71620 KINGSTON                  44.22  -76.60   93
CYGL 71827 LA_GRANDE_RIVIERE         53.63  -77.70  195
CYGP 71188 GASPE                     48.77  -64.47   33
CYGQ 71834 GERALDTON                 49.77  -86.92  349
CYGR 71709 ILES_DE_LA_MADELEINE      47.42  -61.78   18
CYGT 71000 IGLOOLIK                  69.37  -81.82   53
CYGV 71584 HAVRE_ST._PIERRE          50.27  -63.60   37
CYGW 71000 KUUJJUARAPIK              55.28  -77.75   10
CYGX 71912 GILLAM                    56.35  -94.70  145
CYHA 71000 QUAQTAQ                   61.05  -69.62   32
CYHD 71527 DRYDEN_REGIONAL_CA        49.82  -92.73  412
CYHE 71187 HOPE_(AU5)                49.37 -121.50   39
CYHH 71000 NEMISCAU                  51.70  -76.12  245
CYHI 71000 ULUKHAKTOK                70.77 -117.80   36
CYHK 71000 GJOA_HAVEN                68.63  -95.85   47
CYHM 71263 HAMILTON_(NCH)            43.17  -79.93  238
CYHU 71371 MONTREAL/ST_HUBERT_(NCA)  45.52  -73.42   27
CYHY 71935 HAY_RIVER                 60.83 -115.77  166
CYHZ 71395 HALIFAX_INTL_AIRPORT      44.88  -63.52  158
CYIK 71000 IVUJIVIK                  62.42  -77.95   42
CYIO 71095 POND_INLET_(AU5)          72.68  -77.97   62
CYIV 71145 ISLAND_LAKE               53.85  -94.65  235
CYJF 71000 FORT_LIARD                60.23 -123.47  215
CYJT 71815 STEPHENVILLE              48.53  -58.55   26
CYKA 71887 KAMLOOPS                  50.70 -120.43  345
CYKD 71000 AKLAVIK_(AUT)             68.22 -135.00    6
CYKF 71368 KITCHENER/WATERLOO        43.45  -80.38  321
CYKG 71000 KANGIQSUJUAK              61.58  -71.93  156
CYKJ 71499 KEY_LAKE_(AU5)            57.25 -105.62  513
CYKL 71921 SHEFFERVILLE_CA           54.80  -66.80  521
CYKO 71000 AKULIVIK_(AUT)            60.82  -78.15   23
CYKQ 71000 WASKAGANISH               51.48  -78.75   26
CYKY 71129 KINDERSLEY                51.52 -109.18  694
CYKZ 71639 TORONTO_BUTTONVILLE       43.85  -79.37  204
CYLA 71000 AUPALUK                   59.30  -69.60   34
CYLC 71000 KIMMIRUT_(LAKE_HARBOUR)   62.85  -69.88   52
CYLD 71642 CHAPLEAU                  47.82  -83.33  447
CYLJ 71125 MEADOW_LAKE               54.13 -108.52  481
CYLK 71000 LUTSELK'E_(AUT)           62.42 -110.68  179
CYLL 71871 LLOYDMINSTER_(NCA)        53.32 -110.07  668
CYLT 71000 ALERT_AIRPORT_CA          82.52  -62.28   31
CYLU 71000 KANGIQSUALUJJUAQ          58.72  -65.98   60
CYLW 71203 KELOWNA_AWOS_(NCA)        49.95 -119.37  433
CYMA 71965 MAYO                      63.62 -135.87  504
CYMH 71817 MARY'S_HARBOUR_(AU5)      52.30  -55.83   12
CYMJ 71864 MOOSE_JAW                 50.33 -105.55  577
CYMM 71689 FORT_MCMURRAY_CA          56.65 -111.22  369
CYMO 71398 MOOSONEE                  51.28  -80.60    9
CYMT 71822 CHIBOUGAMAU-CHAPAIS_(AU5) 49.77  -74.53  387
CYMU 71000 UMIUJAQ                   56.53  -76.52   76
CYMX 71626 MONTREAL_MIRABEL_INT      45.68  -74.00   79
CYNA 71513 NATASHQUAN                50.18  -61.78   11
CYNC 71000 WEMINDJI                  53.02  -78.83   20
CYND 71000 GATINEAU                  45.52  -75.57   64
CYNE 71410 NORWAY_HOUSE_CA           53.95  -97.83  223
CYNM 71947 MATAGAMI_(NCA)            49.77  -77.80  280
CYOA 71000 EKATI_(KOALA)             64.70 -110.62  469
CYOC 71000 OLD_CROW                  67.57 -139.83  251
CYOD 71120 COLD_LAKE                 54.42 -110.28  541
CYOJ 71066 HIGH_LEVEL                58.62 -117.15  338
CYOO 71697 OSHAWA_(NCA)              43.92  -78.88  140
CYOW 71628 OTTAWA_INT'L_CA_(NCH)     45.32  -75.67  114
CYOY 71000 VAL_CARTIER_CA            46.90  -71.50  168
CYPA 71869 PRINCE_ALBERT             53.22 -105.67  428
CYPC 71000 PAULATUK                  69.35 -124.07    7
CYPD 71041 PORT_HAWKSBURY            45.65  -61.37  115
CYPE 71068 PEACE_RIVER               56.22 -117.43  571
CYPG 71851 PORTAGE_SOUTHPORT_(AU8)   49.90  -98.28  273
CYPH 71306 INUKJUAK_CA               58.47  -78.08   25
CYPL 71845 PICKLE_LAKE               51.43  -90.22  386
CYPQ 71436 PETERBOROUGH_CA           44.22  -78.35  191
CYPR 71022 PRINCE_RUBERT             54.28 -130.45   35
CYPW 71208 POWELL_RIVER              49.83 -124.50  121
CYPX 71000 PUVIRNITUQ                60.05  -77.28   25
CYPY 71305 FORT_CHIPEWYAN_CA_(NCA)   58.77 -111.12  238
CYQA 71532 MUSKOKA_AWOS_(AU5)        44.97  -79.30  282
CYQB 71708 QUEBEC/JEAN_LESAGE_INTNL  46.80  -71.38   73
CYQD 71867 THE_PAS                   53.97 -101.10  275
CYQF 71878 RED_DEER                  52.17 -113.88  905
CYQG 71538 WINDSOR                   42.27  -82.95  195
CYQH 71953 WATSON_LAKE               60.12 -128.82  687
CYQI 71603 YARMOUTH                  43.82  -66.08   43
CYQK 71850 KENORA                    49.78  -94.37  410
CYQL 71267 LETHBRIDGE_AC             49.62 -112.78  929
CYQM 71705 MONCTON                   46.10  -64.68   71
CYQQ 71893 COMOX                     49.72 -124.90   26
CYQR 71863 REGINA_(AU5)              50.43 -104.67  577
CYQT 71749 THUNDER_BAY_(AU5)         48.37  -89.32  206
CYQU 71940 GRANDE_PRAIRIE            55.17 -118.88  672
CYQV 71292 YORKTON_(NCA)             51.27 -102.47  497
CYQW 71876 NORTH_BATTLEFORD_(AU5)    52.77 -108.25  544
CYQX 71803 GANDER_INT.               48.93  -54.57  158
CYQY 71707 SYDNEY                    46.17  -60.03   72
CYQZ 71103 QUESNEL_AWOS_(AU5)        53.02 -122.50  543
CYRA 71000 GAMETI                    64.12 -117.32  220
CYRB 71924 RESOLUTE_CARS             74.72  -94.98   68
CYRJ 71728 ROBERVAL                  48.52  -72.27  179
CYRL 71854 RED_LAKE                  51.07  -93.78  386
CYRT 71083 RANKIN_INLET              62.80  -92.12   32
CYRV 71685 REVELSTOKE_CA_(NCA)       50.97 -118.18  444
CYSB 71730 SUDBURY                   46.63  -80.80  352
CYSC 71000 SHERBROOKE_CA             45.43  -71.68  241
CYSD 71128 SUFFIELD                  50.27 -111.18  770
CYSF 71132 STONY_RAPIDS              59.25 -105.83  245
CYSJ 71609 SAINT_JOHN                45.32  -65.88  111
CYSK 71000 SANIKILUAQ                56.53  -79.25   34
CYSL 71703 ST_LEONARD                47.15  -67.82  242
CYSM 71934 FORT_SMITH                60.02 -111.95  205
CYSN 71262 ST_CATHARINES             43.20  -79.17   98
CYSP 71000 MARATHON                  48.75  -86.35  316
CYSY 71000 SACHS_HARBOUR             72.00 -125.27   90
CYTE 71910 CAPE_DORSET_(AU5)         64.23  -76.53   48
CYTH 71079 THOMPSON                  55.80  -97.85  223
CYTL 71675 BIG_TROUT_LAKE_CA         53.82  -89.90  222
CYTQ 71000 TASIUJAQ                  58.67  -69.95   37
CYTR 71621 TRENTON_(WOD/AU5)         44.12  -77.53   86
CYTS 71739 TIMMINS_VICTOR_POWER      48.57  -81.38  298
CYTZ 71265 BILLY_BISHOP_TORONTO_CITY 43.63  -79.40   77
CYUA 71968 SHINGLE_POINT_(AU5)       68.95 -137.22   49
CYUB 71000 TUKTOYAKTUK               69.43 -133.03    5
CYUL 71627 MONTREAL/PIERRE_E_TRUDEAU 45.47  -73.75   36
CYUS 71911 SHEPHERD_BAY_(AU5)        68.82  -93.43   43
CYUT 71000 REPULSE_BAY               66.52  -86.22   23
CYUX 71081 HALL_BEACH_(AU5)          68.78  -81.25    9
CYUY 71000 ROUYN                     48.22  -78.83  301
CYVC 71922 LA_RONGE                  55.15 -105.27  379
CYVM 71338 QIKIQTARJUAQ              67.55  -64.03    6
CYVO 71941 VAL_D'_OR_CA              48.05  -77.77  337
CYVP 71906 KUUJJUAQ                  58.10  -68.42   39
CYVQ 71043 NORMAN_WELLS              65.27 -126.80   78
CYVR 71892 VANCOUVER_INT'L           49.18 -123.17    5
CYVT 71000 BUFFALO_NARROWS           55.85 -108.42  434
CYVV 71633 WIARTON                   44.75  -81.10  222
CYWA 71625 PETAWAWA_(AU5)            45.95  -77.32  130
CYWG 71852 WINNIPEG_RICHARDSON_INT'L 49.92  -97.23  239
CYWH 71000 VICTORIA_HARBOR           48.42 -123.38    5
CYWJ 71000 DELINE                    65.22 -123.43  214
CYWK 71825 WABUSH_LAKE               52.92  -66.87  553
CYWL 71104 WILLIAMS_LAKE             52.17 -122.05  940
CYWY 71000 WRIGLEY                   63.22 -123.43  149
CYXC 71880 CRANBROOK                 49.60 -115.77  940
CYXD 71879 EDMONTON_CITY_CENTRE_AWOS 53.57 -113.52  671
CYXE 71866 SASKATOON_(AU5)           52.17 -106.72  504
CYXH 71247 MEDICINE_HAT_(NCA)        50.02 -110.72  717
CYXJ 71943 FORT_ST_JOHN              56.23 -120.73  715
CYXL 71842 SIOUX_LOOKOUT             50.12  -91.90  396
CYXN 71000 WHALE_COVE                62.23  -92.60   21
CYXP 71000 PANGNIRTUNG_(AU5)         66.13  -65.70   24
CYXQ 71000 BEAVER_CREEK              62.42 -140.87  649
CYXR 71684 EARLTON_(AU5)             47.70  -79.85  244
CYXS 71896 PRINCE_GEORGE             53.88 -122.68  691
CYXT 71951 TERRACE                   54.45 -128.57  224
CYXU 71623 LONDON                    43.03  -81.15  280
CYXX 71108 ABBOTSFORD                49.02 -122.35   57
CYXY 71964 WHITEHORSE                60.70 -135.07  706
CYXZ 71738 WAWA                      47.97  -84.78  288
CYYB 71731 NORTH_BAY                 46.35  -79.42  370
CYYC 71877 CALGARY                   51.10 -114.02 1084
CYYD 71950 SMITHERS                  54.82 -127.17  529
CYYE 71945 FORT_NELSON               58.83 -122.58  382
CYYF 71889 PENTICTON                 49.45 -119.60  344
CYYG 71706 CHARLOTTETOWN             46.28  -63.12   79
CYYH 71580 TALOYOAK                  69.53  -93.57   28
CYYJ 71799 VICTORIA_INT'L            48.63 -123.42   21
CYYL 71078 LYNN_LAKE                 56.85 -101.07  354
CYYN 71142 SWIFT_CURRENT_(NCA)       50.30 -107.68  817
CYYQ 71618 CHURCHILL                 58.73  -94.05   29
CYYR 71816 GOOSE                     53.32  -60.42   49
CYYT 71801 ST.JOHN'S                 47.62  -52.73  135
CYYU 71831 KAPUSKASING               49.40  -82.47  229
CYYY 71718 MONT_JOLI                 48.60  -68.22   52
CYYZ 71624 TORONTO_LESTER_B_PEARSON  43.67  -79.62  164
CYZE 71000 GORE_BAY-MANITOULIN_CA    45.88  -82.57  187
CYZF 71936 YELLOWKNIFE               62.45 -114.43  206
CYZG 71000 SALLUIT                   62.18  -75.67  226
CYZH 71369 SLAVE_LAKE_CA_(NCA)       55.30 -114.78  583
CYZP 71111 SANDSPIT                  53.25 -131.82    6
CYZR 71704 SARNIA                    43.00  -82.32  181
CYZS 71915 CORAL_HARBOUR             64.20  -83.37   62
CYZT 71109 PORT_HARDY                50.67 -127.35   24
CYZU 71930 WHITECOURT                54.13 -115.78  782
CYZV 71000 SEPT-ILES                 50.22  -66.27   70
CYZW 71000 TESLIN                    60.17 -132.75  705
CYZX 71397 GREENWOOD                 44.98  -64.92   29
CYZY 71290 MACKENZIE_(NCA)           55.28 -123.13  690
CZBF 71574 BATHURST                  47.62  -65.73   59
CZCP 71948 CAPE_PARRY_(AU5)          70.17 -124.72   87
CZCR 71315 CHARLO_AIRPORT_(AU8)      47.98  -66.33   42
CZEM 71000 EASTMAIN                  52.23  -78.52    6
CZFA 71000 FARO                      62.20 -133.37  717
CZFM 71000 FORT_MCPHERSON            67.40 -134.87   35
CZFN 71000 TULITA/FORT_NORMAN        64.92 -125.57   98
CZPC 71085 PINCHER_CREEK_CA_(NCA)    49.52 -113.98 1189
CZST 71955 STEWART                   55.93 -129.98    8
CZUM 71002 CHURCHILL_FALLS_CA        53.55  -64.10  439
 ERM 71590 EDMUNSTON_(AU8)           47.42  -68.32  157
 GBC 71890 BAIE_COMEAU_CA            49.13  -68.20   22
 GVO 71725 VAL_D_OR_CA               48.05  -77.78  336
KMSS 74000 MASSENA/RICHARDS_NY.      44.93  -74.85   65
LFVP 71805 ST_PIERRE_(AUT)           46.77  -56.17    3
 MNT 71813 NATASHQUAN                50.18  -61.80   11
 MTH 71494 THETFORD_MINES_RCS_(AU8)  46.05  -71.27  430
 TAG 71962 FORT_FRANCES_RSC_(AU8)    48.65  -93.43  342
 TBO 71161 BROCKVILLE_CLIMATE        44.63  -75.73  121
 TGT 71833 GUELPH_TURF_GRASS_CS_(AU7 43.55  -80.22  325
 TNK 71581 ALGONQUIN_PARK_EAST_GATE_ 45.53  -78.27  397
 TRY 71098 MONO_CENTRE_(AU8)         44.03  -80.02  436
 TWL 71752 WELLAND-PELHAM_(AU8)      42.58  -79.20  178
 VME 71557 MERRITT_CA                50.10 -120.77  591
 VXY 71773 WHITEHORSE_AUTO           60.72 -135.08  707
 WAG 71337 LA_SCIE_(AU8)             49.92  -55.67  194
 WAJ 71465 ERIEAU_(AU8)              42.25  -81.90  178
 WAR 71807 ARGENTIA_(AU8)            47.28  -53.98   15
 WAV 71248 SUNDRE_(AU8)              51.77 -114.68 1114
 WBA 71732 BARRAGE_TEMISCAMINGUE_(AU 46.70  -79.10  181
 WBE 71460 KILLARNEY_(AU8)           45.97  -81.48  196
 WBK 71415 CARIBOU_POINT_(AU8)       45.77  -62.68    2
 WBO 71457 BROOKS_(AU8)              50.55 -111.85  747
 WBT 71512 LONGUE_POINTE_DE_MINGAN_( 50.27  -64.22   11
 WBU 71312 NIPAWIN_(AU8)             53.33 -104.00  372
 WBV 71403 BEAVER_ISLAND_(AU8)       44.82  -62.33   16
 WBY 71810 PORT_MENIER_(AU8)         49.83  -64.28   55
 WBZ 71712 ST-ANICET_1_(AU8)         45.12  -74.28   49
 WCF 71158 BERENS_RIVER_CS_(AU8)     52.35  -97.03  222
 WCH 71747 ATIKOKAN_(AU8)            48.75  -91.62  389
 WCO 71270 COLLINGWOOD_(AU8)         44.50  -80.22  180
 WCT 71318 CORONATION_CLIMATE_(AU8)  52.07 -111.43  791
 WDC 71076 URANIUM_CITY_(AU8)        59.57 -108.48  318
 WDE 71520 LAC_BENOIT_(AU7)          51.52  -71.10  549
 WDH 71185 DANIELS_HARBOUR_(AU5)     50.23  -57.57   19
 WDI 71400 BADGER_(AU8)              48.97  -56.07  103
 WDK 71234 CLARESHOLM_(AU8)          50.00 -113.63 1012
 WDM 71814 CHEVERY_(AU8)             50.45  -59.63    8
 WDO 71402 TWILLINGATE_(AU8)         49.68  -54.80   92
 WDP 71521 _MANOUANE_EST_(AU7)       50.65  -70.52  497
 WDQ 71378 LA_TUQUE_(AU8)            47.40  -72.78  169
 WDT 71522 CHUTE_DES_PASSES_(AU7)    49.83  -71.17  398
 WDV 71435 UPSALA_(AU8)              49.03  -90.47  489
 WDZ 71237 DRUMHELLER_EAST_(AU8)     51.43 -112.67  678
 WEA 71448 PINAWA_(AU8)              50.17  -96.05  268
 WEB 71894 ESTEVAN_POINT_(AU8)       49.37 -126.53    7
 WEH 71131 EASTEND_CYPRESS_(AUT)     49.43 -108.98 1080
 WEI 71447 MELITA_(AU8)              49.28 -100.98  446
 WEO 71421 LAC_EON_(AU8)             51.87  -63.28  589
 WEP 71412 EAST_POINT_(AU8)          46.45  -61.98    8
 WEQ 71443 SWAN_RIVER_(AU8)          52.12 -101.23  335
 WER 71424 ILE_D'ORLEANS_(AU8)       46.98  -70.80    4
 WEW 71524 L'ASSOMPTION_(AU8)        45.80  -73.43   21
 WEX 71560 EMERSON_(AU8)             49.00  -97.23  242
 WFJ 71153 CARDSTON_(AU8)            49.20 -113.28 1136
 WFO 71954 FLIN_FLON_(AU8)           54.68 -101.68  304
 WFP 71665 NAIN_(AU8)                56.55  -61.68   12
 WFQ 71373 FRELIGHSBURG_(AU7)        45.05  -72.85  152
 WFX 71055 COLVILLE_LAKE_(AU8)       67.03 -126.08  259
 WGD 71261 GODERICH_(AU8)            43.77  -81.72  214
 WGH 71281 GRENADIER_ISLAND_(AU8)    44.42  -75.85   82
 WGL 71282 LAGOON_CITY_(AU8)         44.53  -79.22  221
 WGN 71441 GRETNA_(AU8)              49.02  -97.55  253
 WGX 71000 GILLAM_(AU8)              56.37  -94.70  145
 WHM 71184 VARENNES_(AU8)            45.72  -73.37   18
 WHO 71900 HOPEDALE_(AU8)            55.45  -60.22   10
 WHP 71423 HEATH_POINT_(AU8)         49.08  -61.70    7
 WHQ 71389 DESCHAMBAULT_(AU7)        46.68  -71.97   61
 WHT 71505 HAINES_JUNCTION_(AU8)     60.77 -137.57  599
 WHV 71323 BEAUCEVILLE_(AU8)         46.20  -70.78  229
 WID 71087 FORT_PROVIDENCE_(AU8)     61.32 -117.60  162
 WIG 71000 ILE-AUX-GRUES_(AU8)       47.07  -70.53   18
 WII 71552 VICTORIA_BEACH_(AU8)      50.70  -96.57  220
 WIP 71390 POINTE_NOIRE_CS_(AU7)     50.15  -66.43   24
 WIS 71319 CHARLEVOIX_(MRC)_(AU8)    47.28  -70.63  723
 WIT 71614 STE_CLOTHILDE_(AU8)       45.17  -73.67   53
 WIX 71381 MISTOOK_(AU7)             48.58  -71.70  113
 WIZ 71372 L'ACADIE_(AU7)            45.28  -73.33   44
 WJB 71392 STE-FOY(U._LAVAL)_CS_(AU8 46.77  -71.28   91
 WJD 71858 GRAND_RAPIDS_(AU8)        53.18  -99.27  223
 WJH 71451 SOUTHEND_(AU8)            56.33 -103.28  344
 WJI 71487 ASSINIBOIA_AIRPORT_(AU8)  49.73 -105.93  726
 WJO 71617 JONQUIERE_(AU8)           48.42  -71.13  128
 WJR 71770 CRESTON_CS_(AU8)          49.07 -116.50  646
 WJT 71376 ST-JOVITE_(AU8)           46.07  -74.55  239
 WJV 71115 VERNON_AUTO_(AU8)         50.22 -119.18  482
 WJW 71486 JASPER-WARDEN_(AU8)       52.93 -118.03 1020
 WJX 71459 LEADER_(AU8)              50.90 -109.50  676
 WKB 71973 CORNER_BROOK_(AU8)        48.93  -57.92  152
 WKD 71383 BONNARD_1_(AU7)           50.72  -71.02  498
 WKG 71599 KEJIMKUJIK_1_(AU8)        44.42  -65.20  165
 WKO 71135 ROCKGLEN_(AU8)            49.17 -105.98  917
 WKV 71000 HOPE_SLIDE                49.28 -121.23  674
 WKX 71222 DEASE_LAKE_(AU8)          58.42 -130.00  816
 WLF 71846 LANSDOWNE_HOUSE_(AU8)     52.18  -87.93  253
 WLJ 71970 MEADOW_LAKE_(AU8)         54.13 -108.52  481
 WLM 71200 VICTORIA_GONZALES_(AU8)   48.40 -123.32   70
 WLS 71631 MOUNT_FOREST_(AUT)        43.98  -80.75  415
 WME 71482 CATHEDRAL_POINT_(AU8)     52.18 -127.47   31
 WMI 71719 MISCOU_ISLAND_(AU8)       48.02  -64.50    5
 WMJ 71721 MANIWAKI_AIRPORT_(AU8)    46.27  -75.98  201
 WMT 71163 LAC_LA_MARTRE_(AU8)       63.13 -117.25  271
 WNE 71987 NORTH_CAPE_(AU8)          47.05  -63.98    8
 WNH 71715 RIVIERE_DU_LOUP_(AU8)     47.80  -69.53  147
 WNM 71776 NELSON_CS_(AU8)           49.48 -117.30  535
 WNP 71216 NAKUSP_(AU8)              50.25 -117.80  512
 WNQ 71723 NICOLET_(AU7)             46.22  -72.65    8
 WNZ 71832 NAGAGAMI_(AU8)            49.73  -84.15  264
 WOC 71619 NEW_CARLISLE_1_(AU8)      48.00  -65.32   46
 WOD 71379 NORMANDIN_(AU8)           48.83  -72.55  137
 WOE 71116 ONEFOUR_CDA_(AU8)         49.12 -110.47  935
 WOK 71450 ELBOW_(AU8)               51.13 -106.58  595
 WON 71966 DAWSON_(AU8)              64.05 -139.13  370
 WOO 71149 MCCREARY_(AU8)            50.72  -99.53  351
 WOY 71865 WYNYARD_(AU8)             51.77 -104.20  560
 WPC 71463 PORT_COLBORNE_(AU8)       42.87  -79.25  184
 WPD 71382 L'ETAPE_(AU8)             47.55  -71.22  791
 WPE 71699 POINT_LEPREAU_CS_(AU8)    45.07  -66.45    6
 WPG 71000 PORTAGE_LA_PRAIRIE        49.90  -98.27  270
 WPK 71726 PARENT_(AU8)              47.92  -74.62  445
 WPL 71835 PICKLE_LAKE_(AU8)         51.43  -90.22  391
 WPO 71148 PILOT_MOUND_(AU8)         49.20  -98.90  475
 WPR 71032 PRINCETON_(AU8)           49.47 -120.50  700
 WPU 71050 PUNTZI_MOUNTAIN_(AU8)     52.10 -124.13  910
 WPZ 71952 BURNS_LAKE_DECKER_LAKE    54.38 -125.95  713
 WQC 71475 PORT_ALBERNI_(AU8)        49.32 -124.92   76
 WQH 71611 LENNOXVILLE_(AU8)         45.37  -71.82  181
 WQM 71186 CAP_ROUGE_(AU8)           48.37  -70.53    7
 WQP 71430 POINT_PETRE_(AU8)         43.83  -77.15   79
 WQR 71375 ILE_AUX_PEROQUETS_(AU8)   50.22  -64.20    9
 WQV 71189 POINTE_CLAVEAU_(AU8)      48.25  -70.10    4
 WRA 71800 CAPE_RACE_(AU8)           46.65  -53.07   27
 WRD 71246 RED_EARTH_(AU8)           56.55 -115.27  546
 WRK 71294 BANCROFT_AUTO_(AU8)       45.07  -77.87  331
 WRM 71928 ROCKY_MOUNTAIN_HOUSE_(AU8 52.42 -114.90  988
 WRN 71419 HART_ISLAND_(AU8)         45.35  -60.98    8
 WRR 71506 ROCK_RIVER_(AU8)          66.97 -136.22  731
 WRV 71254 CAMROSE_(AU8)             53.03 -112.82  739
 WRZ 71429 CAP_D'ESPOIR_(AU8)        48.42  -64.32   15
 WSD 71702 SUMMERSIDE_(AU8)          46.43  -63.83   21
 WSF 71425 CAP_MADELEINE_(AU8)       49.25  -65.32   29
 WSG 71428 CAP_CHAT_(AU7)            49.10  -66.65    5
 WSK 71207 SQUAMISH_(AU8)            49.78 -123.15   52
 WSL 71218 SALMON_ARM_(AU8)          50.70 -119.28  351
 WSS 71607 ST.STEPHEN_(AU8)          45.22  -67.25   28
 WST 71713 LA_POCATIERE_CS_(AU8)     47.35  -70.02   31
 WSU 71449 SPRAGUE_(AU8)             49.02  -95.58  329
 WSV 71000 BLUE_RIVER_AVIATION_REPOR 52.13 -119.28  683
 WSY 71467 SACHS_HARBOUR_CLIMATE_(AU 72.00 -125.27   88
 WSZ 71442 FISHER_BRANCH_(AU8)       51.08  -97.55  253
 WTA 71612 MCTAVISH_(AU8)            45.50  -73.57   73
 WTG 71427 POINTE_DES_MONTS_(AU8)    49.32  -67.37    6
 WTN 71384 CAP_TOURMENTE_(AU8)       47.07  -70.77    6
 WTX 71000 ROYAL_ISLAND_(AU8)        49.47  -94.77  328
 WUM 71949 FARO_(AU8)                62.23 -133.35  717
 WUX 71388 LA_BAIE_(AU7)             48.28  -70.92  152
 WVI 71458 VEGREVILLE_(AU8)          53.52 -112.10  639
 WVQ 71377 STE-ANNE_DE_BELLEVUE_1_(A 45.42  -73.93   39
 WVT 71077 BUFFALO_NARROWS_(AU8)     55.83 -108.43  440
 WVU 71988 BRIER_ISLAND_(AU8)        44.28  -66.35   16
 WWA 71784 WEST_VANCOUVER_(AU8)      49.33 -123.18  178
 WWB 71437 BURLINGTON_PIERS_(AU8)    43.30  -79.80   77
 WWC 71075 COLLINS_BAY_(AU8)         58.18 -103.70  492
 WWE 71411 WESTERN_HEAD_(AU8)        43.98  -64.65   10
 WWK 71785 WHITE_ROCK_CS_(AU8)       49.02 -122.78   13
 WWN 71434 PEAWANUCK_(AU8)           54.98  -85.43   54
 WWP 71444 WASAGAMING_(AU8)          50.65  -99.93  627
 WXA 71232 BOW_VALLEY_(AU8)          51.08 -115.07 1298
 WXC 71387 ONATCHIWAY_(AU8)          48.88  -71.02  304
 WXI 71406 FEROLLE_POINT_(AU8)       51.02  -57.10    6
 WXP 71826 PANGNIRTUNG_(AU8)         66.13  -65.70   32
 WXS 71598 BAS_CARAQUET_(AU8)        47.80  -64.83    5
 WYE 71551 OUTLOOK_PFRA_(AU8)        51.48 -107.05  541
 WYI 71931 POOLS_ISLAND_(AU8)        49.10  -53.57   10
 WYL 71786 YOHO_PARK_(AU8)           51.43 -116.33 1615
 WYQ 71554 POINTE-AU-PERE_(INRS)_(AU 48.50  -68.47    5
 WYW 71841 ARMSTRONG_(AU8)           50.28  -88.90  324
 WYY 71215 OSOYOOS_(AU8)             49.02 -119.43  293
 WZA 71113 AGASSIZ_CS_(AU8)          49.25 -121.77   19
 WZB 71197 PORT-AUX-BASQUES_(AU5)    47.57  -59.15   40
 WZG 71122 BANFF_(AU8)               51.18 -115.55 1397
 WZN 71408 SAGONA_(AU8)              47.37  -55.78   64
 WZQ 71000 GRAND_ETANG_(AU8)         46.55  -61.05   13
 WZS 71386 AMQUI_(AU8)               48.47  -67.43  166
 WZW 71045 TESLIN_(AU8)              60.17 -132.73  705
 XAT 71592 ARCTIC_BAY_CS_(AU8)       72.98  -85.00   10
 XBD 71061 BARRHEAD_CS_(AU8)         54.08 -114.43  648
 XBI 71314 BARRIE-ORO_(AU8)          44.48  -79.55  289
 XBO 71578 BEAUPORT_(AU7)            46.83  -71.18   10
 XBQ 71334 TADOULE_LAKE_CS_(AU8)     58.70  -98.50  262
 XCA 71291 CAMERON_FALLS_(AU8)       49.15  -88.33  233
 XCH 71959 CHETICAMP_(AU7)           46.63  -60.93   44
 XCK 71039 CARMACKS_(AUT)            62.10 -136.18  543
 XDE 71503 DELINE_CS_(AU8)           65.22 -123.43  213
 XDI 71573 DELHI_CS_(AU8)            42.87  -80.55  232
 XEA 71295 EAR_FALLS_(AUT)_(AU8)     50.62  -93.22  363
 XET 71296 EGBERT_CS_(AU8)           44.14  -79.47  251
 XGM 71030 GRAND_MANAN_(AU8)         44.70  -66.80   78
 XHF 71391 HIGH_FALLS_CS_(AU8)       45.83  -75.63  195
 XHI 71029 HOLMAN_CS_(AU8)           70.75 -117.80   30
 XHM 71297 HAMILTON_RBG_(AU8)        43.17  -79.54  102
 XIB 71027 INGONISH_BEACH_CS_(AU7)   46.67  -60.40    8
 XKA 71299 KAPUSKASING_CDA_(AU8)     49.40  -82.43  218
 XKE 71300 KEMPTVILLE_(AU8)          45.00  -75.63   99
 XKI 71301 KIRKLAND_LAKE_(AU8)       48.15  -80.00  324
 XKT 71671 KENTVILLE_CDA_CS_(AU8)    45.07  -64.48   49
 XLB 71000 LUNENBURG_(AU8)           44.37  -64.30    4
 XLT 71040 LATERRIERE_(AU8)          48.30  -71.12  163
 XMI 71000 MCNABS_ISLAND_(AU8)       44.60  -63.52   17
 XMP 71000 MAPLE_PLAINS_(AU8)        46.30  -63.58   46
 XMY 71000 MALAY_FALLS_(AU8)         44.98  -62.48   40
 XND 71060 NORDEGG_CS_(AU8)          52.47 -116.07 1362
 XNM 71604 NORTH_MOUNTAIN_(AU7)      46.82  -60.67  439
 XNP 71311 NAPPAN_AUTO_(AU8)         45.75  -64.23   20
 XPC 71172 PARRY_SOUND_CCG_(AU8)     45.33  -80.03  176
 XPS 71127 EDMONTON_STONY_PLAIN_CS_( 53.55 -114.12  760
 XRG 71307 RIDGETOWN_RCS_(AU8)       42.45  -81.88  206
 XRH 71588 ROCKY_HARBOUR_CS_(AU7)    49.57  -57.87   68
 XSH 71370 SHAWINIGAN_CS_(AU7)       46.55  -72.73  110
 XTD 71308 TRACADIE_(AU8)            45.60  -61.68   67
 XTP 71589 TERRA_NOVA_NATIONAL_PARK_ 48.55  -53.97  107
 XVN 71171 VINELAND_RCS_(AU8)        43.18  -79.40   79
 XWT 71181 WINTERLAND_(AU5)          47.13  -55.32   29
 XZV 71279 SEPT-ILES_(AU8)           50.22  -66.25   53
 ZDB 71317 DEBERT_(AU8)              45.42  -63.47   39
 ZHK 71363 GJOA_HAVEN_CLIMATE_(AU8)  68.63  -95.85   42
 ZMJ 71539 MOOSE_JAW_CS_(AU8)        50.32 -105.55  577
 ZOC 71044 OLD_CROW_RCS_(AU8)        67.57 -139.83  251
 ZPK 71984 PAULATUK_(AU8)            69.35 -124.07    6
 ZSJ 71098 SANDY_LAKE_(AU5)          53.07  -93.35  291
 ZSP 71310 ST._PETERS_(AU8)          46.45  -62.57   30
