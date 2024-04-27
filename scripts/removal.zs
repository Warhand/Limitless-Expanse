#priority 99

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.LootTableIdRegexLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.tag.MCTag;

//Recipe removals

craftingTable.removeByModid("justhammers");

furnace.removeByRegex("quark.tweaks.smelting.raw_.*");

smithing.remove(<item:modernminecarts:copper_rail>);

val removeCrafting as IIngredient[] = [
	<item:supplementaries:sack>,
	<item:supplementaries:rope>,
	<item:minecraft:lead>,
	<item:minecraft:daylight_detector>,
	<item:enchantinginfuser:enchanting_infuser>,
	<item:enchantinginfuser:advanced_enchanting_infuser>,
	<item:illagerinvasion:hallowed_gem>,
	<item:supplementaries:relayer>,
	<item:minecraft:packed_mud>,
	<item:farmersdelight:rope>
];

for item in removeCrafting{
	craftingTable.remove(item);
}

val jei_removal as IItemStack[] = [
	<item:justhammers:destructor_core>,
	<item:justhammers:diamond_destructor_hammer>,
	<item:justhammers:diamond_impact_hammer>,
	<item:justhammers:diamond_reinforced_hammer>,
	<item:justhammers:diamond_reinforced_impact_hammer>,
	<item:justhammers:gold_destructor_hammer>,
	<item:justhammers:gold_impact_hammer>,
	<item:justhammers:gold_reinforced_hammer>,
	<item:justhammers:gold_reinforced_impact_hammer>,
	<item:justhammers:impact_core>,
	<item:justhammers:iron_destructor_hammer>,
	<item:justhammers:iron_impact_hammer>,
	<item:justhammers:iron_reinforced_hammer>,
	<item:justhammers:iron_reinforced_impact_hammer>,
	<item:justhammers:netherite_destructor_hammer>,
	<item:justhammers:netherite_impact_hammer>,
	<item:justhammers:netherite_reinforced_hammer>,
	<item:justhammers:netherite_reinforced_impact_hammer>,
	<item:justhammers:reinforced_core>,
	<item:justhammers:reinforced_impact_core>,
	<item:justhammers:stone_destructor_hammer>,
	<item:justhammers:stone_impact_hammer>,
	<item:justhammers:stone_reinforced_hammer>,
	<item:justhammers:stone_reinforced_impact_hammer>,
	<item:supplementaries:bomb>,
	<item:supplementaries:bomb_blue>,
	<item:supplementaries:bomb_blue_projectile>,
	<item:supplementaries:bomb_projectile>,
	<item:supplementaries:bomb_spiky>,
	<item:supplementaries:bomb_spiky_projectile>,
	<item:supplementaries:flax_seeds>,
	<item:supplementaries:flax>,
	<item:supplementaries:wild_flax>,
	<item:supplementaries:flax_block>
];

for item in jei_removal{
	<tag:items:c:hidden_from_recipe_viewers>.add(item);
}

val trash as IIngredient[] = [
	<item:illagerinvasion:imbuing_table>,
	<item:quark:rope>,
	<item:enderzoology:concussion_charge>,
	<item:enderzoology:confusing_charge>,
	<item:enderzoology:confusing_powder>,
	<item:friendsandfoes:totem_of_illusion>,
	<item:friendsandfoes:totem_of_freezing>,
	<item:shieldexp:paragon_shield>,
	<item:shieldexp:griefer_shield>,
	<item:minecraft:shield>,
	<item:endrem:witch_pupil>,
	<item:endrem:undead_soul>,
	<item:quark:backpack>
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