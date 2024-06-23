import crafttweaker.api.data.IData;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.item.alchemy.Potion;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.tag.MCTag;

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

	//hammer recipes

	smithing.addTransformRecipe("stone_hammer", <item:justhammers:stone_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:stone_pickaxe>, sturdy);
	smithing.addTransformRecipe("iron_hammer", <item:justhammers:iron_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:iron_pickaxe>, block_iron);
	smithing.addTransformRecipe("gold_hammer", <item:justhammers:gold_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:golden_pickaxe>, block_gold);
	smithing.addTransformRecipe("diamond_hammer", <item:justhammers:diamond_hammer>, <item:kubejs:hammer_smithing_template>, <item:minecraft:diamond_pickaxe>, block_diamond);
	smithing.addTransformRecipe("netherite_hammer", <item:justhammers:netherite_hammer>, <item:minecraft:netherite_upgrade_smithing_template>, <item:justhammers:diamond_hammer>, <item:minecraft:netherite_ingot>);
	
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

craftingTable.addShaped("new_sea_lantern", <item:minecraft:sea_lantern>, [[<item:minecraft:prismarine_shard>, <item:minecraft:prismarine_crystals>, <item:minecraft:prismarine_shard>], [<item:minecraft:prismarine_crystals>, <item:minecraft:glow_ink_sac>, <item:minecraft:prismarine_crystals>], [<item:minecraft:prismarine_shard>, <item:minecraft:prismarine_crystals>, <item:minecraft:prismarine_shard>]]);

craftingTable.addShaped("kelp_roll_fish", <item:farmersdelight:kelp_roll>, [[<item:farmersdelight:cooked_rice>, <tag:items:limitless_expanse:kelp_roll/fish>, <item:farmersdelight:cooked_rice>],[<item:minecraft:dried_kelp>, <item:minecraft:dried_kelp>, <item:minecraft:dried_kelp>]]);

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

craftingTable.addShapeless("dough_from_bottle", <item:farmersdelight:wheat_dough> * 3, [<item:minecraft:potion>.withTag({Potion: "minecraft:water"}), <item:minecraft:wheat>, <item:minecraft:wheat>, <item:minecraft:wheat>]);