import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.builder.LootConditionBuilder;
import crafttweaker.api.loot.condition.DamageSourceLootCondition;
import crafttweaker.api.predicate.DamageSourcePredicate;
import crafttweaker.api.loot.condition.KilledByPlayerLootCondition;
import crafttweaker.api.loot.condition.WeatherCheckLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.LootTableIdLootCondition;
import crafttweaker.api.predicate.EntityPredicate;
import crafttweaker.api.predicate.EntityEquipmentPredicate;
import crafttweaker.api.predicate.ItemPredicate;
import stdlib.List;

val ominous_bottle1 = <item:minecraft:potion>.withTag({CustomPotionColor: 16777215, CustomPotionEffects: [{Duration: 36000, Id: 31, Amplifier: 0, Ambient: 1}], CustomModelData: 1, display: {Name: "{\"text\":\"Ominous Bottle I\",\"italic\":false}"}});
val ominous_bottle2 = <item:minecraft:potion>.withTag({CustomPotionColor: 16777215, CustomPotionEffects: [{Duration: 36000, Id: 31, Amplifier: 1, Ambient: 1}], CustomModelData: 1, display: {Name: "{\"text\":\"Ominous Bottle II\",\"italic\":false}"}});
val ominous_bottle3 = <item:minecraft:potion>.withTag({CustomPotionColor: 16777215, CustomPotionEffects: [{Duration: 36000, Id: 31, Amplifier: 2, Ambient: 1}], CustomModelData: 1, display: {Name: "{\"text\":\"Ominous Bottle III\",\"italic\":false}"}});
val ominous_bottle4 = <item:minecraft:potion>.withTag({CustomPotionColor: 16777215, CustomPotionEffects: [{Duration: 36000, Id: 31, Amplifier: 3, Ambient: 1}], CustomModelData: 1, display: {Name: "{\"text\":\"Ominous Bottle IV\",\"italic\":false}"}});
val ominous_bottle5 = <item:minecraft:potion>.withTag({CustomPotionColor: 16777215, CustomPotionEffects: [{Duration: 36000, Id: 31, Amplifier: 4, Ambient: 1}], CustomModelData: 1, display: {Name: "{\"text\":\"Ominous Bottle V\",\"italic\":false}"}});

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
	CommonLootModifiers.addAll(<item:endrem:magical_eye>, ominous_bottle4)
);

<entitytype:friendsandfoes:wildfire>.addPlayerOnlyLootModifier(
	"add_nether_eye",
	CommonLootModifiers.add(<item:endrem:nether_eye>)
);

loot.modifiers.register(
	"adding_eyes_to_iceologer_cabin",
	LootConditions.only(LootTableIdLootCondition.create("friendsandfoes:chests/iceologer_cabin")),
	CommonLootModifiers.add(<item:endrem:cold_eye>)
);

loot.modifiers.register(
	"adding_eyes_to_ancient_city",
	LootConditions.only(LootTableIdLootCondition.create("friendsandfoes:chests/iceologer_cabin")),
	CommonLootModifiers.add(<item:endrem:cold_eye>)
);


//Adding ominous potions to loot tables

loot.modifiers.register(
	"adding_bottles_to_outposts",
	LootConditions.only(LootTableIdLootCondition.create("minecraft:chests/pillager_outpost")),
	CommonLootModifiers.addAllWithChance(ominous_bottle1 % 25, ominous_bottle1 % 25, ominous_bottle2 % 20)
);

loot.modifiers.register(
	"adding_bottles_to_mansion",
	LootConditions.only(LootTableIdLootCondition.create("minecraft:chests/woodland_mansion")),
	CommonLootModifiers.addAllWithChance(ominous_bottle1 % 10, ominous_bottle2 % 20, ominous_bottle2 % 25, ominous_bottle3 % 30, ominous_bottle3 % 35, ominous_bottle5 % 5)
);
