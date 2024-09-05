#priority 98

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.tag.MCTag;

//straw harvesters

val straw_harvesters = [
	<tag:items:minecraft:hoes>
];

for item in straw_harvesters{
	<tag:items:farmersdelight:straw_harvesters>.add(item);
}

//remove farmersdelight ropes from rope tag

<tag:items:supplementaries:ropes>.remove(<item:farmersdelight:rope>);

//add dusts to forge dust tag

val dusts = [
	<item:illagerinvasion:unusual_dust>,
	<item:illagerinvasion:illusionary_dust>,
	<item:enderzoology:withering_dust>,
	<item:enderzoology:withering_dust>
];

for item in dusts {
	<tag:items:forge:dusts>.add(item);
	<tag:items:supplementaries:hourglass_dusts>.add(item);
}

//remove totem from tags

<tag:items:curios:charm>.remove(<item:minecraft:totem_of_undying>);

//Mob capture tags

val rainbow_dash = [
	<entitytype:naturalist:snail>,
	<entitytype:naturalist:butterfly>,
	<entitytype:naturalist:caterpillar>,
	<entitytype:minecraft:bee>,
	<entitytype:naturalist:butterfly>,
	<entitytype:naturalist:caterpillar>,
	<entitytype:minecraft:endermite>,
	<entitytype:minecraft:silverfish>,
	<entitytype:galosphere:spectre>
];

for entity in rainbow_dash {
	<tag:entity_types:supplementaries:jar_catchable>.add(entity);
}

val escaped = [
	<entitytype:minecraft:bee>,
	<entitytype:naturalist:butterfly>,
	<entitytype:naturalist:caterpillar>
];

for entity in escaped {
	<tag:entity_types:supplementaries:cage_catchable>.remove(entity);
}

<tag:entity_types:supplementaries:jar_baby_catchable>.remove(<entitytype:minecraft:rabbit>);

val gotta_catch_em_all = [
	<entitytype:enderzoology:enderminy>,
	<entitytype:enderzoology:owl>,
	<entitytype:enderzoology:wither_cat>,
	<entitytype:friendsandfoes:glare>,
	<entitytype:galosphere:sparkle>,
	<entitytype:minecraft:chicken>,
	<entitytype:minecraft:wolf>,
	<entitytype:naturalist:duck>,
	<entitytype:naturalist:finch>,
	<entitytype:naturalist:lizard>,
	<entitytype:naturalist:rattlesnake>,
	<entitytype:naturalist:coral_snake>,
	<entitytype:naturalist:vulture>,
	<entitytype:minecraft:magma_cube>,
	<entitytype:quark:shiba>,
	<entitytype:minecraft:spider>,
	<entitytype:minecraft:cave_spider>,
	<entitytype:etcetera:chapple>
];

for entity in gotta_catch_em_all {
	<tag:entity_types:supplementaries:cage_catchable>.add(entity);
}

val baby_dont_hurt_me = [
	<entitytype:naturalist:boar>,
	<entitytype:naturalist:deer>,
	<entitytype:naturalist:bear>,
	<entitytype:naturalist:alligator>,
	<entitytype:naturalist:lion>,
	<entitytype:naturalist:tortoise>,
	<entitytype:naturalist:zebra>,
	<entitytype:minecraft:horse>,
	<entitytype:minecraft:hoglin>,
	<entitytype:minecraft:goat>,
	<entitytype:minecraft:mule>,
	<entitytype:minecraft:llama>,
	<entitytype:minecraft:donkey>,
	<entitytype:minecraft:polar_bear>,
	<entitytype:minecraft:zombie>,
	<entitytype:minecraft:zombie_villager>,
	<entitytype:minecraft:zombified_piglin>,
	<entitytype:minecraft:piglin>,
	<entitytype:minecraft:drowned>,
	<entitytype:minecraft:sniffer>,
	<entitytype:minecraft:villager>,
	<entitytype:minecraft:zoglin>,
	<entitytype:naturalist:hippo>,
	<entitytype:naturalist:rhino>,
	<entitytype:minecraft:panda>
];

for entity in baby_dont_hurt_me {
	<tag:entity_types:supplementaries:cage_baby_catchable>.add(entity);
}

val tickable_in_cages = [
	<entitytype:etcetera:chapple>
];

for entity in tickable_in_cages {
	<tag:entity_types:supplementaries:tickable_when_captured>.add(entity);
}

//add hammers to hammers tag

val hammers = [
	<item:justhammers:stone_hammer>,
	<item:justhammers:iron_hammer>,
	<item:justhammers:gold_hammer>,
	<item:justhammers:diamond_hammer>,
	<item:justhammers:netherite_hammer>
];

for item in hammers {
	<tag:items:limitless_expanse:hammers>.add(item);
}

//add end remastered eyes to quad tags

val eyes = [
	<item:endrem:cryptic_eye>,
	<item:endrem:exotic_eye>,
	<item:endrem:undead_eye>,
	<item:endrem:witch_eye>,
	<item:endrem:wither_eye>,
	<item:endrem:magical_eye>,
	<item:endrem:guardian_eye>,
	<item:endrem:evil_eye>,
	<item:endrem:cursed_eye>,
	<item:endrem:rogue_eye>,
	<item:endrem:old_eye>,
	<item:endrem:nether_eye>,
	<item:endrem:lost_eye>,
	<item:endrem:corrupted_eye>,
	<item:endrem:cold_eye>,
	<item:endrem:black_eye>
];

for item in eyes {
	<tag:items:quad:never_despawn>.add(item);
	<tag:items:quad:immune/all>.add(item);
}

//adding eggs to the egg tags

<tag:items:forge:eggs>.add(<item:enderzoology:owl_egg>);
<tag:items:forge:eggs>.add(<item:naturalist:tortoise_egg>);

<tag:items:farmersdelight:cabbage_roll_ingredients>.add(<item:enderzoology:owl_egg>);
<tag:items:farmersdelight:cabbage_roll_ingredients>.add(<item:naturalist:tortoise_egg>);

<tag:items:balm:eggs>.add(<item:enderzoology:owl_egg>);
<tag:items:balm:eggs>.add(<item:naturalist:tortoise_egg>);

<tag:entity_types:pet_cemetery:drops_pet_collar>.add(<entitytype:minecraft:horse>);

//Adding ladders to quark ladders tag

val ladders = [
	<item:woodworks:spruce_ladder>,
	<item:woodworks:birch_ladder>,
	<item:woodworks:jungle_ladder>,
	<item:woodworks:acacia_ladder>,
	<item:woodworks:dark_oak_ladder>,
	<item:woodworks:mangrove_ladder>,
	<item:woodworks:cherry_ladder>,
	<item:woodworks:bamboo_ladder>,
	<item:woodworks:crimson_ladder>,
	<item:woodworks:warped_ladder>
];

val block_ladders = [
	<block:woodworks:spruce_ladder>,
	<block:woodworks:birch_ladder>,
	<block:woodworks:jungle_ladder>,
	<block:woodworks:acacia_ladder>,
	<block:woodworks:dark_oak_ladder>,
	<block:woodworks:mangrove_ladder>,
	<block:woodworks:cherry_ladder>,
	<block:woodworks:bamboo_ladder>,
	<block:woodworks:crimson_ladder>,
	<block:woodworks:warped_ladder>
];

for item in ladders {
	<tag:items:quark:ladders>.add(item);
}

for block in block_ladders {
	<tag:blocks:quark:ladders>.add(block);
}

//adding chests to revertable chest tags
<tag:items:quark:revertable_chests>.add(<tag:items:forge:chests>);

//fish tags

<tag:items:forge:raw_fishes/bass>.add(<item:kubejs:bass_slice>);
<tag:items:forge:raw_fishes/catfish>.add(<item:kubejs:catfish_slice>);

<tag:items:forge:raw_fishes>.add(<item:kubejs:bass_slice>);
<tag:items:forge:raw_fishes>.add(<item:kubejs:catfish_slice>);

<tag:items:forge:cooked_fishes/bass>.add(<item:kubejs:cooked_bass_slice>);
<tag:items:forge:cooked_fishes/catfish>.add(<item:kubejs:cooked_catfish_slice>);

<tag:items:forge:cooked_fishes>.add(<item:kubejs:cooked_bass_slice>);
<tag:items:forge:cooked_fishes>.add(<item:kubejs:cooked_catfish_slice>);

<tag:items:farmersdelight:cabbage_roll_ingredients>.add(<item:kubejs:bass_slice>);
<tag:items:farmersdelight:cabbage_roll_ingredients>.add(<item:kubejs:catfish_slice>);
<tag:items:naturalist:duck_food_items>.add(<item:kubejs:bass_slice>);
<tag:items:naturalist:duck_food_items>.add(<item:kubejs:catfish_slice>);

<tag:items:forge:vegetables>.add(<item:kubejs:tomato_slice>);
<tag:items:forge:vegetables/tomato>.add(<item:kubejs:tomato_slice>);
<tag:items:forge:crops/tomato>.add(<item:kubejs:tomato_slice>);
<tag:items:forge:crops>.add(<item:kubejs:tomato_slice>);

//adding fodder to giraffe food tag
<tag:items:naturalist:giraffe_food_items>.add(<item:supplementaries:fodder>);

//Adding zebras to horse feed tag

<tag:entity_types:farmersdelight:horse_feed_users>.add(<entitytype:naturalist:zebra>);
<tag:entity_types:farmersdelight:horse_feed_tempted>.add(<entitytype:naturalist:zebra>);