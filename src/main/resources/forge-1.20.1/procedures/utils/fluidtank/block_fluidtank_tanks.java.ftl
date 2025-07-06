private static int getBlockTanks(LevelAccessor level, BlockPos pos, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.FLUID_HANDLER, direction)
		    .ifPresent(capability -> result.set(capability.getTanks()));

	return result.get();
}