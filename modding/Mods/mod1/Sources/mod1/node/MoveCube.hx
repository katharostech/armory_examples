package mod1.node;

@:keep class MoveCube extends armory.logicnode.LogicTree {

	public function new() { super(); notifyOnAdd(add); }

	override public function add() {
		var _SetLocation = new armory.logicnode.SetLocationNode(this);
		var _OnUpdate = new armory.logicnode.OnUpdateNode(this);
		_OnUpdate.addOutputs([_SetLocation]);
		_SetLocation.addInput(_OnUpdate, 0);
		var _Self = new armory.logicnode.SelfNode(this);
		var _GetLocation = new armory.logicnode.GetLocationNode(this);
		_GetLocation.addInput(_Self, 0);
		var _SeparateXYZ = new armory.logicnode.SeparateVectorNode(this);
		_SeparateXYZ.addInput(_GetLocation, 0);
		var _Vector = new armory.logicnode.VectorNode(this);
		_Vector.addInput(_SeparateXYZ, 0);
		_Vector.addInput(_SeparateXYZ, 1);
		var _Math = new armory.logicnode.MathNode(this);
		_Math.property0 = "Sine";
		_Math.property1 = "false";
		var _Time = new armory.logicnode.TimeNode(this);
		_Time.addOutputs([_Math]);
		_Time.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_Math.addInput(_Time, 0);
		_Math.addInput(new armory.logicnode.FloatNode(this, 0.5), 0);
		_Math.addOutputs([_Vector]);
		_Vector.addInput(_Math, 0);
		_Vector.addOutputs([_SetLocation]);
		_SeparateXYZ.addOutputs([_Vector]);
		_SeparateXYZ.addOutputs([_Vector]);
		_SeparateXYZ.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_GetLocation.addOutputs([_SeparateXYZ]);
		_Self.addOutputs([_SetLocation, _GetLocation]);
		_SetLocation.addInput(_Self, 0);
		_SetLocation.addInput(_Vector, 0);
		_SetLocation.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}
