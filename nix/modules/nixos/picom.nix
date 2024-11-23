{ config, pkgs, ... }:

{
    #options = {
    #    services.picom.enable = true;
    #     services.picom.config = ''
    #    {
    #      backend = "glx";  # Use OpenGL for rendering
    #      vsync = true;     # Enable vsync to reduce screen tearing
    #      opacity = {
    #        inactive = 0.8;  # Set opacity for inactive windows
    #        active = 1.0;    # Set opacity for active windows
    #      };
    #      shadow = true;     # Enable shadows for windows
    #      shadow_offset_x = 10;  # Horizontal shadow offset
    #      shadow_offset_y = 10;  # Vertical shadow offset
    #      shadow_color = "#000000";  # Shadow color
    #      fade = true;      # Enable fading
    #      fade_in_duration = 0.2;  # Duration of fade-in
    #      fade_out_duration = 0.2;  # Duration of fade-out
    #      # Add more options as needed
    #    }
    #  '';
    #  description = "Configuration for picom compositor.";
    #};

    services.picom.enable = true;  # Enable picom service
    # programs.picom.config = ''
    #   {
    #     backend = "glx";
    #     vsync = true;
    #     opacity = {
    #       inactive = 0.8;
    #       active = 1.0;
    #     };
    #     shadow = true;
    #     shadow_offset_x = 10;
    #     shadow_offset_y = 10;
    #     shadow_color = "#000000";
    #     fade = true;
    #     fade_in_duration = 0.2;
    #     fade_out_duration = 0.2;
    #   }
    # '';
        
}

