using Uno;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;

public class SystemSounds : NativeModule
{
	public SystemSounds()
	{
		AddMember(new NativeFunction("playNotification",
			(NativeCallback)PlayNotification));
	}

	object PlayNotification(Context c, object[] args)
	{
		// Code goes here

		return null;
	}
}
