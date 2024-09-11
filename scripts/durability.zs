import crafttweaker.api.item.IItemStack;

//change iron equipment durability

var iron_tools as IItemStack[] = [
	<item:minecraft:iron_shovel>,
	<item:minecraft:iron_pickaxe>,
	<item:minecraft:iron_axe>,
	<item:minecraft:iron_hoe>,
	<item:minecraft:iron_sword>,
	<item:farmersdelight:iron_knife>
];

for item in iron_tools {
	item.maxDamage = 512;
}

var iron_armor as IItemStack[] = [
	<item:minecraft:iron_helmet>,
	<item:minecraft:iron_chestplate>,
	<item:minecraft:iron_leggings>,
	<item:minecraft:iron_boots>
];

for item in iron_armor {
	item.maxDamage = 256;
}

<item:simplytools:iron_hammer>.maxDamage = 1024;

//change gold equipment durability

var gold_tools = [
    <item:minecraft:golden_shovel>,
	<item:minecraft:golden_pickaxe>,
	<item:minecraft:golden_axe>,
	<item:minecraft:golden_hoe>,
	<item:minecraft:golden_sword>,
	<item:farmersdelight:golden_knife>
];

for item in gold_tools {
    <tag:items:iguanatweaksreborn:not_unbreakable>.add(item);
    item.maxDamage = 256;
}

<item:minecraft:leather_helmet>.maxDamage = 4;