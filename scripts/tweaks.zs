import crafttweaker.api.bracket.ForgeBracketDumpers;
import crafttweaker.api.bracket.ForgeBracketHandlers;
import crafttweaker.api.bracket.ForgeBracketValidators;
import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.type.player.Player;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemCooldowns;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.text.Component;
import crafttweaker.api.util.InteractionHand;
import crafttweaker.api.util.math.Random;
import crafttweaker.api.villagers.VillagerTrades;
import crafttweaker.forge.api.event.DetonateExplosionEvent;
import crafttweaker.forge.api.event.entity.living.LivingDeathEvent;
import crafttweaker.forge.api.event.entity.living.LivingEquipmentChangeEvent;
import crafttweaker.forge.api.event.entity.living.LivingHurtEvent;
import crafttweaker.forge.api.event.entity.living.LivingUseTotemEvent;
import crafttweaker.forge.api.event.entity.living.spawn.FinalizeMobSpawnEvent;
import crafttweaker.forge.api.event.interact.LeftClickBlockEvent;
import crafttweaker.forge.api.player.interact.RightClickItemEvent;
import crafttweaker.forge.api.event.item.PlayerDestroyItemEvent;

//Totem cooldown

events.register<LivingUseTotemEvent>(event => {
	val subject = event.entity;
	val totem = <item:minecraft:totem_of_undying>;
	
	if subject.level.isClientSide {
		return;
	}
	
	if subject.getType() == <entitytype:minecraft:player> {
		val player = subject as Player;
		
		if player.cooldowns.isOnCooldown(totem) {
			event.cancel();
			return;
		}
		
		player.setItemInHand(event.holdingHand, <item:kubejs:inert_totem>);
		player.cooldowns.addCooldown(totem, 1200);
	}
	
	if subject.getType() == <entitytype:minecraft:squid> {
		val squid = subject;
		squid.setItemInHand(event.holdingHand, totem);
	}
});

//rare squid

events.register<FinalizeMobSpawnEvent>(event => {
	val subject = event.entity;
	val lev = subject.level;
	val ran = lev.random;
	val totem = <item:minecraft:totem_of_undying>;
	if lev.isClientSide {
		return;
	}
	if subject.getType() == <entitytype:minecraft:squid> {
		val number = ran.nextInt(1000);
		if number == 999 {
			subject.setItemInHand(<constant:minecraft:interactionhand:main_hand>, totem);
		}
		
	}
});

//ender conversion

events.register<DetonateExplosionEvent>(event => {
	val source = event.explosion.damageSource.directEntity;
	val lev = event.level;
	if source != null {
		if lev.isClientSide {
			return;
		}
		if source.getType() == <entitytype:enderzoology:primed_charge>{
			val bomb_type = source.data["EntityInteraction"];
			if bomb_type == 0 {
				val affected_blocks = event.affectedBlocks;
				for position in affected_blocks {
					val block = lev.getBlockState(position);
					if block == <blockstate:minecraft:stone> {
						lev.setBlockAndUpdate(position, <blockstate:minecraft:end_stone>);
					}
				}
			}
		}
	}
});

//process arrow bundles

events.register<RightClickItemEvent>(event => {
	val itemUsed = event.itemStack;
	if (event.entity.level.isClientSide) {
		return;
	}
	if (itemUsed.withoutTag()).matches(<item:kubejs:arrow_bundle> * itemUsed.amount) {
		itemUsed.asMutable().shrink();
		event.entity.give(<item:minecraft:arrow> * 8);
	}
});

//cancel bad omen from illagers

events.register<LivingHurtEvent>(event => {
	val subject = event.entity;
	val lvl = subject.level;
	val source = event.source.entity;
	if source != null {
		if lvl.isClientSide {
		return;
		}
		if source.getType() == <entitytype:minecraft:player> {
			if subject.getType().isIn(<tag:entity_types:minecraft:raiders>) {
				if subject.data["Wave"] == 0 {
					if subject.data["PatrolLeader"] == 1 {
						subject.updateData({PatrolLeader: 0});
						subject.updateData({DeathLootTable: "limitless_expanse:entities/ominous_bottle_1"});
					}
				}
			}
		}
	}
});

//Adding smithing template tooltip to custom hammer upgrade

<item:kubejs:hammer_smithing_template>.addTooltip(Component.translatable("upgrade.kubejs.hammer_upgrade").withStyle(<constant:minecraft:formatting:gray>));
<item:kubejs:hammer_smithing_template>.addTooltip("");
<item:kubejs:hammer_smithing_template>.addTooltip(Component.translatable("item.minecraft.smithing_template.applies_to").withStyle(<constant:minecraft:formatting:gray>));
<item:kubejs:hammer_smithing_template>.addTooltip(Component.translatable("item.kubejs.smithing_template.hammer_upgrade.applies_to").withStyle(<constant:minecraft:formatting:blue>));
<item:kubejs:hammer_smithing_template>.addTooltip(Component.translatable("item.minecraft.smithing_template.ingredients").withStyle(<constant:minecraft:formatting:gray>));
<item:kubejs:hammer_smithing_template>.addTooltip(Component.translatable("item.kubejs.smithing_template.hammer_upgrade.ingredients").withStyle(<constant:minecraft:formatting:blue>));

//Change stack sizes

<item:minecraft:potion>.setMaxStackSize(16);
<item:minecraft:golden_apple>.setMaxStackSize(16);
<item:minecraft:enchanted_golden_apple>.setMaxStackSize(16);

//Tools downgrade to iron after breaking

val break_to_iron as IItemStack[IItemStack] = {
	<item:minecraft:golden_sword> : <item:minecraft:iron_sword>,
	<item:minecraft:golden_axe> : <item:minecraft:iron_axe>,
	<item:minecraft:golden_shovel> : <item:minecraft:iron_shovel>,
	<item:minecraft:golden_hoe> : <item:minecraft:iron_hoe>,
	<item:minecraft:golden_pickaxe> : <item:minecraft:iron_pickaxe>
};

events.register<PlayerDestroyItemEvent>(event => {
	val broken = event.original;
	val subject = event.entity;
	val player = subject as Player;
	val lvl = subject.level;
	val enchants = broken.getEnchantments();
	val assoc_key = broken.withoutTag();
	println(broken as string);
	if (lvl.isClientSide || !<tag:items:iguanatweaksreborn:not_unbreakable>.contains(broken)) || !(assoc_key in break_to_iron) {
		return;
		}
	if (broken.hasCustomHoverName) {
		player.setItemInHand(event.hand, (break_to_iron[assoc_key]).setEnchantments(enchants).withDisplayName(broken.hoverName));
	} else {
		player.setItemInHand(event.hand, (break_to_iron[assoc_key]).setEnchantments(enchants));
	}
});

//Armor downgrade after breaking

//events.register<LivingHurtEvent>(event => {
//	val subject = event.entity;
//	val lvl = subject.level;
//	val source = event.source.entity;
//	if source != null {
//		if lvl.isClientSide {
//		return;
//		}
//		if subject.getType() == <entitytype:minecraft:player> {
//			val player = subject as Player;
//			val inventory = player.getInventory();
//			val armor = inventory.getArmor(3) as IItemStack;
//			println(armor as string);
//	}
//}});

events.register<LivingEquipmentChangeEvent>(event => {
	val subject = event.entity;
	val lvl = subject.level;
    println("LivingEquipmentChangeEvent ran!");
		if lvl.isClientSide {
		return;
		}
		if subject.getType() == <entitytype:minecraft:player> {
			val player = subject as Player;
			val from = event.from;
			val to = event.to;
			println("Equipment changed from... " + from as IItemStack as string);
			println("to... " + to as IItemStack as string);
			println("In slot... " + event.slot as string);
}});
