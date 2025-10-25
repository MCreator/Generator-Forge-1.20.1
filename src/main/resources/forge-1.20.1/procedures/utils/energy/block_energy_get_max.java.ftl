public static int getMaxEnergyStored(LevelAccessor level, BlockPos pos, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.ENERGY, direction)
		    .ifPresent(capability -> result.set(capability.getMaxEnergyStored()));

	return result.get();
}