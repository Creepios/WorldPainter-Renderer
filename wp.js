var world = wp.getWorld()
    .fromFile('/myworld.world') // The filename of the world to load; may be absolute or relative to the current directory
    .go();
wp.exportWorld(world) // The world to export. See "Loading a World"
    .toDirectory('/worldpainter/') // The directory in which to export the world. Should NOT include the world name; a directory with the name of the world will automatically be created inside the specified directory. If a directory with that name already exists it will automatically be backed up
    .go();
