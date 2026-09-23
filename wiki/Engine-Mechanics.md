# Engine Mechanics

This page explains how Hearts of Iron IV loads and processes division namelist files, and the technical rules that govern how INEX works.

---

## Additive File Loading

HoI4 loads **all files** in `common/units/names_divisions/` additively at game start. This means:

- A file named `INEX_EST_names_divisions.txt` coexists alongside the vanilla `EST_names_divisions.txt`.
- Both files are active simultaneously.
- There is **no overwrite of the whole file** — only individual group tags can be overridden.

The INEX file naming prefix (`INEX_<TAG>_`) is what ensures INEX files don't collide with vanilla files at the filesystem level.

---

## Tag Overriding vs. Additive Groups

Within the additive loading system, **individual group tags** follow a last-write-wins rule:

| Scenario | Result |
|:---|:---|
| INEX defines `SOV_INF_01` (same as vanilla) | INEX's version **overrides** vanilla for that group |
| INEX defines `EST_KL_01` (new tag, no vanilla equivalent) | INEX adds a **new group** available in-game |
| INEX omits a vanilla group (e.g., `SOV_INF_02`) | Vanilla definition remains **untouched** |

This means:
- You only need to define groups you actually want to change or add.
- Any vanilla group not referenced in INEX continues to work normally.
- Scripted focus tree effects that reference a vanilla tag (e.g., `division_names_group = SOV_INF_02`) will fall back to vanilla automatically if INEX doesn't define that tag.

---

## Group Syntax Reference

```
TAG_CATEGORY_NUM = 
{
    name = "UI Display Name"

    for_countries = { TAG }

    can_use = { always = yes }

    division_types = { "infantry" "motorized" }

    # Optional: link numbering pool with another group
    # link_numbering_with = { OTHER_TAG_CATEGORY_NUM }

    fallback_name = "%d. Unit Name"

    ordered =
    {
        1 = { "1st Specific Name" }
        2 = { "2nd Specific Name" }
        ...
        26 = { "%d. Unit Name" }
    }
}
```

### Field Reference

| Field | Required | Description |
|:---|:---|:---|
| `name` | Yes | Displayed in the in-game namelist selector UI |
| `for_countries` | Yes | Country tag(s) that can use this group |
| `can_use` | Yes | Trigger block — `always = yes` for unconditional; can include ideology/focus checks |
| `division_types` | Yes | List of unit tokens that trigger auto-assignment to this group |
| `link_numbering_with` | No | Shares a numbering pool with another group (only link to *different* groups, never self-link) |
| `fallback_name` | Yes | Used when ordered entries run out; **must** contain `%d` (Arabic) or `%s` (Roman) |
| `ordered` | Yes | Numbered name entries; keys must be **unique integers** |

---

## Valid Division Type Tokens

Only **line combat subunit tokens** are valid in `division_types`:

| Token | Description |
|:---|:---|
| `"infantry"` | Standard infantry |
| `"cavalry"` | Cavalry |
| `"motorized"` | Motorized infantry |
| `"mechanized"` | Mechanized infantry |
| `"light_armor"` | Light armored |
| `"medium_armor"` | Medium armored |
| `"heavy_armor"` | Heavy armored |
| `"modern_armor"` | Modern armor |
| `"marine"` | Marines |
| `"mountaineers"` | Mountain infantry |
| `"paratrooper"` | Paratroopers |
| `"artillery"` | Artillery |
| `"anti_air"` | Anti-aircraft |
| `"militia"` | Militia |
| `"irregular_infantry"` | Irregular infantry |
| `"camelry"` | Camel cavalry |

**Invalid tokens** (do not use):
- `"armor"` — use `"light_armor"` / `"medium_armor"` / etc.
- `"marines"` — use `"marine"`
- `"military_police"` — support-only battalion; not valid here

---

## Numbering Tokens

| Token | Format | Example |
|:---|:---|:---|
| `%d` | Arabic numeral | `%d. Infanterie-Division` → `3. Infanterie-Division` |
| `%s` | Roman numeral | `%s. Divizija` → `III. Divizija` |

Every `fallback_name` **must** include one of these tokens to prevent overflow units from receiving identical unnumbered names.

---

## Ordered Block Rules

1. **Keys must be unique integers.** Duplicate integer keys silently overwrite earlier entries — no error is thrown.
2. **Keys do not need to be sequential.** Gaps are allowed and are often intentional (e.g., preserving historical division numbers).
3. **Empty `ordered = { }` blocks are invalid** — always include at least one entry.
4. **One number token per entry.** Each entry string may contain at most one `%d` or `%s`.

---

## `link_numbering_with`

This field causes two groups to **share a single numbering pool** — used to prevent the same number appearing on two different division templates simultaneously.

**Correct use:** Link different but related groups (e.g., motorized and armored divisions sharing infantry division numbers):
```
FIN_ARM_01 = {
    ...
    link_numbering_with = { FIN_MOT_01 }
    ...
}
```

**Never** use `link_numbering_with` to reference the group itself — this is a self-referential link and will cause errors:
```
# WRONG — do not do this:
EST_REG_01 = {
    link_numbering_with = { EST_REG_01 }
}
```

---

## `can_use` Triggers

The `can_use` block is evaluated in country scope and can include any HoI4 trigger:

```
# Always available:
can_use = { always = yes }

# Only for human players:
can_use = { is_ai = no }

# Government type restriction:
can_use = {
    OR = {
        has_government = fascism
        has_government = neutrality
    }
}

# Focus-gated:
can_use = {
    AND = {
        tag = ENG
        has_completed_focus = ENG_some_focus
    }
}
```

---

## File Encoding Requirements

- **Encoding:** UTF-8 **without BOM** (Byte Order Mark)
- **Line endings:** Either CRLF or LF are accepted
- **Brackets:** All `{` and `}` must be strictly balanced
- **Quotes:** All string arguments must be wrapped in matching `"double quotes"`
- **Special characters:** UTF-8 diacritics (ä, ö, ü, ą, ę, ū, ā, etc.) are fully supported

