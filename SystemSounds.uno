using Uno;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;

using Uno.Compiler.ExportTargetInterop;

[Require("Source.Include", "AudioToolbox/AudioToolbox.h")]
public class SystemSounds : NativeModule
{
	public SystemSounds()
	{
		AddMember(new NativeFunction("playNotification",
			(NativeCallback)PlayNotification));
	}

	object PlayNotification(Context c, object[] args)
	{
		PlayNotification();

		return null;
	}

	[Foreign(Language.ObjC)]
	static extern(iOS) void PlayNotification()
	@{
		AudioServicesPlaySystemSound(1310);
	@}

	static extern(!iOS) void PlayNotification()
	{
		debug_log("Notification sounds not supported on this platform.");
	}
}
