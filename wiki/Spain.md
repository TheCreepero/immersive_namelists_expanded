# Spain

**Country Tag:** `SPR` | **Source File:** [`zz_INEX_SPR_names_divisions.txt`](../common/units/names_divisions/zz_INEX_SPR_names_divisions.txt)

---

## Historical Overview

In July 1936 the Spanish Army held eight *Divisiones Orgánicas* (Madrid, Sevilla, Valencia, Barcelona, Zaragoza, Burgos, Valladolid, La Coruña) with thirty-two infantry regiments, whose names the Republic had restored in 1935 (*Wad-Ras n.º 1*, *Covadonga n.º 4*, *San Marcial n.º 22*), a cavalry division, two mountain brigades and the Army of Africa: the Legion's *banderas*, the *Grupos de Regulares* and the *Mehal-las* of the Protectorate. The rising split it in two.

The Republic rebuilt its forces as the *Ejército Popular*: militia columns became numbered *Brigadas Mixtas* and divisions, many of which kept the name of their column or commander (*11.ª División 'Líster'*, *26.ª División 'Durruti'*), beside the International Brigades, the Basque *Euzko Gudarostea* and the Catalan columns. The Nationalists fielded the *Divisiones de Navarra*, the Carlist *tercios de requetés* and the Falange *banderas*, and after 1939 numbered their divisions by army corps (11-13 in Madrid, 91-93 and 101-102 in Morocco). The lists follow both armies and extend them in their own patterns; every extended name is built from a real regiment, corps, garrison or figure of that tradition.

INEX replaces all 21 vanilla lists. Vanilla wrote ordinals as `1a` and `1°`; the lists use the Spanish abbreviations *1.ª*, *1.º* and *1.er*, and put the number last where the army did (*Regimiento de Infantería 'León' n.º 2*). Vanilla's *División Blindada* becomes *División Acorazada*, its garrison commands are respelled (*Galicia*, *La Coruña*, *Zaragoza*, *Marruecos*), and terms that no army used (*Brigada Popular*, *Brigada de la Guardia Civil*, *División de la Guardia de Asalto*, *Requeté* as a unit) give way to *Brigada Mixta*, *Tercio de la Guardia Civil*, *Grupo de Asalto* and *Tercio de Requetés*. Twelve of the vanilla lists were empty groups that the civil-war events assign to spawned units; those units now receive historical names. Two of them are filled by what vanilla's script does with them rather than by vanilla's label: `SPD_INF_05` is given to the Basque template and `SPD_INF_04` to the anarchist brigade.

Lists are gated by government type only, never by focus. The game files the Republic as democratic, the Nationalist Directory and the Carlists as non-aligned, the Falange as fascist, the Stalinist and POUM paths as communist and the Anarchist Commune as non-aligned. Because non-aligned covers three opposed camps, the Republican-side lists that events hand out are closed only to a fascist government, and the Nationalist-side lists are open to fascist and non-aligned governments. The army's own lists, the Army of Africa and the security corps are open to all.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Available To |
|:---|:---|:---|:---|:---|
| `SPR_INF_01` | Republican Infantry | infantry | `%d.ª División` | All but fascism |
| `SPR_INF_07` | Republican Infantry (Named) | infantry | `%d.ª División` | All but fascism |
| `SPA_INF_01` | Nationalist Infantry | infantry | `División de Infantería n.º %d` | Fascism or neutrality |
| `SPA_INF_02` | Nationalist Infantry (Named) | infantry | `División de Infantería n.º %d` | Fascism or neutrality |
| `SPR_MOT_01` | Motorized Divisions | motorized | `%d.ª División Motorizada` | All governments |
| `SPR_MEC_01` | Mechanized Divisions | mechanized | `%d.ª División Mecanizada` | All governments |
| `SPR_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `División Acorazada n.º %d` | All governments |
| `SPR_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `División Acorazada n.º %d` | All governments |
| `SPR_REG_01` | Infantry Regiments | infantry | `Regimiento de Infantería n.º %d` | All governments |
| `SPR_CAV_01` | Cavalry Divisions | cavalry | `%d.ª División de Caballería` | All governments |
| `SPR_CAV_02` | Cavalry Regiments | cavalry | `Regimiento de Caballería n.º %d` | All governments |
| `SPR_MNT_01` | Mountain Divisions | mountaineers | `División de Montaña n.º %d` | All governments |
| `SPR_MNT_02` | Mountain Battalions | mountaineers | `Batallón de Cazadores de Montaña n.º %d` | All governments |
| `SPR_MAR_01` | Marine Tercios | marine | `%d.º Tercio de Infantería de Marina` | All governments |
| `SPR_PAR_01` | Paratrooper Banderas | paratrooper | `%s Bandera Paracaidista` | All governments |
| `SPR_GAR_01` | Garrison Commands | infantry | `%d.ª Agrupación de Guarnición` | All governments |
| `SPR_INF_06` | Army of Africa | infantry | `Grupo de Regulares n.º %d` | All governments |
| `SPR_LEG_01` | Legion Banderas | infantry | `%s Bandera de La Legión` | All governments |
| `SPR_INF_04` | Guardia Civil Tercios | infantry | `%d.º Tercio de la Guardia Civil` | All governments |
| `SPR_INF_05` | Assault Guards | infantry | `%d.º Grupo de Asalto` | All governments |
| `SPR_CAR_01` | Carabineros | infantry | `%d.ª Comandancia de Carabineros` | All governments |
| `SPR_INF_02` | Nationalist Garrisons | infantry | `Batallón de Guarnición n.º %d` | Fascism or neutrality |
| `SPR_INF_03` | Requeté Tercios | infantry | `%d.º Tercio de Requetés` | Fascism or neutrality |
| `SPR_FAL_01` | Falange Banderas | infantry, militia | `%d.ª Bandera de Falange` | Fascism only |
| `SPR_VOL_01` | Volunteer Divisions | infantry | `%d.ª División Española de Voluntarios` | Fascism only |
| `SPR_ROY_01` | Royal Regiments | infantry | `Regimiento de la Guardia Real n.º %d` | Neutrality only |
| `SPR_ROY_02` | Royal Cavalry Regiments | cavalry | `Regimiento de Caballería de la Guardia Real n.º %d` | Neutrality only |
| `SPD_INF_03` | Mixed Brigades | infantry | `%d.ª Brigada Mixta` | All but fascism |
| `SPR_INT_01` | International Brigades | infantry | `%d.ª Brigada Internacional` | Democratic or communism |
| `SPD_INF_01` | Republican Garrisons | infantry | `Batallón de Retaguardia n.º %d` | All but fascism |
| `SPD_INF_02` | Socialist Battalions | infantry | `Batallón UGT n.º %d` | All but fascism |
| `SPD_INF_05` | Basque Battalions | infantry | `Euzko Gudarostea, Batallón n.º %d` | All but fascism |
| `SPR_CAT_01` | Catalan Columns | infantry, militia | `Columna Catalana núm. %d` | Democratic or communism |
| `SPR_GUE_01` | Guerrilla Groups | infantry, militia | `%d.ª Agrupación Guerrillera` | Democratic or communism |
| `SPR_RED_01` | People's Militia Battalions | infantry, militia | `Batallón de Milicias Populares n.º %d` | Communism only |
| `SPR_POU_01` | POUM Columns | infantry, militia | `Columna del POUM n.º %d` | Communism only |
| `SPD_INF_06` | Anarchist Columns | infantry, militia | `Columna Confederal n.º %d` | All but fascism |
| `SPD_INF_04` | Anarchist Battalions | infantry | `Batallón Confederal n.º %d` | All but fascism |

---

## Group Details

**Field divisions**

### `SPR_INF_01` — Republican Infantry
Overrides vanilla SPR_INF_01 as the plain variant: fallback only, no nicknames. The People's Army numbered its divisions without an arm, so the fallback is *%d.ª División*. Vanilla's civil-war, Carabineros and Chilean templates use this tag.

### `SPR_INF_07` — Republican Infantry (Named)
Named variant of SPR_INF_01. People's Army divisions under their real numbers, with the column, commander or regional name they carried: *10.ª División 'A'*, *11.ª División 'Líster'*, *26.ª División 'Durruti'*, *27.ª División 'Carlos Marx'*, *35.ª División Internacional*, *43.ª División 'La Heroica'*, the Basque, Santander and Asturian divisions of the Army of the North (*48.ª División Vasca*, *57.ª División Asturiana de Choque*) and the provisional *División del Zújar*.

### `SPA_INF_01` — Nationalist Infantry
Overrides vanilla SPA_INF_01 as the plain variant. It keeps vanilla's 55 division numbers, which follow the 1939 army (the first digit is the army corps), in the post-war form *División de Infantería n.º 11*. Vanilla's focus gate is replaced by government type.

### `SPA_INF_02` — Nationalist Infantry (Named)
Named variant of SPA_INF_01. The wartime *1.ª* to *6.ª División de Navarra*, the *División de Soria* and *División de Ávila*, then the divisions of the 1939 army with regional and battle names in the pattern of *División de Infantería 'Guadarrama' n.º 11*, *'Guzmán el Bueno' n.º 21* and *'Maestrazgo' n.º 31*. Only those three names and the wartime divisions are historical; the rest extends the pattern from corps names (*Aragón*, *Castilla*, *Galicia*), regiments (*San Marcial*, *San Quintín*) and the Moroccan seats (*Tetuán*, *Larache*, *Xauen*, *Melilla*).

### `SPR_MOT_01` — Motorized Divisions
Overrides vanilla SPR_MOT_01: fallback only. Anchor of the mobile numbering.

### `SPR_MEC_01` — Mechanized Divisions
Overrides vanilla SPR_MEC_01: fallback only.

### `SPR_ARM_01` — Armored Divisions
Overrides vanilla SPR_ARM_01 as the plain variant. The Spanish term is *División Acorazada*; vanilla wrote *Blindada*.

### `SPR_ARM_02` — Armored Divisions (Named)
Named variant of SPR_ARM_01. *División Acorazada 'Brunete' n.º 1* was formed in 1943 from the 13.ª División. The other names are those of the cavalry regiments that became Spain's armored regiments (*Villaviciosa*, *Almansa*, *Pavía*, *Lusitania*, *Farnesio*) and are an extension, not history.

**Arms and services**

### `SPR_REG_01` — Infantry Regiments
The 32 regiments of the eight Divisiones Orgánicas in July 1936, four to a division, with the names restored in 1935: *Regimiento de Infantería 'Wad-Ras' n.º 1* and *'León' n.º 2* (Madrid), *'Granada' n.º 6* (Sevilla), *'Badajoz' n.º 13* (Barcelona), *'Aragón' n.º 17* (Zaragoza), *'América' n.º 23* (Pamplona), *'Milán' n.º 32* (Oviedo). Keys 41-50 are island and other regiments under their 1943 numbers (*'Palma' n.º 47*, *'Tenerife' n.º 49*).

### `SPR_CAV_01` — Cavalry Divisions
Overrides vanilla SPR_CAV_01: fallback only. Spain fielded a single División de Caballería.

### `SPR_CAV_02` — Cavalry Regiments
Cavalry regiments under the numbers and arms they held before the 1931 reform: *Regimiento de Lanceros de Farnesio n.º 5*, *Dragones de Santiago n.º 9*, *Cazadores de Lusitania n.º 12*, *Húsares de Pavía n.º 20*, *Cazadores de Taxdir n.º 29*. The regiments with royal titles are in SPR_ROY_02.

### `SPR_MNT_01` — Mountain Divisions
Overrides vanilla SPR_MNT_01. *División de Montaña 'Urgel' n.º 4* and *'Navarra' n.º 5* are post-war divisions; the other names extend the pattern across the Pyrenees and the other ranges (*Pirineos*, *Roncesvalles*, *Jaca*, *Valle de Arán*, *Picos de Europa*).

### `SPR_MNT_02` — Mountain Battalions
The Batallones de Cazadores de Montaña of the two mountain brigades of 1936 (*'Flandes' n.º 5*, *'Garellano' n.º 6*, *'Arapiles' n.º 7*, *'Sicilia' n.º 8*), older cazadores names and the mountain regiments of 1943 (*'Barcelona' n.º 63*, *'Galicia' n.º 64*).

### `SPR_MAR_01` — Marine Tercios
Overrides vanilla SPR_MAR_01. The Infantería de Marina by naval department (*Tercio del Norte*, *Tercio del Sur*, *Tercio de Levante*, *Tercio de Baleares*) and the four tercios of the 16th century from which the corps descends (*Tercio Nuevo de la Mar de Nápoles*, *Tercio de la Armada del Mar Océano*).

### `SPR_PAR_01` — Paratrooper Banderas
Overrides vanilla SPR_PAR_01. Spain's paratroop arm dates from 1947-60, so the list is short: *I Bandera Paracaidista 'Roger de Flor'*, *II 'Roger de Lauria'*, *III 'Ortiz de Zárate'*, the air force's bandera and three names in the same almogávar tradition.

### `SPR_GAR_01` — Garrison Commands
Overrides vanilla SPR_GAR_01 and keeps its 18 commands under the same keys, respelled and with the terms of 1936: *Comandancia Militar de Baleares*, *Circunscripción Occidental de Marruecos*, *Gobierno Militar de Zaragoza*. Vanilla's *Circunscripción Maestrazgo* was not a command and is replaced by the *Circunscripción Oriental de Marruecos*.

**Army of Africa**

### `SPR_INF_06` — Army of Africa
Overrides vanilla SPR_INF_06, the group of the event template *División del Ejército de África*. The ten *Grupos de Regulares* (*Tetuán n.º 1*, *Melilla n.º 2*, *Ceuta n.º 3*, *Larache n.º 4*, *Alhucemas n.º 5*), the *Mehal-las Jalifianas*, the *Tiradores de Ifni* and the *Cazadores de África*.

### `SPR_LEG_01` — Legion Banderas
The banderas of the Tercio de Extranjeros, La Legión, in Roman numerals: *I Bandera de La Legión 'Casa de Borgoña'*, *III 'Tigres de Buharrat'*, *IV 'Cristo de Lepanto'*, *X 'Millán Astray'*, and its four tercios (*1.er Tercio 'Gran Capitán'*). The banderas named after Nationalist commanders and victories are left out, because the list is open to every government.

**Security corps**

### `SPR_INF_04` — Guardia Civil Tercios
Overrides vanilla SPR_INF_04 (*Brigada de la Guardia Civil*). The corps was organized in tercios and comandancias, 24 tercios in 1936; the list names them by seat (*Tercio de la Guardia Civil de Madrid*, *Tercio Móvil de Madrid*).

### `SPR_INF_05` — Assault Guards
Overrides vanilla SPR_INF_05 (*División de la Guardia de Asalto*). The Cuerpo de Seguridad y Asalto was organized in groups, named here by city (*Grupo de Asalto de Barcelona*).

### `SPR_CAR_01` — Carabineros
The Cuerpo de Carabineros, the coast and frontier guard, by comandancia (*Comandancia de Carabineros de Gerona*, *de Algeciras*, *de Guipúzcoa*).

**Nationalist side**

### `SPR_INF_02` — Nationalist Garrisons
Overrides vanilla SPR_INF_02, the group of the Nationalist garrison template of the civil-war event. Garrisons that joined the rising of July 1936: *Guarnición de Pamplona*, *de Burgos*, *de Sevilla*, *de Melilla*, *Guarnición del Alcázar de Toledo*.

### `SPR_INF_03` — Requeté Tercios
Overrides vanilla SPR_INF_03, the group of the event template *Requeté Carlista*. The Carlist militia fought in tercios named after battles, saints and princes of the Carlist cause: *Tercio de Montejurra*, *Tercio de Lácar*, *Tercio de Oriamendi*, *Tercio de Zumalacárregui*, *Tercio de Nuestra Señora de Montserrat*, *Tercio de la Virgen de los Reyes*.

### `SPR_FAL_01` — Falange Banderas
The militia of Falange Española de las JONS in banderas (battalions) and centurias (companies): *Bandera 'Leones de Castilla'*, *Bandera Legionaria Gallega*, *Centuria 'Onésimo Redondo'*, and regional banderas (*1.ª Bandera de Falange de Navarra*).

### `SPR_VOL_01` — Volunteer Divisions
The *División Española de Voluntarios* (the División Azul of 1941-43) with its regiments (*Regimiento 262 'Pimentel'*, *263 'Vierna'*, *269 'Esparza'*), the *Legión Española de Voluntarios* that followed it, and the mixed *Flechas* divisions of 1937-39.

### `SPR_ROY_01` — Royal Regiments
The palace guard (*Real Cuerpo de Guardias Alabarderos*) and the infantry regiments with royal titles, under the numbers they held until 1931: *Regimiento de Infantería 'Inmemorial del Rey' n.º 1*, *'La Reina' n.º 2*, *'Príncipe' n.º 3*, *'Borbón' n.º 17*.

### `SPR_ROY_02` — Royal Cavalry Regiments
The *Escuadrón de la Escolta Real* and the cavalry regiments with royal titles: *Regimiento de Lanceros del Rey n.º 1*, *Húsares de la Princesa n.º 19*, *Cazadores de Alfonso XIII n.º 24*.

**Republican side**

### `SPD_INF_03` — Mixed Brigades
Overrides vanilla SPD_INF_03 (*Brigada Popular*). The People's Army's *Brigadas Mixtas* under their real numbers: former columns (*32.ª Brigada Mixta 'Mangada'*, *83.ª 'Columna de Hierro'*, *119.ª 'Durruti'*), the Carabineros brigades (*3.ª*, *5.ª*, *65.ª*), shock brigades and the *151.ª Brigada Mixta de Infantería de Marina*.

### `SPR_INT_01` — International Brigades
The International Brigades of 1936-38 (*XI Brigada Internacional 'Thälmann'*, *XII 'Garibaldi'*, *XIII 'Dąbrowski'*, *XIV 'La Marsellesa'*, *XV 'Abraham Lincoln'*) and their battalions (*Batallón 'Edgar André'*, *'Commune de Paris'*, *'Mackenzie-Papineau'*, *'Đuro Đaković'*).

### `SPD_INF_01` — Republican Garrisons
Overrides vanilla SPD_INF_01, the group of the Republican garrison template of the civil-war event. Garrisons of the cities that stayed loyal in July 1936: *Guarnición de Madrid*, *de Barcelona*, *de Valencia*, *de Bilbao*, *de Cartagena*.

### `SPD_INF_02` — Socialist Battalions
Overrides vanilla SPD_INF_02 (*Brigada de Juventudes Sindicales*). Militia battalions of the UGT, the PSOE and the Juventudes Socialistas Unificadas: *Batallón 'Pablo Iglesias'*, *'Largo Caballero'*, *'Jean Jaurès'*, *'Octubre' n.º 11*, *'Joven Guardia'*, *'UHP'*.

### `SPD_INF_05` — Basque Battalions
Overrides vanilla SPD_INF_05, the tag vanilla's focus gives to its Basque template. The battalions of the Euzko Gudarostea raised by the Basque nationalist parties, with their Basque names in the period spelling: *Batallón 'Arana Goiri'*, *'Itxarkundia'*, *'Amaiur'*, *'Gordexola'*, *'Euzko Indarra'*, *'Lenago Il'*.

### `SPR_CAT_01` — Catalan Columns
Forces of the Generalitat and of the Catalan republican parties in 1936-37, in Catalan: *Columna Macià-Companys*, *Regiment Pirinenc núm. 1 de Catalunya*, *Milícies Alpines*, *Grup Alpí*, and battalions named in the same tradition (*Batalló 'Francesc Layret'*).

### `SPR_GUE_01` — Guerrilla Groups
The People's Army's *XIV Cuerpo de Ejército Guerrillero* and the Republican guerrilla groupings of 1939-45 in Spain and France: *Agrupación Guerrillera de Levante y Aragón*, *Federación de Guerrillas de León-Galicia*, *Agrupación de Guerrilleros Españoles*, *Compañía 'La Nueve'*.

**Revolutionary left**

### `SPR_RED_01` — People's Militia Battalions
Communist militias: the PCE's *5.º Regimiento de Milicias Populares* and its units (*Compañías de Acero*, *Batallón 'Thaelmann'*, *'Comuna de París'*, *'Pasionaria'*), the Basque communist battalions (*'Rosa Luxemburgo'*, *'Karl Liebknecht'*) and the PSUC's *Columna Carlos Marx*.

### `SPR_POU_01` — POUM Columns
Militias of the Partido Obrero de Unificación Marxista, kept apart from the PCE lists: *Columna Lenin*, *Columna Joaquín Maurín*, *Batallón de Choque del POUM*, *Batallón 'Andreu Nin'*.

### `SPD_INF_06` — Anarchist Columns
Overrides vanilla SPD_INF_06, the group of the focus template *Anarchist Militia*. The CNT-FAI columns of 1936: *Columna Durruti*, *Columna Ascaso*, *Columna de Hierro*, *Columna Tierra y Libertad*, *Columna Los Aguiluchos*, *Centuria 'Sébastien Faure'*.

### `SPD_INF_04` — Anarchist Battalions
Overrides vanilla SPD_INF_04, the tag vanilla's event gives to the template *Brigada Anarquista*. CNT battalions of Madrid, Euzkadi and Santander: *Batallón 'Isaac Puente'*, *'Malatesta'*, *'Bakunin'*, *'Sacco-Vanzetti'*, *'Orobón Fernández'*.
