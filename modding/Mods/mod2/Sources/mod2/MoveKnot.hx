package mod2;

class MoveKnot extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {
			var time = iron.system.Time.time();
			object.transform.rot.fromEuler(Math.sin(time), time, Math.sin(time));
			object.transform.buildMatrix();
		});
	}
}
