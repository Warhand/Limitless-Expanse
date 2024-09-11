import crafttweaker.api.data.ListData;
import crafttweaker.api.data.StringData;

val unsorted_enchants = [
    <enchantment:domesticationinnovation:amphibious>,
    <enchantment:domesticationinnovation:blazing_protection>,
    <enchantment:domesticationinnovation:blight_curse>,
    <enchantment:domesticationinnovation:bubbling>,
    <enchantment:domesticationinnovation:chain_lightning>,
    <enchantment:domesticationinnovation:charisma>,
    <enchantment:domesticationinnovation:deflection>,
    <enchantment:domesticationinnovation:defusal>,
    <enchantment:domesticationinnovation:disc_jockey>,
    <enchantment:domesticationinnovation:fireproof>,
    <enchantment:domesticationinnovation:frost_fang>,
    <enchantment:domesticationinnovation:gluttonous>,
    <enchantment:domesticationinnovation:healing_aura>,
    <enchantment:domesticationinnovation:health_boost>,
    <enchantment:domesticationinnovation:health_siphon>,
    <enchantment:domesticationinnovation:herding>,
    <enchantment:domesticationinnovation:immaturity_curse>,
    <enchantment:domesticationinnovation:immunity_frame>,
    <enchantment:domesticationinnovation:infamy_curse>,
    <enchantment:domesticationinnovation:intimidation>,
    <enchantment:domesticationinnovation:linked_inventory>,
    <enchantment:domesticationinnovation:magnetic>,
    <enchantment:domesticationinnovation:muffled>,
    <enchantment:domesticationinnovation:ore_scenting>,
    <enchantment:domesticationinnovation:poison_resistance>,
    <enchantment:domesticationinnovation:psychic_wall>,
    <enchantment:domesticationinnovation:rejuvenation>,
    <enchantment:domesticationinnovation:shadow_hands>,
    <enchantment:domesticationinnovation:speedster>,
    <enchantment:domesticationinnovation:tethered_teleport>,
    <enchantment:domesticationinnovation:total_recall>,
    <enchantment:domesticationinnovation:undead_curse>,
    <enchantment:domesticationinnovation:vampire>,
    <enchantment:domesticationinnovation:void_cloud>,
    <enchantment:domesticationinnovation:warping_bite>,
    <enchantment:enderzoology:decay>,
    <enchantment:enderzoology:repellent>,
    <enchantment:enderzoology:soulbound>,
    <enchantment:enderzoology:withering>,
    <enchantment:farmersdelight:backstabbing>,
    <enchantment:galosphere:enfeeble>,
    <enchantment:galosphere:rupture>,
    <enchantment:galosphere:sustain>,
    <enchantment:lava_walker:lava_walker>,
    <enchantment:minecraft:aqua_affinity>,
    <enchantment:minecraft:bane_of_arthropods>,
    <enchantment:minecraft:binding_curse>,
    <enchantment:minecraft:channeling>,
    <enchantment:minecraft:depth_strider>,
    <enchantment:minecraft:feather_falling>,
    <enchantment:minecraft:fire_aspect>,
    <enchantment:minecraft:fire_protection>,
    <enchantment:minecraft:flame>,
    <enchantment:minecraft:fortune>,
    <enchantment:minecraft:frost_walker>,
    <enchantment:minecraft:infinity>,
    <enchantment:minecraft:knockback>,
    <enchantment:minecraft:looting>,
    <enchantment:minecraft:loyalty>,
    <enchantment:minecraft:luck_of_the_sea>,
    <enchantment:minecraft:lure>,
    <enchantment:minecraft:mending>,
    <enchantment:minecraft:multishot>,
    <enchantment:minecraft:projectile_protection>,
    <enchantment:minecraft:protection>,
    <enchantment:minecraft:punch>,
    <enchantment:minecraft:quick_charge>,
    <enchantment:minecraft:respiration>,
    <enchantment:minecraft:riptide>,
    <enchantment:minecraft:silk_touch>,
    <enchantment:minecraft:smite>,
    <enchantment:minecraft:soul_speed>,
    <enchantment:minecraft:sweeping>,
    <enchantment:minecraft:swift_sneak>,
    <enchantment:minecraft:thorns>,
    <enchantment:minecraft:vanishing_curse>,
    <enchantment:miningmaster:floatation>,
    <enchantment:miningmaster:freezing>,
    <enchantment:miningmaster:grace>,
    <enchantment:miningmaster:heartfelt>,
    <enchantment:miningmaster:knight_jump>,
    <enchantment:miningmaster:leeching>,
    <enchantment:miningmaster:runner>,
    <enchantment:miningmaster:smelting>,
    <enchantment:miningmaster:snowpiercer>,
    <enchantment:miningmaster:stonebreaker>,
    <enchantment:momentum:momentum>,
    <enchantment:supplementaries:stasis>,
    <enchantment:veinmining:vein_mining>,
    <enchantment:minecraft:unbreaking>,
    <enchantment:minecraft:impaling>,
];

var List_diamond = new stdlib.List<StringData>();

var diamond_enchants = [
    <enchantment:minecraft:power>.registryName,
    <enchantment:minecraft:efficiency>.registryName,
    <enchantment:minecraft:sharpness>.registryName,
    <enchantment:minecraft:piercing>.registryName,
    <enchantment:minecraft:blast_protection>.registryName
];

for entry in diamond_enchants {
    List_diamond.add(new StringData(entry));
}

var diamond_json = new ListData(List_diamond);

<recipetype:minecraft:smithing>.addJsonRecipe("diamond_enchants", {
    "type": "miningmaster:gem_smithing_recipe",
    "blacklist": {
        "tag": "miningmaster:gem_enchanting_blacklist"
    },
    "gem": {
        "item": "minecraft:diamond"
    },
    "enchantments": diamond_json
});

<tag:items:minecraft:trim_materials>.add(<item:quark:diamond_heart>);