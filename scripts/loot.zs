import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.builder.LootConditionBuilder;
import crafttweaker.api.loot.condition.DamageSourceLootCondition;
import crafttweaker.api.predicate.DamageSourcePredicate;
import crafttweaker.api.loot.condition.KilledByPlayerLootCondition;
import crafttweaker.api.loot.condition.WeatherCheckLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.predicate.EntityPredicate;
import crafttweaker.api.predicate.EntityEquipmentPredicate;
import crafttweaker.api.predicate.ItemPredicate;

import stdlib.List;

for modifierName in loot.modifiers.getAllNames() {
    print(modifierName);
}

val modifiers_remove = [
	"endrem:abandoned_mineshaft",
	"endrem:evoker",
	"endrem:nether_bridge",
	"endrem:igloo_chest",
	"endrem:pillager_outpost",
	"endrem:simple_dungeon",
	"endrem:skeleton_horse",
	"endrem:witch",
	"endrem:woodland_mansion",
	"simplehats:hat_lootinject_chest",
	"simplehats:hat_lootinject_entity"
];

for modifierName in modifiers_remove {
	loot.modifiers.removeByName(modifierName);
}

<entitytype:illagerinvasion:invoker>.addPlayerOnlyLootModifier(
	"add_magic_eye", 
	CommonLootModifiers.add(<item:endrem:magical_eye>)
);

<entitytype:friendsandfoes:wildfire>.addPlayerOnlyLootModifier(
	"add_nether_eye",
	CommonLootModifiers.add(<item:endrem:nether_eye>)
);