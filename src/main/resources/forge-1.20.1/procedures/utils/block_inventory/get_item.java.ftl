private static ItemStack itemFromBlockInventory(LevelAccessor level, BlockPos pos, int slot) {
    AtomicReference<ItemStack> result = new AtomicReference<>(ItemStack.EMPTY);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
		entity.getCapability(ForgeCapabilities.ITEM_HANDLER, null)
		    .ifPresent(capability -> result.set(capability.getStackInSlot(slot)));

	return result.get();
}