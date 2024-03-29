import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.type.player.Player;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemCooldowns;
import crafttweaker.api.util.math.Random;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.bracket.ForgeBracketDumpers;
import crafttweaker.api.bracket.ForgeBracketHandlers;
import crafttweaker.api.bracket.ForgeBracketValidators;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.util.InteractionHand;
import crafttweaker.forge.api.event.entity.living.LivingUseTotemEvent;
import crafttweaker.forge.api.event.entity.living.spawn.FinalizeMobSpawnEvent;
import crafttweaker.forge.api.event.DetonateExplosionEvent;
import crafttweaker.forge.api.player.interact.RightClickItemEvent;

//Hammer rebalance

<item:justhammers:stone_hammer>.maxDamage = 142;
<item:justhammers:iron_hammer>.maxDamage = 277;
<item:justhammers:diamond_hammer>.maxDamage = 1731;
<item:justhammers:netherite_hammer>.maxDamage = 2249;

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