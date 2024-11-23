{
  #config,
  pkgs,
	#system,
	#stdenv,
  #lib,
	#inputs,
	#outputs,
  ...
}:
{
	imports = [
		#./themes
		#./themes/ags.nix
	];

  environment.systemPackages = with pkgs; [
		vlc
		mpd
		ncmpcpp
		mpdris2
		pavucontrol
		clementine
  ];

	home-manager.users.ryan = {
		home.packages = [
			(pkgs.python311.withPackages (ppkgs: [
				ppkgs.dbus-python
			]))
		];

		services = {
			mpd = {
				enable = true;
				musicDirectory = /mnt/server-hdd/data/media/Music;
				#package = ;
				#extraArgs = ;
				extraConfig = ''
				# Required files
				db_file            "~/.config/mpd/database"
				log_file           "~/.config/mpd/log"

				# Optional
				music_directory    "~/Music"
				playlist_directory "~/.config/mpd/playlists"
				pid_file           "~/.config/mpd/pid"
				state_file         "~/.config/mpd/state"
				sticker_file       "~/.config/mpd/sticker.sql"

				#run as current local user
				#user                 "mpd"

				#To change the volume for mpd independent from other programs
				mixer_type            "software"

				# for visualization
				audio_output {
						type                    "pulse"
						name                    "my_fifo"
						path                    "/tmp/mpd.fifo"
						format                  "44100:16:2"
				}
				'';
			};

			mpdris2 = {
				enable=true;
				#package = ;
				#notificiations = ;
				#multimediaKeys = ;
			};
		};

		programs = {
			ncmpcpp = {
				enable = true;
				#package = ;
				#bindings = [
				#	{ key = "j"; command = "scroll_down"; }
				#	{ key = "k"; command = "scroll_up"; }
				#	{ key = "J"; command = [ "select_item" "scroll_down" ]; }
				#	{ key = "K"; command = [ "select_item" "scroll_up" ]; }
				#];
				settings = {
					visualizer_fifo_path = "/tmp/mpd.fifo";
					visualizer_output_name = "my_fifo";
					visualizer_sync_interval = "30";
					visualizer_in_stereo = "yes";
					#visualizer_type = "wave" (spectrum/wave)
					visualizer_type = "spectrum";# (spectrum/wave)
				};
			};
		};
	};
}
