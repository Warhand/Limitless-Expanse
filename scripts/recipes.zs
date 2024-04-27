import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.data.IData;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.alchemy.Potion;

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

craftingTable.addShapeless("packed_mud", packed_mud, [straw, mud]);

craftingTable.addShapeless("farmer_twine", twine * 2, [straw, straw]);

craftingTable.addShaped("copper_rail", <item:modernminecarts:copper_rail> * 6, [
	[copper_ingot, empty, copper_ingot], 
	[copper_ingot, stick, copper_ingot], 
	[copper_ingot, redstone, copper_ingot]]);

craftingTable.addShaped("sack_recipe", <item:supplementaries:sack>, [
	[canvas, twine, canvas],
	[canvas, empty, canvas],
	[canvas, canvas, canvas]]);

craftingTable.addShaped("bundle_recipe", <item:minecraft:bundle>, [
	[leather, twine, leather],
	[leather, empty, leather],
	[leather, leather, leather]]);

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

craftingTable.addShapeless("arrow_bundle", arrow_bundle, [arrow, arrow, arrow, arrow, twine, arrow, arrow, arrow, arrow]);

craftingTable.addShaped("custom_hallowed_gem", <item:illagerinvasion:hallowed_gem>, [
	[ingot_gold, unusual_dust, ingot_gold],
	[illusion_dust, emerald, illusion_dust],
	[ingot_gold, unusual_dust, ingot_gold]]);

	//hammer recipes
	
	craftingTable.addShaped("stone_hammer", <item:justhammers:stone_hammer>, [
			[cobble, sturdy, cobble],
			[empty, stick, empty],
			[empty, stick, empty]
		]);
		
	craftingTable.addShaped("iron_hammer", <item:justhammers:iron_hammer>, [
			[ingot_iron, block_iron, ingot_iron],
			[empty, stick, empty],
			[empty, stick, empty]
		]);
		
	craftingTable.addShaped("gold_hammer", <item:justhammers:gold_hammer>, [
			[ingot_gold, block_gold, ingot_gold],
			[empty, stick, empty],
			[empty, stick, empty]
		]);
		
	craftingTable.addShaped("diamond_hammer", <item:justhammers:diamond_hammer>, [
			[ingot_diamond, block_diamond, ingot_diamond],
			[empty, stick, empty],
			[empty, stick, empty]
		]);
		
	smithing.addTransformRecipe("netherite_hammer", <item:justhammers:netherite_hammer>, template, <item:justhammers:diamond_hammer>, block_netherite);
	
	
//Fletching tipped arrows

val potions = [
	<potion:minecraft:night_vision>,
	<potion:minecraft:long_night_vision>,
	<potion:minecraft:invisibility>,
	<potion:minecraft:long_invisibility>,
	<potion:minecraft:leaping>,
	<potion:minecraft:long_leaping>,
	<potion:minecraft:strong_leaping>,
	<potion:minecraft:fire_resistance>,
	<potion:minecraft:long_fire_resistance>,
	<potion:minecraft:swiftness>,
	<potion:minecraft:long_swiftness>,
	<potion:minecraft:strong_swiftness>,
	<potion:minecraft:slowness>,
	<potion:minecraft:long_slowness>,
	<potion:minecraft:strong_slowness>,
	<potion:minecraft:turtle_master>,
	<potion:minecraft:long_turtle_master>,
	<potion:minecraft:strong_turtle_master>,
	<potion:minecraft:water_breathing>,
	<potion:minecraft:long_water_breathing>,
	<potion:minecraft:healing>,
	<potion:minecraft:strong_healing>,
	<potion:minecraft:harming>,
	<potion:minecraft:strong_harming>,
	<potion:minecraft:poison>,
	<potion:minecraft:long_poison>,
	<potion:minecraft:strong_poison>,
	<potion:minecraft:regeneration>,
	<potion:minecraft:long_regeneration>,
	<potion:minecraft:strong_regeneration>,
	<potion:minecraft:strength>,
	<potion:minecraft:long_strength>,
	<potion:minecraft:strong_strength>,
	<potion:minecraft:weakness>,
	<potion:minecraft:long_weakness>,
	<potion:minecraft:luck>,
	<potion:minecraft:slow_falling>,
	<potion:minecraft:long_slow_falling>,
	<potion:enderzoology:displacement>,
	<potion:enderzoology:strong_displacement>,
	<potion:enderzoology:decay>,
	<potion:enderzoology:long_decay>,
	<potion:enderzoology:strong_decay>,
	<potion:enderzoology:rising>,
	<potion:enderzoology:long_rising>,
	<potion:illagerinvasion:berserking>,
	<potion:illagerinvasion:long_berserking>,
	<potion:illagerinvasion:strong_berserking>,
	<potion:galosphere:astral>,
	<potion:galosphere:long_astral>,
	<potion:quark:resilience>,
	<potion:quark:long_resilience>,
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

craftingTable.addShaped("infuser", <item:enchantinginfuser:enchanting_infuser>, [[empty, <item:minecraft:enchanted_book>, empty], [<item:minecraft:amethyst_shard>, <item:minecraft:crying_obsidian>, <item:minecraft:amethyst_shard>], [<item:minecraft:crying_obsidian>, <item:minecraft:enchanting_table>, <item:minecraft:crying_obsidian>]]);

craftingTable.addShaped("infuser_upgrade", <item:enchantinginfuser:advanced_enchanting_infuser>, [
	[empty, <item:quark:ancient_tome>, empty], 
	[nether_ingot, scale, nether_ingot], 
	[scale, <item:enchantinginfuser:enchanting_infuser>, scale]
]);

<recipetype:lychee:anvil_crafting>.addJsonRecipe(
	"totem_recharge", 
	{
		"item_in": [<item:kubejs:inert_totem>, <item:illagerinvasion:hallowed_gem>],
		"item_out": <item:minecraft:totem_of_undying>,
		"level_cost": 3
	}
);