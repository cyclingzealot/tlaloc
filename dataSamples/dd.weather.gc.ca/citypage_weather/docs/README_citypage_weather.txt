                         README citypage weather in XML Format

(Le français suit)

----------------------------------------

ENVIRONMENT AND CLIMATE CHANGE CANADA

README file about the citypage weather XML files available
on the Meteorological Service of Canada's HTTP data server.

To read this file online, please go to:
http://dd.weather.gc.ca/citypage_weather/docs/README_ciypageWeather.txt

Files are produced or distributed by Environment and Climate Change Canada	:
http://ec.gc.ca/

-------------------------------------------------------
Edition of 2017-02-22
-------------------------------------------------------

In this file:
* About
* License
* Download
* Data Wire
* Description
* Data
* Filename
* Contact Us


##############################################
###                About                   ###
##############################################

This document explains the citypage weather XML files that are produced
for a selected number of cities in the Canadian provinces and territories

The overarching README file of the datamart itself can be found here:
http://dd.weather.gc.ca/about_dd_apropos.txt


##############################################
###              License                   ###
##############################################

For the terms of use and conditions of the citypage weather XML files
created by Environment and Climate Change Canada, see the general datamart license at:
http://dd.weather.gc.ca/doc/LICENCE_GENERAL.txt


###############################################
###              Download                   ###
###############################################

The citypage weather XML files are available at the following address:
http://dd.weather.gc.ca/citypage_weather/xml/


##############################################
###             Data Wire                  ###
##############################################

To facilitate the retrieval of timely data on the Datamart, the
Meteorological Service of Canada (MSC) has set up a data wire for
announcing file availability on the Datamart.  This data wire uses the
'Advanced Message Queuing Protocol' (AMQP) protocol. Not only does this 
enable the user to be notified of available products as they're published,
but also to receive them automatically.
The service may apply to a specific set of files (weather warnings, observations, 
model data, etc.) and thus may concern only those products of interest to 
the user.

The documentation about this service can be found here:
http://dd.weather.gc.ca/doc/README_AMQP.txt


################################################
###       Description                        ###
################################################

The http://dd.weather.gc.ca/citypage_weather/xml/ directory
contains the same XML information used to generate each city and
24h forecasts page on the Environment and Climate Change Canada web site http://www.weather.gc.ca/

The XML files are updated hourly at a minimum, but can be updated earlier
with issue of special weather warnings, watches and amendments.

Environment and Climate Change Canada's guide to the public forecast can be accessed here:
http://www.ec.gc.ca/meteo-weather/default.asp?lang=En&n=4D51ECA8-1

It includes information on the issuing time of forecasts,time period
covered by forecast, determination of forecast regions, forecast time
period terminology, information included in the forecast, and forecast
revision.


################################################
###                 Data                     ###
################################################

Tables describing each of the city page weather XML element tags and their
associated attributes can be found at:
http://dd.weather.gc.ca/citypage_weather/docs/tags_table_e.csv

The XML schemas for citypage weather data are found in this directory:
http://dd.weather.gc.ca/citypage_weather/schema/

City page weather XML files contain CODED current conditions and forecast
conditions. These codes are used to determine the icon displayed on the
weather office web site's city pages. Tables describing the meteorological
conditions for each code are available at:
http://dd.weather.gc.ca/citypage_weather/docs/current_conditions_icon_code_descriptions_e.csv
http://dd.weather.gc.ca/citypage_weather/docs/forecast_conditions_icon_code_descriptions_e.csv


###############################################
###              Filename                   ###
###############################################

The citypage weather XML files are grouped in a directory tree that is based on
province,territory, or high elevation forecast.

1- The directories have the following nomenclature:
/citypage_weather/xml/XX

where:
* XX is a 2 letter provincial or territorial code indicating the area
covered by the observations. The code is one of the 13 following values:
** AB (Alberta)
** BC (British Columbia)
** MB (Manitoba)
** NB (New Brunswick)
** NL (Newfoundland and Labrador)
** NS (Nova Scotia)
** NT (Northwest Territories)
** NU (Nunavut)
** ON (Ontario)
** PE (Prince Edward Island)
** QC (Québec)
** SK (Saskatchewan)
** YT (Yukon)

In addition, /citypage_weather/xml/HEF contains all high elevation
forecasts. This is a seasonal text bulletin forecast issued for British
Columbia only.

2- The file names have the following nomenclature:
 SiteNameCode_L.xml

where:
* SiteNameCode: code corresponding to the site codes used in the city site
list (see URL below)
* L : single letter indicating the language of the file. Can be either: f
(French) or e (English)

Examples of file name:
* s0000001_e.xml - English citypage weather XML for Athabasca
* s0000001_f.xml - French citypage weather XML for Athabasca

Lists with location names and and SiteNameCodes, regrouped according to
various factors, can be found at the following addresses:
http://dd.weather.gc.ca/citypage_weather/docs/site_list_en.csv
http://dd.weather.gc.ca/citypage_weather/docs/site_list_provinces_en.csv
http://dd.weather.gc.ca/citypage_weather/docs/site_list_towns_en.csv



################################################
###       Contact Us                         ###
################################################

If you use the data available on the Datamart, we strongly recommend you to 
subscribe to the Datamart's mailing list in order to be warned of any 
updates or changes regarding the data available. You can subscribe here:
http://lists.cmc.ec.gc.ca/mailman/listinfo/dd_info

Please use the following address to contact us for any comments or questions:
 ec.dps-client.ec@canada.ca


----------------------------------------


                                  README révisions météorologiques par ville en format XML


ENVIRONNEMENT ET CHANGEMENT CLIMATIQUE CANADA

Fichier README sur les fichiers XML de prévisions météorologiques par
ville disponibles sur le serveur de données HTTP du Service météorologique
du Canada.

Pour lire le présent fichier en ligne, visitez l'adresse :
http://dd.meteo.gc.ca/citypage_weather/docs/README_citypageweather.txt

Les fichiers sont produits ou distribués par Environnement et changement climatique Canada :
http://ec.gc.ca/

-------------------------------------------------------
Version du 2017-02-22
-------------------------------------------------------

Dans ce fichier :
* À propos
* Licence
* Téléchargement
* Fil de données
* Description
* Données
* Nom de fichiers
* Pour nous joindre

##############################################
###              À propos                  ###
##############################################

Le présent document décrit les fichiers XML de prévisions météorologiques
par ville qui sont créés pour certaines villes des provinces et des
territoires canadiens.

Le fichier README global pour le datamart peut être trouvé ici:
http://dd.meteo.gc.ca/about_dd_apropos.txt


##############################################
###       Licence                          ###
##############################################

Pour connaître les conditions d'utilisation des fichiers XML de prévisions
météorologiques par ville créés par Environnement et changement climatique Canada, consultez les
conditions générales d'utilisation du dépôt de données :
http://dd.meteo.gc.ca/doc/LICENCE_GENERAL.txt


###############################################
###       Téléchargement                    ###
###############################################

Les fichiers XML de prévisions météorologiques par ville sont
disponibles à l'adresse :
http://dd.meteo.gc.ca/citypage_weather/xml/


##############################################
###         Fil de données                 ###
##############################################

Afin de faciliter l'obtention en temps opportun des données du Datamart,
le Service météorologique du Canada (SMC) a mis en place un fil de données
annonçant les fichiers disponibles sur le Datamart. Ce fil de données
utilise le protocole ''Advanced Message Queuing Protocol'' (AMQP). Il
devient ainsi possible non seulement d'être avisé de la disponibilité des 
produits sur le Datamart lorsque ceux-ci sont publiés, mais aussi de les recevoir 
automatiquement. Le service peut s'appliquer à une série spécifique de 
fichiers (alertes météorologiques, observations, données de modèle, etc.) et 
ainsi viser seulement les produits d'intérêt pour l'usager.

La documentation de ce service est disponible ici:
http://dd.weather.gc.ca/doc/README_AMQP.txt


################################################
###       Description                        ###
################################################

Le dossier http://dd.weather.gc.ca/citypage_weather/xml/ contient
les renseignements, en format XML, qui sont utilisés pour créer les pages
par ville et les prévisions 24 heures, du site d'Environnement et changement 
climatique Canada http://www.meteo.gc.ca/

Les fichiers XML sont mis à jour au moins une fois par heure, ou plus
souvent dans le cas d'avertissements, d'avis ou de modifications de veille
météorologique.

Vous pouvez consulter le guide des prévisions météorologiques
d'Environnement et changement climatique Canada à l'adresse :
http://www.ec.gc.ca/meteo-weather/default.asp?lang=Fr&n=4D51ECA8-1

Le guide fournit des renseignements sur les bulletins de prévisions :
heure de publication, période couverte, régions, terminologie relative à
la période de prévision, renseignements fournis et révision des
prévisions.


################################################
###              Données                     ###
################################################

Vous pouvez consulter la description des balises et des attributs XML des
pages de prévisions météorologiques par ville à l'adresse :
http://dd.meteo.gc.ca/citypage_weather/docs/tags_table_f.csv

Les schémas XML des fichiers de données météorologiques par ville sont
disponibles à l'adresse :
http://dd.meteo.gc.ca/citypage_weather/schema/

Les fichiers XML de prévisions météorologiques par ville contiennent des
renseignements CODÉS sur les conditions actuelles et prévues. Ces codes
définissent l'icône à afficher sur les pages par ville du site Web du
bureau des prévisions météorologiques. Vous pouvez consulter la
description des conditions météorologiques qui correspond aux codes aux
adresses suivantes :
http://dd.meteo.gc.ca/citypage_weather/docs/current_conditions_icon_code_descriptions_f.csv
http://dd.meteo.gc.ca/citypage_weather/docs/forecast_conditions_icon_code_descriptions_f.csv


##############################################
###       Noms de fichier                  ###
##############################################

Les fichiers XML de prévisions météorologiques par ville sont organisés
dans une arborescence en fonction de la province, du territoire ou des
prévisions en haute altitude.

1- Les dossiers ont un nom de la forme:
 /citypage_weather/xml/XX

où :
* XX:  code de 2 lettres pour la province ou le territoire couvert par ces
observations. Ce code peut prendre une de ces 13 valeurs:
** AB (Alberta)
** BC (Colombie-Britannique)
** MB (Manitoba)
** NB (Nouveau-Brunswick)
** NL (Terre-Neuve-et-Labrador)
** NS (Nouvelle-Écosse)
** NT (Territoires du Nord-Ouest)
** NU (Nunavut)
** ON (Ontario)
** PE (Île-du-Prince-Édouard)
** QC (Québec)
** SK (Saskatchewan)
** YT (Yukon)

De plus, le dossier /citypage_weather/xml/HEF contient les prévisions en
haute altitude. Il s'agit de bulletins de prévisions saisonnières publiés
seulement pour la Colombie-Britannique.

2- Les fichiers ont un nom de la forme :
    CodeDeSite_L.xml

où:
* CodeDeSite: code de la ville ( voir l'URL plus bas )
* L: lettre indiquant la langue du fichier : f (français) ou e (anglais).

Exemple de nom de fichier :
* s0000001_e.xml - fichier XML de prévisions météorologiques pour
Athabasca, en anglais
* s0000001_f.xml - fichier XML de prévisions météorologiques pour
Athabasca, en français

Des listes de noms d'emplacements et de codes de sites, groupés selon
diverses valeurs, sont disponibles aux adresses suivantes :
http://dd.meteo.gc.ca/citypage_weather/docs/site_list_fr.csv
http://dd.meteo.gc.ca/citypage_weather/docs/site_list_provinces_fr.csv
http://dd.meteo.gc.ca/citypage_weather/docs/site_list_towns_fr.csv


###############################################################
###       Pour nous joindre                                 ###
###############################################################

Si vous utilisez les données disponibles sur le Datamart, vous êtes invités à 
vous inscrire à la liste de diffusion du Datamart afin d'être avertis de tout 
changement ou mise à jour sur les données disponibles.  Vous pouvez vous 
inscrire ici :
http://lists.cmc.ec.gc.ca/mailman/listinfo/dd_info

Veuillez utiliser l'adresse courriel suivante pour nous contacter afin de nous 
faire part de tous commentaires ou questions :
 ec.dps-client.ec@canada.ca
