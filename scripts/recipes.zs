import crafttweaker.api.data.IData;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.item.alchemy.Potion;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.recipe.replacement.Replacer;

val block_diamond = <item:minecraft:diamond_block>;
val block_gold = <tag:items:forge:storage_blocks/gold>;
val block_iron = <tag:items:forge:storage_blocks/iron>;
val block_netherite = <item:minecraft:netherite_block>;
val canvas = <item:farmersdelight:canvas>;
val cobble = <tag:items:forge:cobblestone>;
val comb = <item:minecraft:honeycomb>;
val empty = IIngredientEmpty.getInstance();
val ingot_diamond = <tag:items:forge:gems/diamond>;
val ingot_gold = <tag:items:forge:ingots/gold>;
val ingot_iron = <tag:items:forge:ingots/iron>;
val leather = <tag:items:forge:leather>;
val rope = <item:supplementaries:rope>;
val stringItem = <tag:items:forge:string>;
val stick = <tag:items:forge:rods/wooden>;
val sturdy = <item:quark:sturdy_stone>;
val template = <item:minecraft:netherite_upgrade_smithing_template>;
val twine = <item:farmersdelight:rope>;
val slime = <item:minecraft:slime_ball>;
val lead = <item:minecraft:lead>;
val daylight = <item:minecraft:daylight_detector>;
val wooden_slabs = <tag:items:minecraft:wooden_slabs>;
val glass = <item:minecraft:glass>;
val silver = <item:galosphere:silver_ingot>;
val redstone = <item:minecraft:redstone>;
val dust_ash = <item:supplementaries:ash>;
val arrow = <item:minecraft:arrow>;
val arrow_bundle = <item:kubejs:arrow_bundle>;
val nether_ingot = <item:minecraft:netherite_ingot>;
val scale = <item:quark:dragon_scale>;
val unusual_dust = <item:illagerinvasion:unusual_dust>;
val illusion_dust = <item:illagerinvasion:illusionary_dust>;
val emerald = <tag:items:forge:gems/emerald>;
val copper_ingot = <item:minecraft:copper_ingot>;
val packed_mud = <item:minecraft:packed_mud>;
val mud = <item:minecraft:mud>;
val straw = <item:farmersdelight:straw>;

//Recipe additions

craftingTable.addShaped("canvas", <item:farmersdelight:canvas> * 3, [[stringItem, stringItem, stringItem], [stringItem, stringItem, stringItem], [stringItem, stringItem, stringItem]]);

craftingTable.addShapeless("packed_mud", packed_mud, [straw, mud]);

craftingTable.addShapeless("farmer_twine", twine * 2, [straw, straw]);

craftingTable.addShaped("more_bricks", <item:minecraft:bricks> * 4, [[<item:minecraft:brick>, <item:minecraft:brick>], [<item:minecraft:brick>, <item:minecraft:brick>]]);

<recipetype:farmersdelight:cutting>.addJsonRecipe("less_bricks", {
	  "ingredients": [
    {
      "item": "minecraft:bricks"
    }
  ],
  "result": [
    {
      "item": "minecraft:brick"
    }
  ],
  "tool": {
    "type": "farmersdelight:tool_action",
    "action": "pickaxe_dig"
  }
});

craftingTable.addShaped("copper_rail", <item:modernminecarts:copper_rail> * 6, [
	[copper_ingot, empty, copper_ingot], 
	[copper_ingot, stick, copper_ingot], 
	[copper_ingot, redstone, copper_ingot]]);

craftingTable.addShaped("sack_recipe", <item:supplementaries:sack>, [
	[canvas, <item:supplementaries:rope>, canvas],
	[canvas, empty, canvas],
	[canvas, canvas, canvas]]);

craftingTable.addShaped("bundle_recipe", <item:minecraft:bundle>, [
	[empty, <item:supplementaries:rope>, empty],
	[leather, empty, leather],
	[empty, leather, empty]]);

craftingTable.addShapeless("salt_straw_to_shard", <item:galosphere:pink_salt_shard>, [<item:galosphere:pink_salt_straw>]);

craftingTable.addShaped("twine_to_rope", rope * 3, [
	[empty, empty, twine],
	[empty, comb, empty],
	[twine, empty, empty]]);

craftingTable.addShaped("twine_to_lead", lead * 2, [
	[twine, twine, empty],
	[twine, slime, empty],
	[empty, empty, twine]]);

craftingTable.addShaped("silver_daylight_sensor", daylight, [
	[glass, glass, glass],
	[silver, silver, silver],
	[wooden_slabs, wooden_slabs, wooden_slabs]]);

craftingTable.addShaped("silver_relayer", <item:supplementaries:relayer>, [
	[cobble, cobble, cobble], 
	[redstone, redstone, silver], 
	[cobble, cobble, cobble]]);

craftingTable.addShapeless("arrow_bundle", arrow_bundle, [arrow, arrow, arrow, arrow, <item:supplementaries:rope>, arrow, arrow, arrow, arrow]);

craftingTable.addShaped("custom_hallowed_gem", <item:illagerinvasion:hallowed_gem>, [
	[ingot_gold, unusual_dust, ingot_gold],
	[illusion_dust, emerald, illusion_dust],
	[ingot_gold, unusual_dust, ingot_gold]]);

craftingTable.addShaped("prismarine_bricks", <item:minecraft:prismarine_bricks> * 4, [[<item:minecraft:prismarine>, <item:minecraft:prismarine>], [<item:minecraft:prismarine>, <item:minecraft:prismarine>]]);
furnace.addRecipe("dark_prismarine_bricks", <item:minecraft:dark_prismarine>, <item:minecraft:prismarine>, 0.3, 200);
craftingTable.addShaped("prismarine_lantern", <item:minecraft:sea_lantern>, [[<item:minecraft:prismarine_crystals>, <item:minecraft:prismarine_crystals>], [<item:minecraft:prismarine_crystals>, <item:minecraft:prismarine_crystals>]]);

Replacer.create().replace<IItemStack>(<recipecomponent:crafttweaker:output/items>, <item:stoneworks:prismarine_bricks>, <item:minecraft:prismarine_bricks>).execute();

//hammer recipes

smithing.addTransformRecipe("stone_hammer", <item:simplytools:stone_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:stone_pickaxe>, sturdy);
smithing.addTransformRecipe("iron_hammer", <item:simplytools:iron_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:iron_pickaxe>, block_iron);
smithing.addTransformRecipe("gold_hammer", <item:simplytools:golden_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:golden_pickaxe>, block_gold);
smithing.addTransformRecipe("diamond_hammer", <item:simplytools:diamond_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:diamond_pickaxe>, block_diamond);
smithing.addTransformRecipe("netherite_hammer", <item:simplytools:netherite_hammer>, <item:minecraft:netherite_upgrade_smithing_template>, <item:simplytools:diamond_hammer>, <item:minecraft:netherite_ingot>);
	
//Fletching tipped arrows

val potions = [
	<potion:enderzoology:decay>,
	<potion:enderzoology:displacement>,
	<potion:enderzoology:long_decay>,
	<potion:enderzoology:long_rising>,
	<potion:enderzoology:rising>,
	<potion:enderzoology:strong_decay>,
	<potion:enderzoology:strong_displacement>,
	<potion:galosphere:astral>,
	<potion:galosphere:long_astral>,
	<potion:illagerinvasion:berserking>,
	<potion:illagerinvasion:long_berserking>,
	<potion:illagerinvasion:strong_berserking>,
	<potion:minecraft:fire_resistance>,
	<potion:minecraft:harming>,
	<potion:minecraft:healing>,
	<potion:minecraft:invisibility>,
	<potion:minecraft:leaping>,
	<potion:minecraft:long_fire_resistance>,
	<potion:minecraft:long_invisibility>,
	<potion:minecraft:long_leaping>,
	<potion:minecraft:long_night_vision>,
	<potion:minecraft:long_poison>,
	<potion:minecraft:long_regeneration>,
	<potion:minecraft:long_slow_falling>,
	<potion:minecraft:long_slowness>,
	<potion:minecraft:long_strength>,
	<potion:minecraft:long_swiftness>,
	<potion:minecraft:long_turtle_master>,
	<potion:minecraft:long_water_breathing>,
	<potion:minecraft:long_weakness>,
	<potion:minecraft:luck>,
	<potion:minecraft:night_vision>,
	<potion:minecraft:poison>,
	<potion:minecraft:regeneration>,
	<potion:minecraft:slow_falling>,
	<potion:minecraft:slowness>,
	<potion:minecraft:strength>,
	<potion:minecraft:strong_harming>,
	<potion:minecraft:strong_healing>,
	<potion:minecraft:strong_leaping>,
	<potion:minecraft:strong_poison>,
	<potion:minecraft:strong_regeneration>,
	<potion:minecraft:strong_slowness>,
	<potion:minecraft:strong_strength>,
	<potion:minecraft:strong_swiftness>,
	<potion:minecraft:strong_turtle_master>,
	<potion:minecraft:swiftness>,
	<potion:minecraft:turtle_master>,
	<potion:minecraft:water_breathing>,
	<potion:minecraft:weakness>,
	<potion:quark:long_resilience>,
	<potion:quark:resilience>,
	<potion:quark:strong_resilience>
];

for potion in potions {
	val effect = potion.registryName as string;
	println(effect);
	<recipetype:apotheosis:fletching>.addJsonRecipe(
		"tipped_arrow_of_" + (potion.registryName.path as string), {
				"ingredients": [
					<item:kubejs:arrow_bundle>,
					<item:supplementaries:ash>,
					<item:minecraft:potion>.withTag({Potion: effect}) | <item:minecraft:splash_potion>.withTag({Potion: effect}) | <item:minecraft:lingering_potion>.withTag({Potion: effect})
				],
				"result": <item:minecraft:tipped_arrow>.withTag({Potion: effect}) * 8
		}
	);
}

<recipetype:apotheosis:fletching>.addJsonRecipe(
	"torch_arrow_fletching", {
			"ingredients": [
				<item:minecraft:coal> | <item:minecraft:charcoal>,
				<item:minecraft:stick>,
				<item:minecraft:feather>
			],
			"result": <item:quark:torch_arrow> * 6
	}
);

<recipetype:lychee:anvil_crafting>.addJsonRecipe(
	"totem_recharge", 
	{
		"item_in": [<item:kubejs:inert_totem>, <item:illagerinvasion:hallowed_gem>],
		"item_out": <item:minecraft:totem_of_undying>,
		"level_cost": 3
	}
);

//Iridescent block crafting

val iridescent as IItemStack[IIngredient] = {
	<tag:items:minecraft:terracotta>.asIIngredient(): <item:etcetera:iridescent_terracotta>,
	<tag:items:minecraft:wool>.asIIngredient(): <item:etcetera:iridescent_wool>,
	<tag:items:forge:concrete>.asIIngredient(): <item:etcetera:iridescent_concrete>,
	<tag:items:etcetera:glazed_terracotta>.asIIngredient(): <item:etcetera:iridescent_glazed_terracotta>,
	<tag:items:forge:glass_panes>.asIIngredient(): <item:etcetera:iridescent_glass_pane>,
	<tag:items:forge:glass>.asIIngredient(): <item:etcetera:iridescent_glass>,
};

for input, output in iridescent {
	craftingTable.addShapeless("crafting_shapeless_" + output.registryName.path, output, [input, <item:quark:myalite_crystal>]);
}

craftingTable.addShapeless("crafting_shapeless_iridescent_lantern", <item:etcetera:iridescent_lantern>, [<item:minecraft:sea_lantern>, <item:quark:myalite_crystal>]);

craftingTable.addShapeless("crafting_shapeless_iridescent_bars", <item:etcetera:bismuth_bars>, [<item:minecraft:iron_bars>, <item:quark:myalite_crystal>]);

craftingTable.addShapeless("dough_from_bottle", <item:farmersdelight:wheat_dough>, [<item:minecraft:potion>.withTag({Potion: "minecraft:water"}).transformReplace(<item:minecraft:glass_bottle>), <item:minecraft:wheat>]);

//fixing missing chest recipes

	//ashen wood

craftingTable.addShaped("ashen_chest_from_planks", <item:quark:ancient_chest>, [[<item:quark:ancient_planks>, <item:quark:ancient_planks>, <item:quark:ancient_planks>], [<item:quark:ancient_planks>, empty, <item:quark:ancient_planks>], [<item:quark:ancient_planks>, <item:quark:ancient_planks>, <item:quark:ancient_planks>]]);
craftingTable.addShaped("ashen_chest_from_logs", <item:quark:ancient_chest> * 4, [[<tag:items:quark:ancient_logs>, <tag:items:quark:ancient_logs>, <tag:items:quark:ancient_logs>], [<tag:items:quark:ancient_logs>, empty, <tag:items:quark:ancient_logs>], [<tag:items:quark:ancient_logs>, <tag:items:quark:ancient_logs>, <tag:items:quark:ancient_logs>]]);
craftingTable.addShapeless("ashen_trapped_chest", <item:quark:ancient_trapped_chest>, [<item:quark:ancient_chest>, <item:minecraft:tripwire_hook>]);

craftingTable.addShaped("ashen_bookshelves", <item:quark:ancient_bookshelf>, [[<item:quark:ancient_planks>, <item:quark:ancient_planks>, <item:quark:ancient_planks>], [<item:minecraft:book>, <item:minecraft:book>, <item:minecraft:book>], [<item:quark:ancient_planks>, <item:quark:ancient_planks>, <item:quark:ancient_planks>]]);

craftingTable.addShaped("ashen_ladders", <item:quark:ancient_ladder> * 4, [[stick, empty, stick], [stick, <item:quark:ancient_planks>, stick], [stick, empty, stick]]);

	//nether brick

craftingTable.addShaped("nether_brick_chest_from_bricks", <item:quark:nether_brick_chest>, [[<item:minecraft:nether_brick>, <item:minecraft:nether_brick>, <item:minecraft:nether_brick>], [<item:minecraft:nether_brick>, empty, <item:minecraft:nether_brick>], [<item:minecraft:nether_brick>, <item:minecraft:nether_brick>, <item:minecraft:nether_brick>]]);
craftingTable.addShapeless("nether_brick_trapped_chest", <item:quark:nether_brick_trapped_chest>, [<item:quark:nether_brick_chest>, <item:minecraft:tripwire_hook>]);

	//azalea wood

craftingTable.addShaped("azalea_chest_from_planks", <item:quark:azalea_chest>, [[<item:quark:azalea_planks>, <item:quark:azalea_planks>, <item:quark:azalea_planks>], [<item:quark:azalea_planks>, empty, <item:quark:azalea_planks>], [<item:quark:azalea_planks>, <item:quark:azalea_planks>, <item:quark:azalea_planks>]]);
craftingTable.addShaped("azalea_chest_from_logs", <item:quark:azalea_chest> * 4, [[<tag:items:quark:azalea_logs>, <tag:items:quark:azalea_logs>, <tag:items:quark:azalea_logs>], [<tag:items:quark:azalea_logs>, empty, <tag:items:quark:azalea_logs>], [<tag:items:quark:azalea_logs>, <tag:items:quark:azalea_logs>, <tag:items:quark:azalea_logs>]]);
craftingTable.addShapeless("azalea_trapped_chest", <item:quark:azalea_trapped_chest>, [<item:quark:azalea_chest>, <item:minecraft:tripwire_hook>]);

craftingTable.addShaped("azalea_bookshelves", <item:quark:azalea_bookshelf>, [[<item:quark:azalea_planks>, <item:quark:azalea_planks>, <item:quark:azalea_planks>], [<item:minecraft:book>, <item:minecraft:book>, <item:minecraft:book>], [<item:quark:azalea_planks>, <item:quark:azalea_planks>, <item:quark:azalea_planks>]]);

craftingTable.addShaped("azalea_ladders", <item:quark:azalea_ladder> * 4, [[stick, empty, stick], [stick, <item:quark:azalea_planks>, stick], [stick, empty, stick]]);

	//trumpet wood

craftingTable.addShaped("trumpet_chest_from_planks", <item:quark:blossom_chest>, [[<item:quark:blossom_planks>, <item:quark:blossom_planks>, <item:quark:blossom_planks>], [<item:quark:blossom_planks>, empty, <item:quark:blossom_planks>], [<item:quark:blossom_planks>, <item:quark:blossom_planks>, <item:quark:blossom_planks>]]);
craftingTable.addShaped("trumpet_chest_from_logs", <item:quark:blossom_chest> * 4, [[<tag:items:quark:blossom_logs>, <tag:items:quark:blossom_logs>, <tag:items:quark:blossom_logs>], [<tag:items:quark:blossom_logs>, empty, <tag:items:quark:blossom_logs>], [<tag:items:quark:blossom_logs>, <tag:items:quark:blossom_logs>, <tag:items:quark:blossom_logs>]]);
craftingTable.addShapeless("trumpet_trapped_chest", <item:quark:blossom_trapped_chest>, [<item:quark:blossom_chest>, <item:minecraft:tripwire_hook>]);

craftingTable.addShaped("trumpet_bookshelves", <item:quark:blossom_bookshelf>, [[<item:quark:blossom_planks>, <item:quark:blossom_planks>, <item:quark:blossom_planks>], [<item:minecraft:book>, <item:minecraft:book>, <item:minecraft:book>], [<item:quark:blossom_planks>, <item:quark:blossom_planks>, <item:quark:blossom_planks>]]);

craftingTable.addShaped("trumpet_ladders", <item:quark:blossom_ladder> * 4, [[stick, empty, stick], [stick, <item:quark:blossom_planks>, stick], [stick, empty, stick]]);

	//purpur blocks

craftingTable.addShaped("purpur_chest_from_blocks", <item:quark:purpur_chest>, [[<item:minecraft:purpur_block>, <item:minecraft:purpur_block>, <item:minecraft:purpur_block>], [<item:minecraft:purpur_block>, empty, <item:minecraft:purpur_block>], [<item:minecraft:purpur_block>, <item:minecraft:purpur_block>, <item:minecraft:purpur_block>]]);
craftingTable.addShapeless("purpur_trapped_chest", <item:quark:purpur_trapped_chest>, [<item:quark:purpur_chest>, <item:minecraft:tripwire_hook>]);

	//prismarine wood

craftingTable.addShaped("prismarine_chest_from_planks", <item:quark:prismarine_chest>, [[<item:minecraft:prismarine>, <item:minecraft:prismarine>, <item:minecraft:prismarine>], [<item:minecraft:prismarine>, empty, <item:minecraft:prismarine>], [<item:minecraft:prismarine>, <item:minecraft:prismarine>, <item:minecraft:prismarine>]]);
craftingTable.addShapeless("prismarine_trapped_chest", <item:quark:prismarine_trapped_chest>, [<item:quark:prismarine_chest>, <item:minecraft:tripwire_hook>]);

	//leaf carpets

val carpets as IItemStack[IIngredient] = {
	<item:minecraft:oak_leaves>:	<item:quark:oak_leaf_carpet>,
	<item:minecraft:spruce_leaves>:	<item:quark:spruce_leaf_carpet>,
	<item:minecraft:birch_leaves>:	<item:quark:birch_leaf_carpet>,
	<item:minecraft:jungle_leaves>:	<item:quark:jungle_leaf_carpet>,
	<item:minecraft:acacia_leaves>: <item:quark:acacia_leaf_carpet>,
	<item:minecraft:cherry_leaves>: <item:quark:cherry_leaf_carpet>,
	<item:minecraft:dark_oak_leaves>:	<item:quark:dark_oak_leaf_carpet>,
	<item:minecraft:mangrove_leaves>:	<item:quark:mangrove_leaf_carpet>,
	<item:minecraft:azalea_leaves>:	<item:quark:azalea_leaf_carpet>,
	<item:minecraft:flowering_azalea_leaves>:	<item:quark:flowering_azalea_leaf_carpet>,
	<item:quark:ancient_leaves>:	<item:quark:ancient_leaf_carpet>,
	<item:quark:blue_blossom_leaves>:	<item:quark:blue_blossom_leaf_carpet>,
	<item:quark:lavender_blossom_leaves>:	<item:quark:lavender_blossom_leaf_carpet>,
	<item:quark:orange_blossom_leaves>:	<item:quark:orange_blossom_leaf_carpet>,
	<item:quark:yellow_blossom_leaves>:	<item:quark:yellow_blossom_leaf_carpet>,
	<item:quark:red_blossom_leaves>:	<item:quark:red_blossom_leaf_carpet>
};

for input, output in carpets {
	craftingTable.addShaped("crafting_carpet_" + output.registryName.path, output * 4, [[input, input]]);
}

//cutting fish

<recipetype:farmersdelight:cutting>.addJsonRecipe("bass", {
	"ingredients": [<item:naturalist:bass>],
  "result": [<item:kubejs:bass_slice> * 2,
    {
      "item": "minecraft:bone_meal"
    }
  ],
  "tool": {
    "tag": "forge:tools/knives"
  }
});

<recipetype:farmersdelight:cutting>.addJsonRecipe("catfish", {
	"ingredients": [<item:naturalist:catfish>],
  "result": [<item:kubejs:catfish_slice> * 2,
    {
      "item": "minecraft:bone_meal"
    }
  ],
  "tool": {
    "tag": "forge:tools/knives"
  }
});

<recipetype:farmersdelight:cutting>.addJsonRecipe("cooked_bass", {
	"ingredients": [<item:naturalist:cooked_bass>],
  "result": [<item:kubejs:cooked_bass_slice> * 2,
    {
      "item": "minecraft:bone_meal"
    }
  ],
  "tool": {
    "tag": "forge:tools/knives"
  }
});

<recipetype:farmersdelight:cutting>.addJsonRecipe("cooked_catfish", {
	"ingredients": [<item:naturalist:cooked_catfish>],
  "result": [<item:kubejs:cooked_catfish_slice> * 2,
    {
      "item": "minecraft:bone_meal"
    }
  ],
  "tool": {
    "tag": "forge:tools/knives"
  }
});

//sushi rolls

craftingTable.addShapeless("bass_roll", <item:kubejs:bass_roll> * 2, [<item:kubejs:bass_slice>, <item:kubejs:bass_slice>, <item:farmersdelight:cooked_rice>]);

craftingTable.addShapeless("catfish_roll", <item:kubejs:catfish_roll> * 2, [<item:kubejs:catfish_slice>, <item:kubejs:catfish_slice>, <item:farmersdelight:cooked_rice>]);

//cooked fish

furnace.addRecipe("cooked_bass_slice", <item:kubejs:cooked_bass_slice>, <item:kubejs:bass_slice>, 0.35, 200);
furnace.addRecipe("cooked_catfish_slice", <item:kubejs:cooked_catfish_slice>, <item:kubejs:catfish_slice>, 0.35, 200);

smoker.addRecipe("smoked_bass_slice", <item:kubejs:cooked_bass_slice>, <item:kubejs:bass_slice>, 0.35, 100);
smoker.addRecipe("smoked_catfish_slice", <item:kubejs:cooked_catfish_slice>, <item:kubejs:catfish_slice>, 0.35, 100);

//tomato slice recipe

<recipetype:farmersdelight:cutting>.addJsonRecipe("tomato_slice", {
	"ingredients": [<item:farmersdelight:tomato>],
  "result": [<item:kubejs:tomato_slice> * 2,
    {
      "chance": 0.5,
      "item": "farmersdelight:tomato_seeds"
    }
  ],
  "tool": {
    "tag": "forge:tools/knives"
  }
});

//cheaper lanterns

craftingTable.addShaped("cheaper_lantern", <item:minecraft:lantern>, [[empty, <item:minecraft:iron_nugget>, empty], [<item:minecraft:iron_nugget>, <item:minecraft:torch>, <item:minecraft:iron_nugget>], [empty, <item:minecraft:iron_nugget>, empty]]);
craftingTable.addShaped("cheaper_soul_lantern", <item:minecraft:soul_lantern>, [[empty, <item:minecraft:iron_nugget>, empty], [<item:minecraft:iron_nugget>, <item:minecraft:soul_torch>, <item:minecraft:iron_nugget>], [empty, <item:minecraft:iron_nugget>, empty]]);

//new fodder recipe
craftingTable.addShapeless("new_fodder", <item:supplementaries:fodder> * 2, [<item:minecraft:hay_block>, <item:farmersdelight:straw_bale>]);

//duplicate hammer upgrade templates

craftingTable.addShaped("hammer_smithing_template", <item:kubejs:hammer_smithing_template> * 2, [[<tag:items:quark:stone_tool_materials>, <item:kubejs:hammer_smithing_template>, <tag:items:quark:stone_tool_materials>], [<tag:items:quark:stone_tool_materials>, <item:minecraft:diamond>, <tag:items:quark:stone_tool_materials>], [<tag:items:quark:stone_tool_materials>, <tag:items:quark:stone_tool_materials>, <tag:items:quark:stone_tool_materials>]]);

//new gem forge recipe

craftingTable.addShaped("revised_gem_forge", <item:miningmaster:gem_forge>, [[<item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>], [<item:minecraft:blackstone>, <item:illagerinvasion:primal_essence>, <item:minecraft:blackstone>], [<item:minecraft:blackstone>, <item:minecraft:blackstone>, <item:minecraft:blackstone>]]);