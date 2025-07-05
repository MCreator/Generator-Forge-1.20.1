private static double getEntitySubmergedHeight(Entity entity) {
	for (FluidType fluidType : ForgeRegistries.FLUID_TYPES.get().getValues()) {
		if (entity.level().getFluidState(entity.blockPosition()).getFluidType() == fluidType)
			return entity.getFluidTypeHeight(fluidType);
	}
	return 0;
}