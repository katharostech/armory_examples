package arm;

import armory.system.Modding;
import iron.Scene;

class LoadMods extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			Modding.loadModsFromListFile("enabled-mods.txt",
				() -> {
					trace("Mods Loaded!");
				},
				(modName) -> {
					Scene.active.addScene('Mods/$modName/Scene', Scene.active.root, (object) -> {});
				}
			);
		});
	}
}
