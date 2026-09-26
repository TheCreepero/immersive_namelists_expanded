# Mexico

**Country Tag:** `MEX` | **Source File:** [`INEX_MEX_names_divisions.txt`](../common/units/names_divisions/INEX_MEX_names_divisions.txt)

---

## Historical & Alternate-History Overview

In *Hearts of Iron IV: Man the Guns*, Mexico possesses one of the most dynamic and ideologically diverse alternate-history focus trees in the game. From the historic Cristero Rebellion and the institutional Calles Maximato to the restoration of the Third Mexican Empire, Catholic Synarchism (*Unión Nacional Sinarquista*), fascist Gold Shirts (*Acción Revolucionaria Mexicanista*), General Saturnino Cedillo's peasant rebellion, and radical neo-Aztec revanchism (*Recuperación de Aztlán*), Mexico can follow vastly different trajectories.

Vanilla HOI4 provides only three minimal, single-entry placeholder groups (`MEX_INF_01`, `MEX_INF_02`, `MEX_INF_03`). INEX comprehensively expands Mexico with **21 dedicated namelist groups**, overriding the vanilla Cristero placeholder and providing immersive, linguistically verified designations across reactionary, imperial, paramilitary, nativist, and regular armed forces branches.

---

## Namelist Groups Summary

| Group Tag | UI Selector Name | Division Types | Fallback Format |
|:---|:---|:---|:---|
| `MEX_INF_01` | Cristero Guard | infantry | `%da Guardia Cristera` |
| `MEX_CRI_CAV_01` | Cristero Cavalry | cavalry | `%da División de Caballería Cristera` |
| `MEX_CRI_MNT_01` | Cristero Mountain Rangers | mountaineers | `%da División Serrana Cristera` |
| `MEX_IMP_01` | Imperial Guard | infantry | `%da División Imperial Mexicana` |
| `MEX_IMP_CAV_01` | Imperial Cavalry | cavalry, motorized | `%da División de Caballería Imperial` |
| `MEX_IMP_ARM_01` | Imperial Armor | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | `%da División Blindada Imperial` |
| `MEX_PNR_01` | PNR Civic Guards | infantry | `%da División Cívica del PNR` |
| `MEX_SIN_01` | Synarchist Legions & Tercios | infantry | `%da Legión Sinarquista` |
| `MEX_CD_01` | Golden Shirts Cavalry | cavalry, motorized | `%da Brigada Dorada de Caballería` |
| `MEX_CED_01` | Cedillista Militias | infantry, cavalry | `%da Brigada Cedillista` |
| `MEX_HIS_01` | Hispanist Tercios | infantry | `%dº Tercio Novohispano` |
| `MEX_AZT_01` | Army of Anáhuac | infantry | `%da División de Anáhuac` |
| `MEX_AZT_MNT_01` | Otontin Sierra Warriors | mountaineers | `%da Brigada Serrana Otontin` |
| `MEX_REG_INF_01` | Infantry Divisions | infantry | `%da División de Infantería` |
| `MEX_REG_CAV_01` | Cavalry Regiments | cavalry | `%dº Regimiento de Caballería` |
| `MEX_REG_ARM_01` | Armored & Motorized Divisions | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%da División Blindada` |
| `MEX_REG_MAR_01` | Marine Battalions | marine | `%dº Batallón de Infantería de Marina` |
| `MEX_GEN_INF_02` | Named Divisions (Heroes) | infantry, motorized, mechanized | `%da División "Héroes de la Patria"` |
| `MEX_GEN_MNT_01` | Mountain Divisions | mountaineers | `%da División de Montaña` |
| `MEX_GEN_PAR_01` | Airborne & Paratroopers | paratrooper | `%da División Aerotransportada` |
| `MEX_GEN_GAR_01` | Garrison & Homeland Defense | infantry | `%da Brigada de Guarnición de Plaza` |

---

## Detailed Group Descriptions

### 1. Cristero Formations (*Ejército Cristero / Guardia Nacional*)

- **`MEX_INF_01` — Guardia Nacional Cristera**: Direct engine override of the vanilla `MEX_INF_01` placeholder. When Mexico completes focus `MEX_focus_reform_the_cristero_guard`, the spawned veteran units dynamically inherit these authentic historical names. Anchored in historical brigades and regiments from Jalisco, Michoacán, Colima, Guanajuato, Zacatecas, and Durango, honoring commanders such as General Enrique Gorostieta, General Jesús Degollado Guízar, and Father Aristeo Pedroza, as well as the heroic *Brigadas Femeninas de Santa Juana de Arco*.
- **`MEX_CRI_CAV_01` — Cristero Cavalry & Charros**: Mounted irregular squadrons and dragoon regiments specializing in hit-and-run mobile guerrilla warfare across the Bajío and Los Altos de Jalisco. Highlights include Victoriano Ramírez's *Regimiento "El Catorce"*, *Dragones de San Julián*, and *Lanceros de Cristo Rey*.
- **`MEX_CRI_MNT_01` — Cristero Mountain Rangers**: Elite highland irregulars from the Sierra Gorda, Sierra de Jalisco, and the volcanic highlands of Popocatépetl and Nevado de Colima.

### 2. Monarchist & Imperial Formations (*Tercer Imperio Mexicano*)

Unlocked when restoring the monarchy under the House of Iturbide or Habsburg (`MEX_cristero_neutrality` / `MEX_habsburg_empire`):
- **`MEX_IMP_01` — Imperial Mexican Guard & Line Infantry**: Imperial guard grenadiers, palace guards, and line divisions named for Emperor Agustín I, Empress Carlota, Conservative marshals Miguel Miramón and Tomás Mejía, and imperial chivalric orders (*Orden del Águila Mexicana*, *Orden de Guadalupe*).
- **`MEX_IMP_CAV_01` — Imperial Cavalry & Hussars**: Ceremonial and combat horse formations led by the scarlet-uniformed *1er Regimiento de Húsares de la Emperatriz Carlota*, *Dragones de Iturbide*, and *Coraceros Imperiales del Águila*.
- **`MEX_IMP_ARM_01` — Imperial Armored Divisions**: Mechanized and heavy armored spearheads for the restored empire (*Águila Coronada*, *Caballeros de Guadalupe*, *Alcázar de Chapultepec*).

### 3. PNR & Maximato Political Formations (*Callismo*)

- **`MEX_PNR_01` — PNR Civic & Revolutionary Guards**: Armed civic brigades, party shock groups, and rural defense leagues organized during the Maximato (1928–1934) under Plutarco Elías Calles (*Jefe Máximo*). Reflects the institutionalized state apparatus, Calles' secularizing *Grito de Guadalajara*, and the *Plan de Agua Prieta*.

### 4. Sinarquistas, Camisas Doradas, Cedillistas & Tercios

- **`MEX_SIN_01` — Synarchist Legions & Tercios (UNS)**: Formations of the *Unión Nacional Sinarquista* (founded 1937 in León, Guanajuato). Organized into hierarchical *Legiones*, *Tercios*, and *Centurias* under martyrs and leaders José Antonio Urquiza and Salvador Abascal.
- **`MEX_CD_01` — Golden Shirts Shock Cavalry (ARM)**: The mounted paramilitary shock troops of General Nicolás Rodríguez Carrasco's *Acción Revolucionaria Mexicanista*. Features aggressive cavalry and motorized assault columns (*Choque del Zócalo*, *Centauros Dorados*).
- **`MEX_CED_01` — Cedillista Traditionalist Militias**: Regional rural brigades and mounted ranchero forces from General Saturnino Cedillo's anti-Cárdenas 1938 rebellion in San Luis Potosí.
- **`MEX_HIS_01` — Hispanist & New Spain Tercios**: Traditionalist units reviving Spanish *Tercio* military structures across historical viceroyalty territories (*Nueva Galicia*, *Nueva Vizcaya*, *Santa Fe de Nuevo México*, *Capitanía de Yucatán*).

### 5. Indigenist-Nationalist & Revanchist Formations (*Ejército de Anáhuac*)

Unlocked via the Man the Guns revanchist and Aztec revival focus path (*Aztec Eagles*, *Redeem Aztlán*, *Rescind the Mexican Cession*):
- **`MEX_AZT_01` — Army of Anáhuac (Aztec Legions)**: Modernized divisions grounded in pre-Columbian military orders: *Guerreros Águila* (Eagle Warriors), *Guerreros Jaguar* (Jaguar Warriors), sworn vanguard *Cuachicqueh* (The Shorn Ones), and historic tlatoanis (Cuauhtémoc, Cuitláhuac, Tlacaélel, Nezahualcóyotl).
- **`MEX_AZT_MNT_01` — Otontin Sierra Warriors**: Specialized highland shock rangers drawing on Otomí, Zapotec, Mixtec, Tarahumara, and Yaqui martial traditions.

### 6. Regular Mexican Armed Forces Baseline

- **`MEX_REG_INF_01` — Mexican Army Infantry Divisions**: Standard regular divisions numbered and associated with Mexico's historical 30+ regional Military Zones (*Zonas Militares*).
- **`MEX_REG_CAV_01` — Mexican Army Cavalry Regiments**: Historical cavalry numbering system covering peacetime and mobilized horse cavalry regiments (1er–30º Regimiento).
- **`MEX_REG_ARM_01` — Mexican Armored & Motorized Divisions**: Modern armored, motorized, and mechanized cavalry formations.
- **`MEX_REG_MAR_01` — Mexican Marine Battalions**: Naval infantry battalions protecting Mexico's Gulf and Pacific coastlines.

### 7. Generic & Specialized Formations (Universal Ideology)

Usable by any Mexican government regardless of completed focuses:
- **`MEX_GEN_INF_02` — Mexican Named Divisions (National Heroes)**: Full divisions honoring Mexico's historical military commanders and revolutionary leaders (General Ignacio Zaragoza, Padre Miguel Hidalgo, Generalísimo José María Morelos, Benito Juárez, General Vicente Guerrero, Pancho Villa, Emiliano Zapata, Álvaro Obregón, Lázaro Cárdenas, etc.).
- **`MEX_GEN_MNT_01` — Mexican Mountain Divisions**: Specialized alpine formations named after Mexico's mountain systems (*Sierra Madre Occidental*, *Sierra Madre Oriental*, *Eje Neovolcánico*, *Sierra Gorda*, *Altos de Chiapas*).
- **`MEX_GEN_PAR_01` — Mexican Airborne & Paratrooper Divisions**: Airborne battalions and brigades inspired by the historic *Brigada de Fusileros Paracaidistas*.
- **`MEX_GEN_GAR_01` — Mexican Garrison & Homeland Defense Commands**: Port, fortress, and border defense commands for strategic coastal cities and frontiers (*Veracruz / San Juan de Ulúa*, *Tampico*, *Ciudad Juárez*, *Tijuana*, *Acapulco*, *Mazatlán*, *Salina Cruz*).

