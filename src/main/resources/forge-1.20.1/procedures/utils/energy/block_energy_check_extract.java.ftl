private static int extractEnergySimulate(LevelAccessor level, BlockPos pos, int amount, Direction direction) {
    AtomicInteger result = new AtomicInteger(0);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.ENERGY, direction)
		    .ifPresent(capability -> result.set(capability.extractEnergy(amount, true)));

	return result.get();
}