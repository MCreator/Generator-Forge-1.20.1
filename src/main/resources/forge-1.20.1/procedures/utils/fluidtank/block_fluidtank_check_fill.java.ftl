private static int fillTankSimulate(LevelAccessor level, BlockPos pos, int amount, Direction direction, Fluid fluid) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.FLUID_HANDLER, direction)
		    .ifPresent(capability -> result.set(capability.fill(new FluidStack(fluid, amount), IFluidHandler.FluidAction.SIMULATE)));

	return result.get();
}