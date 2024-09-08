#priority 99

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.LootTableIdRegexLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.tag.MCTag;

//trade removal

villagerTrades.removeWanderingTrade(2, <item:minecraft:beacon>);

//Recipe removals

furnace.removeByRegex("quark.tweaks.smelting.raw_.*");

smithing.remove(<item:modernminecarts:copper_rail>);

<recipetype:farmersdelight:cutting>.remove(<item:minecraft:brick>);

recipes.removeByRegex("quark.tweaks.crafting.utility.chests.mixed.*");
recipes.removeByRegex("quark.building.crafting.chests.mixed.*");

//removal arrays

val removeCrafting as IIngredient[] = [
	<item:enchantinginfuser:advanced_enchanting_infuser>,
	<item:enchantinginfuser:enchanting_infuser>,
	<item:farmersdelight:rope>,
	<item:illagerinvasion:hallowed_gem>,
	<item:minecraft:daylight_detector>,
	<item:minecraft:lead>,
	<item:minecraft:packed_mud>,
	<item:supplementaries:relayer>,
	<item:supplementaries:rope>,
	<item:supplementaries:sack>,
	<item:farmersdelight:canvas>,
	<item:minecraft:bricks>,
	<item:minecraft:dark_prismarine>,
	<item:minecraft:prismarine_bricks>,
	<item:minecraft:sea_lantern>,
	<item:etcetera:bismuth_bars>,
	<item:etcetera:iridescent_wool>,
	<item:etcetera:iridescent_terracotta>,
	<item:etcetera:iridescent_concrete>,
	<item:etcetera:iridescent_glazed_terracotta>,
	<item:etcetera:iridescent_glass>,
	<item:etcetera:iridescent_glass_pane>,
	<item:etcetera:iridescent_lantern>,
	<item:minecraft:lantern>,
	<item:minecraft:soul_lantern>,
	<item:supplementaries:fodder>,
	<item:simplytools:stone_hammer>,
	<item:simplytools:iron_hammer>,
	<item:simplytools:golden_hammer>,
	<item:simplytools:diamond_hammer>,
	<item:simplytools:netherite_hammer>,
	<item:simplytools:stone_excavator>,
	<item:simplytools:iron_excavator>,
	<item:simplytools:golden_excavator>,
	<item:simplytools:diamond_excavator>,
	<item:simplytools:netherite_excavator>,
	<item:miningmaster:gem_forge>
];

for item in removeCrafting{
	craftingTable.remove(item);
}

val jei_removal as IItemStack[] = [
	<item:supplementaries:bomb_blue_projectile>,
	<item:supplementaries:bomb_blue>,
	<item:supplementaries:bomb_projectile>,
	<item:supplementaries:bomb_spiky_projectile>,
	<item:supplementaries:bomb_spiky>,
	<item:supplementaries:bomb>,
	<item:supplementaries:flax_block>,
	<item:supplementaries:flax_seeds>,
	<item:supplementaries:flax>,
	<item:supplementaries:wild_flax>
];

for item in jei_removal{
	<tag:items:c:hidden_from_recipe_viewers>.add(item);
}

val trash as IIngredient[] = [
	<item:enderzoology:concussion_charge>,
	<item:enderzoology:confusing_charge>,
	<item:enderzoology:confusing_powder>,
	<item:endrem:undead_soul>,
	<item:endrem:witch_pupil>,
	<item:farmersdelight:fried_egg>,
	<item:friendsandfoes:totem_of_freezing>,
	<item:friendsandfoes:totem_of_illusion>,
	<item:illagerinvasion:imbuing_table>,
	<item:illagerinvasion:lost_candle>,
	<item:minecraft:shield>,
	<item:modernminecarts:chipped_copper_upgrade_smithing_template>,
	<item:modernminecarts:copper_upgrade_smithing_template>,
	<item:modernminecarts:damaged_copper_upgrade_smithing_template>,
	<item:quark:backpack>,
	<item:quark:rope>,
	<item:shieldexp:griefer_shield>,
	<item:shieldexp:paragon_shield>,
	<item:sullysmod:tortoise_scute>,
	<item:sullysmod:tortoise_shell>,
	<item:sullysmod:tortoise_egg>,
	<item:etcetera:raw_bismuth>,
	<item:etcetera:bismuth_ingot>,
	<item:etcetera:chisel>,
	<item:etcetera:wrench>,
	<item:etcetera:hammer>,
	<item:etcetera:raw_bismuth_block>,
	<item:etcetera:bismuth_block>,
	<item:etcetera:nether_bismuth_ore>,
	<item:etcetera:item_stand>,
	<item:etcetera:glow_item_stand>,
	<item:quark:spruce_bookshelf>,
	<item:quark:birch_bookshelf>,
	<item:quark:jungle_bookshelf>,
	<item:quark:acacia_bookshelf>,
	<item:quark:dark_oak_bookshelf>,
	<item:quark:crimson_bookshelf>,
	<item:quark:warped_bookshelf>,
	<item:quark:mangrove_bookshelf>,
	<item:quark:cherry_bookshelf>,
	<item:quark:cherry_ladder>,
	<item:quark:warped_ladder>,
	<item:quark:crimson_ladder>,
	<item:quark:acacia_ladder>,
	<item:quark:warped_chest>,
	<item:quark:mangrove_chest>,
	<item:quark:cherry_chest>,
	<item:quark:spruce_ladder>,
	<item:quark:birch_ladder>,
	<item:quark:cherry_trapped_chest>,
	<item:quark:mangrove_trapped_chest>,
	<item:quark:warped_trapped_chest>,
	<item:quark:oak_chest>,
	<item:quark:spruce_chest>,
	<item:quark:birch_trapped_chest>,
	<item:quark:jungle_chest>,
	<item:quark:acacia_chest>,
	<item:quark:dark_oak_chest>,
	<item:quark:crimson_trapped_chest>,
	<item:quark:crimson_chest>,
	<item:quark:dark_oak_trapped_chest>,
	<item:quark:acacia_trapped_chest>,
	<item:quark:jungle_trapped_chest>,
	<item:quark:birch_chest>,
	<item:quark:spruce_trapped_chest>,
	<item:quark:oak_trapped_chest>,
	<item:woodworks:flowering_azalea_leaf_pile>,
	<item:woodworks:oak_leaf_pile>,
	<item:woodworks:spruce_leaf_pile>,
	<item:woodworks:birch_leaf_pile>,
	<item:woodworks:jungle_leaf_pile>,
	<item:woodworks:acacia_leaf_pile>,
	<item:woodworks:dark_oak_leaf_pile>,
	<item:woodworks:mangrove_leaf_pile>,
	<item:woodworks:cherry_leaf_pile>,
	<item:quark:mangrove_ladder>,
	<item:everycomp:abnww/quark/lavender_blossom_leaf_pile>,
	<item:everycomp:abnww/quark/yellow_blossom_leaf_pile>,
	<item:everycomp:abnww/quark/ancient_leaf_pile>,
	<item:woodworks:azalea_leaf_pile>,
	<item:everycomp:abnww/quark/blue_blossom_leaf_pile>,
	<item:everycomp:abnww/quark/red_blossom_leaf_pile>,
	<item:everycomp:abnww/quark/orange_blossom_leaf_pile>,
	<item:quark:dark_oak_ladder>,
	<item:quark:jungle_ladder>,
	<item:quark:bamboo_ladder>,
	<item:quark:bamboo_chest>,
	<item:quark:bamboo_trapped_chest>,
	<item:quark:bamboo_bookshelf>,
	<item:simplytools:wooden_hammer>,
	<item:simplytools:wooden_excavator>
];

for item in trash{
	val stack = item as IItemStack;
	recipes.remove(item);
	item.addTooltip("THIS ITEM IS NOT MEANT TO BE OBTAINABLE, PLEASE REPORT THIS AS AN ISSUE IF YOU COME ACROSS IT WHILE PLAYING");
	for tag in <tagmanager:items>.getTagsFor(stack) {
  tag.remove(stack);
	}
	<tag:items:c:hidden_from_recipe_viewers>.add(stack);
}

loot.modifiers.register(
  "removing_trash_from_chests",
  LootConditions.only(LootTableIdRegexLootCondition.create(".*chests/.*")),
  CommonLootModifiers.removeAll(trash)
);

loot.modifiers.register(
  "removing_trash_from_entities",
  LootConditions.only(LootTableIdRegexLootCondition.create(".*entities/.*")),
  CommonLootModifiers.removeAll(trash)
);