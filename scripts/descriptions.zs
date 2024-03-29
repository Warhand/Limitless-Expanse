import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientAny;
import mods.jeitweaker.ingredient.JeiIngredient;
import mods.jeitweaker.Jei;

//Defining a custom function to add descriptions more easily (Thanks to Kazu for this!)

public function description(m as JeiIngredient, s as string) as void {
	Jei.addIngredientInformation(m, [s]);
}

description(<item:farmersdelight:straw>, "A material that can be harvested from grass.");
description(<item:betterarcheology:unidentified_artifact>, "A curious item, that must be studied before it can be identified");