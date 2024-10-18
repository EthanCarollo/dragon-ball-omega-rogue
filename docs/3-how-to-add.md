---
title: "3. How to character and levels ?"
description: The to add character and levels
---

# Adding Characters and Levels in JSON

## Characters

To add a new character to the game, you need to follow this JSON structure:

> Ensure that the full_body asset exist before create a record

```json
{
  "id": "character_id",
  "hp": 1000000,
  "type": "normal",
  "name": "Character Name",
  "full_body": "./assets/parts/full/character_image.png",
  "stats": {
    "strength": 9999,
    "intelligence": 9999,
    "wisdom": 9999,
    "armor": 9999
  },
  "attack": [
    {
      "type": "attack_type",
      "name": "Attack Name",
      "min": minimum_damage,
      "max": maximum_damage
    }
  ]
}
```

### Example

Here's an example of a character (Naruto in 4 tails form):

```json
{
  "id": "naruto_4_tails",
  "hp": 1000000,
  "type": "normal",
  "name": "Naruto 4 tails",
  "full_body": "./assets/parts/full/naruto_4tails_evolved.png",
  "stats": {
    "strength": 9999,
    "intelligence": 9999,
    "wisdom": 9999,
    "armor": 9999
  },
  "attack": [
    {
      "type": "strength",
      "name": "Death Ball",
      "min": 1000,
      "max": 40000000
    }
  ]
}
```

## Levels

To add a new level, you should use the following JSON structure:

> The differents decor name can be found by digging into the data/levels.json

```json
{
  "id": "level_id",
  "title": "Level Title",
  "description": "Brief description of the level.",
  "difficulty": "easy | medium | hard",
  "character": "character_id",
  "reward": [
    { "decor": [{"name": "decor_item_1"}, {"name": "decor_item_2"}] },
    { "decor": [{"name": "decor_item_3"}, {"name": "decor_item_4"}] }
  ]
}
```

### Example

Here’s an example of a level featuring Baby Black Vegito:

```json
{
  "id": "level_hard_2_122",
  "title": "Final Baby Black Vegito",
  "description": "Defeat Baby Black Vegito.",
  "difficulty": "hard",
  "character": "baby_black_vegito",
  "reward": [
    { "decor": [{"name": "senzu"}, {"name": "genki_dama_reward"}] },
    { "decor": [{"name": "senzu"}, {"name": "genki_dama_reward"}] },
    { "decor": [{"name": "senzu"}, {"name": "genki_dama_reward"}] }
  ]
}
```

## Notes

- Ensure that the `id` fields are unique for each character and level.
- The `full_body` field should point to the correct image file path.
- The `reward` section can contain multiple items, so feel free to add as many as needed for the level.

By following these structures, you can easily expand the game's roster of characters and levels.