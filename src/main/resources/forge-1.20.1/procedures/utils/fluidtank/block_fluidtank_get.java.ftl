private static int getFluidTankLevel(LevelAccessor level, BlockPos pos, int tank, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.FLUID_HANDLER, direction)
		    .ifPresent(capability -> result.set(capability.getFluidInTank(tank).getAmount()));

	return result.get();
}