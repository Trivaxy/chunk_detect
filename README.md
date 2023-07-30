# chunk_detect

A datapack library that allows you to listen for chunk generation. 

# Usage

`chunk_detect` will fire all functions that have the tag `#chunk_detect:chunk_generated` when a chunk is generated for the first time by the game.

To register your function as a listener, you will need to add the tag to it by creating a `data/<namespace>/tags/functions/chunk_detect/chunk_generated.json` file, and then specifying the function in the `values` array. For example:

```json
{
  "values": [
    "my_datapack:chunk_listener"
  ]
}
```

This will cause the function `my_datapack:chunk_listener` to be called whenever a chunk is generated.

`chunk_detect` will also supply the location of the chunk that was generated in the scoreboard entries `#chunk_x chunk_detect` and `#chunk_z chunk_detect`. These are coordinates in the chunk grid, not the block grid. For example, if a chunk is generated at block coordinates (0, 0, 0), then `#chunk_x` and `#chunk_z` will be `0` and `0`. If a chunk is generated at block coordinates (32, 0, -16), they will be `2` and `-1` respectively.

**Note: ** If you are playing with datapacks or mods that add new biomes to the game, `chunk_detect` will *not* detect chunks that are generated in them by default. You will need to add those biomes to the `minecraft:all` tag in `data/minecraft/tags/worldgen/biome/all.json` in order to allow `chunk_detect` to detect chunks in them. Adding the biomes to the tag can be done by you or the datapack/mod authors.

# Performance

From testing, the datapack itself has no noticeable impact on TPS. Any performance hits will be caused by the consumer functions that are called when a chunk is generated.

There may be a very slight drop in TPS if a *large* amount of chunks are generated at once (which doesn't happen under normal circumstances), but this drop is only temporary and will immediately resolve itself once the chunks have generated and all the listener functions have been called.