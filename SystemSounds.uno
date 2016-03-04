using Uno;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;

//using iOS.AudioToolbox;

//using Android.android.media;
//using Android.android.app;
//using iOS.AudioToolbox;

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

	static extern(!iOS) void PlayNotification()
	{
		debug_log("Notification sounds not supported on this platform.");
	}

	static extern(iOS) void PlayNotification()
	@{
		AudioServicesPlaySystemSound(1310);
	@}
}
