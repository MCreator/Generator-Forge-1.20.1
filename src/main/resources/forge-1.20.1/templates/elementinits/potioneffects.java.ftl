<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2023, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->
<#include "../procedures.java.ftl">
/*
 *	MCreator note: This file will be REGENERATED on each build.
 */

package ${package}.init;

<#assign mobHurt = potioneffects?filter(effect -> hasProcedure(effect.onMobHurt))>
<#assign mobRemoved = potioneffects?filter(effect -> hasProcedure(effect.onMobRemoved))>
<#if mobHurt?size != 0 || mobRemoved?size != 0>@Mod.EventBusSubscriber </#if>public class ${JavaModName}MobEffects {

	public static final DeferredRegister<MobEffect> REGISTRY = DeferredRegister.create(ForgeRegistries.MOB_EFFECTS, ${JavaModName}.MODID);

	<#list potioneffects as effect>
	public static final RegistryObject<MobEffect> ${effect.getModElement().getRegistryNameUpper()} =
			REGISTRY.register("${effect.getModElement().getRegistryName()}", () -> new ${effect.getModElement().getName()}MobEffect());
	</#list>

	<#if mobHurt?size != 0>
	@SubscribeEvent public static void onMobHurt(LivingHurtEvent event) {
        <#compress>
        LivingEntity entity = event.getEntity();
		<#list mobHurt as effect>
		if (entity.hasEffect(${JavaModName}MobEffects.${effect.getModElement().getRegistryNameUpper()}.get())) {
			<@procedureCode effect.onMobHurt, {
				"x": "entity.getX()",
				"y": "entity.getY()",
				"z": "entity.getZ()",
				"world": "entity.level()",
				"entity": "entity",
				"amplifier": "entity.getEffect(" + JavaModName + "MobEffects." + effect.getModElement().getRegistryNameUpper() + ".get()).getAmplifier()",
				"damagesource": "event.getSource()",
				"damage": "event.getAmount()"
			}/>
        }
		</#list>
        </#compress>
    }
	</#if>

	<#if mobRemoved?size != 0>
	@SubscribeEvent public static void onMobRemoved(LivingDeathEvent event) {
        <#compress>
        LivingEntity entity = event.getEntity();
        Entity.RemovalReason reason = entity.getRemovalReason();
        if (reason != null && reason == Entity.RemovalReason.KILLED) {
            <#list mobRemoved as effect>
            if (entity.hasEffect(${JavaModName}MobEffects.${effect.getModElement().getRegistryNameUpper()}.get())) {
                <@procedureCode effect.onMobRemoved, {
                    "x": "entity.getX()",
                    "y": "entity.getY()",
                    "z": "entity.getZ()",
                    "world": "entity.level()",
                    "entity": "entity",
                    "amplifier": "entity.getEffect(" + JavaModName + "MobEffects." + effect.getModElement().getRegistryNameUpper() + ".get()).getAmplifier()"
                }/>
            }
            </#list>
        }
        </#compress>
    }
	</#if>
}
<#-- @formatter:on -->