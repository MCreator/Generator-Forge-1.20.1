private static int drainTankSimulate(LevelAccessor level, BlockPos pos, int amount, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.FLUID_HANDLER, direction)
		    .ifPresent(capability -> result.set(capability.drain(amount, IFluidHandler.FluidAction.SIMULATE).getAmount()));

	return result.get();
}