import crafttweaker.api.bracket.ForgeBracketDumpers;
import crafttweaker.api.bracket.ForgeBracketHandlers;
import crafttweaker.api.bracket.ForgeBracketValidators;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.type.player.Player;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemCooldowns;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.util.InteractionHand;
import crafttweaker.api.util.math.Random;
import crafttweaker.forge.api.event.DetonateExplosionEvent;
import crafttweaker.forge.api.event.entity.living.LivingDeathEvent;
import crafttweaker.forge.api.event.entity.living.LivingEquipmentChangeEvent;
import crafttweaker.forge.api.event.entity.living.LivingHurtEvent;
import crafttweaker.forge.api.event.entity.living.LivingUseTotemEvent;
import crafttweaker.forge.api.event.entity.living.spawn.FinalizeMobSpawnEvent;
import crafttweaker.forge.api.player.interact.RightClickItemEvent;
import crafttweaker.forge.api.event.interact.LeftClickBlockEvent;

//Hammer rebalance

<item:justhammers:stone_hammer>.maxDamage = 284;
<item:justhammers:iron_hammer>.maxDamage = 554;
<item:justhammers:gold_hammer>.maxDamage = 70;
<item:justhammers:diamond_hammer>.maxDamage = 3462;
<item:justhammers:netherite_hammer>.maxDamage = 4498;

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

//cancel firework boosting

events.register<RightClickItemEvent>(event => {
	val itemUsed = event.itemStack;
	if (event.entity.level.isClientSide) {
		return;
	}
	if (itemUsed.withoutTag()) == <item:minecraft:firework_rocket> {
		event.cancel();
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
	println("--- livinghurt start");
	if source != null {
		if lvl.isClientSide {
		return;
		}
		if source.getType() == <entitytype:minecraft:player> {
			if subject.getType() == <entitytype:minecraft:pillager> {
				println("true pillager");
				if subject.data["Wave"] == 0 {
					println("true wave");
					if subject.data["PatrolLeader"] == 1 {
						println("true leader");
						subject.updateData({PatrolLeader: 0});
						subject.updateData({DeathLootTable: "limitless_expanse:entities/ominous_bottle_1"});
					}
				}
			}
		}
	}
	println("--- livinghurt end");
});

//break hammers

events.register<LeftClickBlockEvent>(event => {
	val heldItem = event.itemStack;
	val entity = event.entity;
	val lvl = entity.level;
	if lvl.isClientSide {
		return;
		}
	if <tag:items:limitless_expanse:hammers>.contains(heldItem.registryName) {
		if heldItem.damage >= (heldItem.maxDamage - 1) {
			println("true");
			println(event.hand as string);
			heldItem.asMutable().shrink();
			entity.playSound(<soundevent:minecraft:entity.item.break>, 1.0, 1.0);
			entity.playNotifySound(<soundevent:minecraft:entity.item.break>, <constant:minecraft:sound/source:players>, 1.0, 1.0);
		}
	}
});