import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.builder.LootConditionBuilder;
import crafttweaker.api.loot.condition.DamageSourceLootCondition;
import crafttweaker.api.loot.condition.EntityPropertyLootCondition;
import crafttweaker.api.loot.condition.KilledByPlayerLootCondition;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.LootTableIdLootCondition;
import crafttweaker.api.loot.condition.WeatherCheckLootCondition;
import crafttweaker.api.loot.EntityTarget;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.predicate.builder.EntityEquipmentPredicateBuilder;
import crafttweaker.api.predicate.builder.EntityPredicateBuilder;
import crafttweaker.api.predicate.DamageSourcePredicate;
import crafttweaker.api.predicate.EntityEquipmentPredicate;
import crafttweaker.api.predicate.EntityPredicate;
import crafttweaker.api.predicate.EntityTypePredicate;
import crafttweaker.api.predicate.ItemPredicate;
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

//End remastered eye modifiers

<entitytype:illagerinvasion:invoker>.addPlayerOnlyLootModifier(
	"add_magic_eye", 
	CommonLootModifiers.addAll(<item:endrem:magical_eye>, ominous_bottle4)
);

<entitytype:friendsandfoes:wildfire>.addPlayerOnlyLootModifier(
	"add_nether_eye",
	CommonLootModifiers.add(<item:endrem:nether_eye>)
);

<entitytype:enderzoology:wither_witch>.addPlayerOnlyLootModifier(
	"add_witch_eye",
	CommonLootModifiers.addWithChance(<item:endrem:witch_eye> % 10)
);

<entitytype:minecraft:piglin_brute>.addPlayerOnlyLootModifier(
	"add_cursed_eye",
	CommonLootModifiers.addWithChance(<item:endrem:cursed_eye> % 5)
);

loot.modifiers.register(
	"adding_eyes_to_iceologer_cabin",
	LootConditions.only(LootTableIdLootCondition.create("friendsandfoes:chests/iceologer_cabin")),
	CommonLootModifiers.add(<item:endrem:cold_eye>)
);

loot.modifiers.register(
	"adding_eyes_to_ocean_monument",
	LootConditions.only(LootTableIdLootCondition.create("betteroceanmonuments:chests/upper_side_chamber")),
	CommonLootModifiers.add(<item:endrem:guardian_eye>)
);

loot.modifiers.register(
	"adding_eyes_to_abandoned_places",
	LootConditions.anyOf(
		LootTableIdLootCondition.create("friendsandfoes:chests/iceologer_cabin"), 
		LootTableIdLootCondition.create("minecraft:chests/igloo_chest"),
		LootTableIdLootCondition.create("minecraft:chests/ruined_portal"),
		LootTableIdLootCondition.create("minecraft:chests/shipwreck_treasure"),
		LootTableIdLootCondition.create("minecraft:chests/abandoned_mineshaft"),
		LootTableIdLootCondition.create("minecraft:chests/ancient_city"),
		LootTableIdLootCondition.create("minecraft:chests/underwater_ruin_big"),
		LootTableIdLootCondition.create("minecraft:chests/underwater_ruin_small"),
		LootTableIdLootCondition.create("nova_structures:chests/ruin_loot_master"),
		LootTableIdLootCondition.create("betterjungletemples:chests/treasure"),
		LootTableIdLootCondition.create("betterdeserttemples:chests/storage"),
		LootTableIdLootCondition.create("betterdungeons:zombie_dungeon/chests/common"),
		LootTableIdLootCondition.create("betterdungeons:spider_dungeon/chests/egg_room"),
		LootTableIdLootCondition.create("betterdungeons:small_nether_dungeon/chests/common"),
		LootTableIdLootCondition.create("betterdungeons:skeleton_dungeon/chests/middle"),
		LootTableIdLootCondition.create("betterdeserttemples:chests/tomb"),
		LootTableIdLootCondition.create("minecraft:chests/simple_dungeon"),
		LootTableIdLootCondition.create("betterdeserttemples:chests/library")
	),
	CommonLootModifiers.addWithChance(<item:endrem:lost_eye> % 5)
);

villagerTrades.addWanderingTrade(1, 16, <item:endrem:exotic_eye>, 1, 8);

loot.modifiers.register("adding_eyes_to_pharaoh", 
	LootConditions.allOf(
		EntityPropertyLootCondition.create(<constant:minecraft:entitytarget:this>, EntityPredicate.create().equipment(EntityEquipmentPredicate.create().head(ItemPredicate.create(
			<item:minecraft:player_head>.withTag({SkullOwner: {Id: [2077364630, 2146582607, -1367858599, -232605091], Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTM1MGMwNDk5YTY4YmNkOWM3NWIyNWMxOTIzMTQzOWIxMDhkMDI3NTlmNDM1ZTMzZTRhZWU5ZWQxZGQyNDFhMiJ9fX0="}]}}, Enchantments: [{}]})
		)))),
		EntityPropertyLootCondition.create(<constant:minecraft:entitytarget:this>, EntityPredicate.create(<entitytype:minecraft:husk>))
	),
	CommonLootModifiers.add(<item:endrem:old_eye>)
);

loot.modifiers.register(
	"adding_eye_to_jungle_temple",
	LootConditions.only(LootTableIdLootCondition.create("betterjungletemples:chests/treasure")),
	CommonLootModifiers.add(<item:endrem:rogue_eye>)
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

//Adding hammer smithing template to mineshaft chests

loot.modifiers.register(
	"adding_smithing_template_mineshaft",
	LootConditions.only(LootTableIdLootCondition.create("minecraft:chests/abandoned_mineshaft")),
	CommonLootModifiers.replaceStackWith(<item:galosphere:silver_upgrade_smithing_template>, <item:kubejs:hammer_smithing_template>)
);