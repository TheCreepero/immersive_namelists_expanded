# France

**Country Tag:** `FRA` | **Source File:** [`zz_INEX_FRA_names_divisions.txt`](../common/units/names_divisions/zz_INEX_FRA_names_divisions.txt)

---

## Historical Overview

France's *Armée de Terre* entered WWII with a large but doctrinally constrained force structure. After the 1940 defeat, French military identity split between Vichy France, Free French Forces (*Forces Françaises Libres*), and eventually the *Forces Françaises de l'Intérieur* (FFI). INEX covers the pre-war and 1940 order of battle (infantry, cavalry, *Divisions Légères Mécaniques*, *Divisions Cuirassées de Réserve*, Maginot fortress divisions, Alpine troops), the colonial troops and the *Armée d'Afrique*, the Free French and Liberation formations, the 1943-46 *Divisions Blindées*, post-war airborne units, coastal defence and island and overseas garrisons, the *Armée de l'Armistice* of 1940-42, government-gated militia lists for democratic, fascist, communist and neutral France, and three historical-tradition suites: the Revolution of 1789-99 for democratic and communist France, the Imperial Guard, Grande Armée and Second Empire for a Bonapartist France, and the Paris Commune of 1871 for communist France. In vanilla, Vichy France is a new country split off from FRA with a fascist government, and Free France is FRA itself under a democratic government; the gates below follow that. Vanilla's Bonapartist restoration (Napoléon VI) sets a neutral government, as does the Orléanist one, so both see the Bonapartist groups; the Commune path is communist. All French names use proper French diacritics (*1ère Division d'Infanterie*, *Chasseurs Alpins*). Ordinals follow the vanilla style (*1ère*, *2ème*).

Where history offers little, a group is kept short and falls back to its numbered fallback name rather than being padded.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `FRA_INF_01` | Infantry Divisions | infantry | `%dème Division d'Infanterie` |
| `FRA_INF_02` | Infantry Divisions (Named) | infantry | `%dème Division d'Infanterie` |
| `FRA_GARDE_NAT_01` | National Guard Divisions | infantry, motorized, mechanized, marine, mountaineers, paratrooper | `%dème Division de la Garde Nationale` |
| `FRA_CAV_01` | Cavalry Divisions | cavalry | `%dème Division de Cavalerie` |
| `FRA_MOT_01` | Motorized Divisions | motorized | `%dème Div. d'Infanterie Motorisée` |
| `FRA_MEC_01` | Light Mechanized Divisions | light_armor, medium_armor, mechanized | `%dème Division Légère Mécanique` |
| `FRA_DLC_01` | Light Cavalry Divisions | motorized, cavalry, mechanized | `%dème Div. Légère de Cavalerie` |
| `FRA_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Cuirassée` |
| `FRA_ARM_02` | Tank Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Brigade Cuirassée` |
| `FRA_ARM_03` | Armored Divisions (DB) | medium_armor, modern_armor | `%dème Division Blindée` |
| `FRA_PAR_01` | Paratrooper Divisions | paratrooper | `%dème Division Parachutiste` |
| `FRA_MAR_01` | Marine Divisions | marine | `%dème Div. d'Infanterie de Marine` |
| `FRA_MNT_01` | Mountain Divisions | mountaineers | `%dème Division d'Infanterie Alpine` |
| `FRA_GAR_01` | Garrison Divisions | infantry | `%dème Division de Forteresse` |
| `FRA_COT_01` | Coastal Defense Divisions | infantry | `%dème Division de Défense du Littoral` |
| `FRA_ILE_01` | Island & Overseas Garrisons | infantry | `%dème Division de Garnison` |
| `FRA_COL_01` | Colonial Divisions | infantry | `%dème Division d'Infanterie Coloniale` |
| `FRA_AFR_01` | Army of Africa Divisions | infantry | `%dème Div. d'Infanterie Nord-Africaine` |
| `FRA_FFL_01` | Free French Divisions | infantry, motorized | `%dème Division Française Libre` |
| `FRA_DEF_01` | Defense Divisions | militia | `%dème Division de la Défense Nationale` |
| `FRA_INF_METRO_01` | Metropolitan Infantry | infantry | `%dème Division d'Infanterie Métropolitaine` |
| `FRA_MIL_FAS_01` | Milice Divisions | infantry, militia | `%dème Division de la Milice Française` |
| `FRA_MIL_COM_01` | Francs-Tireurs Divisions | infantry, militia | `%dème Division des Francs-Tireurs et Partisans` |
| `FRA_MIL_NEU_01` | Armistice Army Divisions | infantry, militia | `%dème Division Militaire` |
| `FRA_REV_01` | Volunteer Divisions | infantry | `%dème Division de Volontaires Nationaux` |
| `FRA_REV_02` | Republican Demi-Brigades | infantry | `%dème Demi-Brigade de Bataille` |
| `FRA_REV_CAV_01` | Republican Cavalry | cavalry | `%dème Division de Cavalerie Républicaine` |
| `FRA_REV_COM_01` | Sans-Culotte Divisions | infantry, militia | `%dème Division de l'Armée Révolutionnaire` |
| `FRA_GARDE_IMP_01` | Imperial Guard Divisions | infantry | `%dème Division de la Garde Impériale` |
| `FRA_GRA_01` | Grande Armée Divisions | infantry | `%dème Division de la Grande Armée` |
| `FRA_GRA_ARM_01` | Cuirassier Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division de Cuirassiers` |
| `FRA_GRA_CAV_01` | Imperial Cavalry Divisions | cavalry | `%dème Division de Cavalerie Légère` |
| `FRA_SEC_EMP_01` | Second Empire Divisions | infantry | `%dème Division de Voltigeurs de la Garde` |
| `FRA_COMMUNE_01` | Federated Legions | infantry, militia | `%dème Légion Fédérée` |
| `FRA_COMMUNE_MOT_01` | Commune Motorized Divisions | motorized, mechanized | `%dème Division Motorisée de la Commune` |
| `FRA_COMMUNE_ARM_01` | Commune Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Blindée de la Commune` |

---

## Group Details

### `FRA_INF_01` — Infantry Divisions
The plain, un-nicknamed infantry list: it carries only the fallback name (*%dème Division d'Infanterie*). `FRA_MOT_01`, `FRA_MNT_01` and `FRA_GAR_01` share its numbering via `link_numbering_with`.

### `FRA_INF_02` — Infantry Divisions (Named)
The nicknamed counterpart of `FRA_INF_01`, sharing its numbering. Authentic nicknames are scarce, so only the better attested ones sit at their division number: 11e DI *de Fer*, 14e DI *des As*, 39e DI *d'Acier*, 66e DI *L'Alsacienne*, 133e DI *La Gauloise*, 164e DI *du Dragon*, 5e DI *de Neuville-Saint-Vaast*, 36e DI *du Sud-Ouest*. Most of these are First World War epithets. The remaining entries draw on republican and Napoleonic tradition (*Valmy*, *Jemmapes*, *Austerlitz*) and the Great War battles (*Verdun*, *Marne*, *Somme*).

### `FRA_GARDE_NAT_01` — National Guard Divisions
Republican *Garde Nationale* divisions named after 30 regional centres. Available to democratic governments only.

### `FRA_CAV_01` — Cavalry Divisions
The pre-1940 *Divisions de Cavalerie* (1ère-5ème) plus the 1ère-3ème *Brigades de Spahis* and the *Brigades de Cavalerie*.

### `FRA_MOT_01` — Motorized Divisions
The seven *Divisions d'Infanterie Motorisée* of 1940 (1ère, 3ème, 5ème, 9ème, 12ème, 15ème and 25ème) under their own numbers; other numbers use the fallback. Shares numbering with `FRA_INF_01`. The 1943 *1ère Division Motorisée d'Infanterie* (the renamed 1ère DFL) is in `FRA_FFL_01`.

### `FRA_MEC_01` — Light Mechanized Divisions
The *Divisions Légères Mécaniques*: 1ère, 2ème, 3ème, 4ème and 7ème DLM. The 5ème, 6ème and 8ème were never formed. DLM numbering was a series of its own, so the list is deliberately not linked to infantry.

### `FRA_DLC_01` — Light Cavalry Divisions
The 1ère-6ème *Divisions Légères de Cavalerie* (1940). Sources disagree on whether the 6ème, formed in Tunisia, counts.

### `FRA_ARM_01` / `FRA_ARM_02` / `FRA_ARM_03` — Armored
- `FRA_ARM_01` — *Divisions Cuirassées de Réserve* (DCR), 1ère-4ème (1940)
- `FRA_ARM_02` — Tank brigades; fallback names only
- `FRA_ARM_03` — *Divisions Blindées* (DB): 1ère, 2ème, 3ème, 5ème and 6ème. Shares numbering with `FRA_ARM_01`.

### `FRA_PAR_01` — Paratrooper Divisions
Post-war airborne: the 25ème *Division Aéroportée* (1946), the 10ème and 25ème *Divisions Parachutistes* (1956) and the 11ème *Division Légère d'Intervention* (1961).

### `FRA_MAR_01` — Marine Divisions
*Infanterie de Marine* divisions named after the naval bases (Toulon, Brest, Cherbourg, Lorient, Rochefort), plus the 9ème *Division d'Infanterie de Marine* and the *Division Bleue* of Bazeilles (1870). The base titles are a plausible extrapolation.

### `FRA_MNT_01` — Mountain Divisions
The 27e-31e *Divisions d'Infanterie Alpine*, the 64e-66e *Divisions d'Infanterie de Montagne*, the 4ème *Division Marocaine de Montagne* and the 1940 *Brigade de Haute Montagne*. Shares numbering with `FRA_INF_01`.

### `FRA_GAR_01` — Garrison Divisions
The 101e-105e *Divisions d'Infanterie de Forteresse* (March 1940) and *Divisions de Forteresse* named after the Maginot and Alpine fortified sectors (Flandres, Maubeuge, la Crusnes, Thionville, Haguenau, Colmar, Dauphiné, la Savoie, Alpes-Maritimes and others), the *secteurs défensifs* of Altkirch, Montbéliard and the Rhône, and the *région fortifiée* of the Lauter. Shares numbering with `FRA_INF_01`.

### `FRA_COT_01` — Coastal Defense Divisions
The ten *Secteurs de Défense du Littoral* of 1939-40, from Dunkerque to Nice (the Dunkerque and Boulogne sector became the *Groupement Littoral Nord* and then the 68e DI), the *Division Gironde* and the 1944-45 Atlantic pockets, the *garde-côtes* tradition of the coastal militia, and the *Armées des Côtes* and Boulogne camps of 1793-1805. The sectors past the 1939 ten are a plausible extrapolation. Its own numbering, not linked to infantry. Available to every government.

### `FRA_ILE_01` — Island & Overseas Garrisons
Garrisons for Corsica (the *Secteur de Défense du Littoral de la Corse* and the garrison towns of Ajaccio, Bastia, Bonifacio and Corte), the Atlantic and Mediterranean islands (Ouessant, Belle-Île, Groix, Ré, Oléron, Hyères, Lérins, Frioul), and the overseas territories outside Indochina and North Africa, from the Antilles to Tahiti, plus divisions after the *Bataillon du Pacifique*, the *Régiment Mixte Malgache* and the *Tirailleurs Malgaches* and *Somalis*. Most garrison titles are a plausible extrapolation. Available to every government.

### `FRA_COL_01` — Colonial Divisions
The *troupes coloniales*: the numbered *Divisions d'Infanterie Coloniale* (DIC), the Indochina formations (*Division du Tonkin*, *Division de Cochinchine-Cambodge*, *Division Annam-Tonkin*, the 1ère and 2ème *Brigades du Tonkin*), the 1944-45 *Divisions Coloniales d'Extrême-Orient*, and the 2ème and 8ème *Divisions Légères d'Infanterie Coloniale* of June 1940. The North African formations are in `FRA_AFR_01`.

### `FRA_AFR_01` — Army of Africa Divisions
The *Armée d'Afrique*: the 1ère-7ème *Divisions d'Infanterie Nord-Africaine* and the *Divisions Marocaines* of 1939-40, the *Divisions d'Infanterie d'Afrique* (81ème-88ème, 180ème-183ème), the 1942-45 *Divisions de Marche* of Alger, Constantine, Oran and Morocco, the 2ème DIM, the 3ème and 8ème *Divisions d'Infanterie Algérienne*, and the territorial divisions of Algeria, Tunisia and Morocco. Its own numbering, not linked to infantry.

### `FRA_FFL_01` — Free French Divisions
The *Forces Françaises Libres* and the Liberation: the 1ère and 2ème *Divisions Françaises Libres*, the 1941 light divisions, the Free French brigades, the *Colonne Leclerc*, the *Brigade Indépendante Alsace-Lorraine*, the *Corps Léger d'Intervention* and the *Groupement de Marche de la 2ème DB*. Democratic governments only.

### `FRA_DEF_01` — Defense Divisions
*Divisions de la Défense Nationale*, named after 30 cities, in the tradition of the 1870 *Gouvernement de la Défense Nationale*. Democratic governments only.

### `FRA_INF_METRO_01` — Metropolitan Infantry
The post-liberation *Divisions d'Infanterie Métropolitaine* (1ère-40ème). Democratic governments only.

### `FRA_MIL_FAS_01` — Milice Divisions
*Milice Française* divisions by regional seat (Vichy, Lyon, Marseille...). Alt-history extrapolation: the Milice never formed divisions. Also the collaborationist *Légion des Volontaires Français contre le Bolchevisme*, *Légion Tricolore* and *Phalange Africaine*, and the Milice's *Franc-Garde*. Fascist governments only.

### `FRA_MIL_COM_01` — Francs-Tireurs Divisions
*Francs-Tireurs et Partisans* (FTP) divisions by region of the resistance, plus the *Commune de Paris*. Alt-history extrapolation: the FTP never formed divisions. Communist governments only.

### `FRA_MIL_NEU_01` — Armistice Army Divisions
The *Armée de l'Armistice* of the 1940-42 free zone: the 1er and 2ème *Groupes de Divisions Militaires* and the eight *Divisions Militaires* (7ème Bourg-en-Bresse, 9ème Châteauroux, 12ème Limoges, 13ème Clermont-Ferrand, 14ème Lyon, 15ème Marseille, 16ème Montpellier, 17ème Toulouse) under their own numbers; other numbers use the fallback. Fascist and neutral governments, so that vanilla's Vichy France, which is fascist, sees it.

### `FRA_REV_01` — Volunteer Divisions
The *Volontaires Nationaux* of 1791-93, raised by département, under the 1790 names (*Côte-d'Or*, *Seine-Inférieure*, *Basses-Alpes*) and the annexed *Mont-Blanc* and *Mont-Terrible*. Départements of the Vendée war and the federalist revolts are left out. Democratic governments only.

### `FRA_REV_02` — Republican Demi-Brigades
*Demi-Brigades de Bataille* of the 1793 *amalgame*, named for the Republic's victories (*Fleurus*, *Hondschoote*, *Wattignies*, *Hohenlinden*), its generals and martyrs (*Dampierre*, *Dugommier*, *Beaurepaire*, *Joubert*, *Bara*, *Viala*) and its watchwords (*Patrie en Danger*, *Levée en Masse*), plus divisions of the armies of the Republic (*Armée du Nord*, *de Sambre-et-Meuse*, *de Rhin-et-Moselle*). Democratic governments only.

### `FRA_REV_CAV_01` — Republican Cavalry
The free cavalry corps of 1792-93: the *Hussards de la Mort*, *de la Liberté*, *Noirs* and *de la Montagne*, the *Éclaireurs de Fabrefonds*, and the *Légions des Allobroges*, *des Américains* (the chevalier de Saint-Georges's legion) and *Germanique*. Democratic governments only.

### `FRA_REV_COM_01` — Sans-Culotte Divisions
The Jacobin and sans-culotte tradition: the *Armée Révolutionnaire Parisienne* of 1793, the Montagnards and proto-communists (*Robespierre*, *Saint-Just*, *Marat*, *Babeuf*, *Buonarroti*), and the revolutionary sections of Paris (*Piques*, *Bonnet-Rouge*, *Sans-Culottes*, *Gravilliers*, *Quinze-Vingts*). Girondins and Dantonists are left out. Communist governments only.

### `FRA_GARDE_IMP_01` — Imperial Guard Divisions
The First Empire's *Garde Impériale*: the *Vieille*, *Moyenne* and *Jeune Garde* (whose divisions were numbered up to six in 1813-14), the Waterloo *Divisions de Grenadiers* and *de Chasseurs*, the Guard's infantry corps from the *Grenadiers à Pied* to the *Pupilles* and *Marins*, and its commanders (*Friant*, *Cambronne*, *Drouot*, *Mortier*). Neutral governments only.

### `FRA_GRA_01` — Grande Armée Divisions
Line divisions named for the loyal marshals (*Davout*, *Masséna*, *Lannes*, *Ney*) and the victories of 1796-1815 not used elsewhere in the file (*Rivoli*, *Arcole*, *Friedland*, *Eckmühl*, *La Moskova*, *Montmirail*, *Ligny*), with the 9e léger's *L'Incomparable* under 9 and the 84e's *Un contre dix* under 84. Marshals who went over to the Bourbons or the coalition (Bernadotte, Marmont, Murat and others) are left out. Neutral governments only.

### `FRA_GRA_ARM_01` — Cuirassier Divisions
Armored divisions in the tradition of Napoleon's heavy cavalry, named for its generals (*Nansouty*, *d'Hautpoul*, *Kellermann*, *Milhaud*, *Latour-Maubourg*) and its charges (*Eylau*, *Reichshoffen*), plus the Guard's heavy cavalry (*Grenadiers à Cheval*, *Dragons de l'Impératrice*). Shares numbering with `FRA_ARM_01`. Neutral governments only.

### `FRA_GRA_CAV_01` — Imperial Cavalry Divisions
The Guard's light cavalry (*Chasseurs à Cheval de la Garde*, *Chevau-Légers Polonais*, *Lanciers Rouges*, *Mamelouks*, *Éclaireurs*, *Gardes d'Honneur*) and divisions named for the light cavalry generals (*Lasalle*, *Pajol*, *Colbert*) and the charge at *Somosierra*. Neutral governments only.

### `FRA_SEC_EMP_01` — Second Empire Divisions
Napoleon III's army of 1852-70: the two infantry divisions of the Guard of 1870, the *Zouaves de la Garde*, the Crimean, Mexican and Chinese expeditions, the victories of Crimea and Italy (*Alma*, *Malakoff*, *Sébastopol*, *Magenta*, *Solférino*, *Palikao*, *Camerone*) and the loyal marshals (*Pélissier*, *Canrobert*, *Bosquet*, *Niel*). Bazaine and Mac-Mahon are left out. Neutral governments only.

### `FRA_COMMUNE_01` — Federated Legions
The Commune's *Garde Nationale Fédérée*, organised in *légions* by arrondissement, as *Légions Fédérées*: the *Vengeurs de Flourens* and *Tirailleurs de la Marseillaise*, the quarters and forts of 1871 (*Belleville*, *Montmartre*, *Butte-aux-Cailles*, *Fort d'Issy*), the *Semaine Sanglante* and the *Mur des Fédérés*, and the provincial communes (*Narbonne*, *Le Creusot*). Communist governments only.

### `FRA_COMMUNE_MOT_01` — Commune Motorized Divisions
Motorized divisions named for the Communards of the *Internationale* (*Varlin*, *Frankel*, *Louise Michel*, *Dmitrieff*), *Blanqui*, *Eugène Pottier* and *Temps des Cerises*, and the workers' movement (*Canuts*, *Fourmies*, *Premier Mai*); *Henri Barbusse* and *Vaillant-Couturier* also named battalions of the International Brigades. Shares numbering with `FRA_MOT_01`. Communist governments only.

### `FRA_COMMUNE_ARM_01` — Commune Armored Divisions
Armored divisions named for the Commune's generals and delegates (*Dombrowski*, *Wróblewski*, *Eudes*, *Delescluze*), the *Internationale* and the *Drapeau Rouge*. Shares numbering with `FRA_ARM_01`. Communist governments only.
