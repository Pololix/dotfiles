# URGENT: 

# Hardware: 
- external monitor
- external keyboard
- dock/hub
- NAS 
- Mouse and mousepad

# Hypr
- setup hyprlock: date, hour, login panel and options + virtual keyboard (always active, one hand)
- solve hypridle behaviour and make brightness changes relative to current brightness
- make profile manager (tablet, laptop, desktop, clamshell, etc)
- add virtual keyboard

# Nvim
- centralize ignore files in nvim

# AGS
- icon revamp
- notifications (remove mako)
- system notifications (new device, volume, brightness, etc)
- launcher (remove fuzzel)
- interworkspace screen

# Extras
- setup mutagen: hyprland, hyprlock, firefox and review others
- add whatsapp pwa and background notification daemon
- spotify killswitch
- revamp dotfiles folder
- use physical speaker
- fix monitor sharing through HDMI
- add mobile connectivity (KDEConnect?)

## Prompt for remaps
TODO: Custom XKB keymap for F23 → XF86Assistant (and other remapped keys)
I'm running Arch Linux with Hyprland (Wayland) on an HP OmniBook X Flip. I use keyd to remap phantom key chords at the evdev level — currently:
ini# /etc/keyd/default.conf
[ids]
*

[main]
leftshift+leftmeta+f23 = f23
leftshift+leftmeta+s = sysrq
These work fine bound directly as F23 and Print in Hyprland. But keyd's virtual output device doesn't carry my physical keyboard's hardware-specific XKB override, so F23 shows up as literally F23 instead of XF86Assistant (which is what the raw hardware key produces before keyd touches it).
I want to create a custom XKB keymap file (kb_file in Hyprland's input {} block) that:

Reproduces my current layout/variant/options exactly (need to check hyprland.conf for existing kb_layout/kb_variant/kb_options first)
Remaps the <FK23> key to emit XF86Assistant instead of F23
Possibly remaps other keys too (I may want to review my full set of custom binds/keyd mappings and consolidate them into this keymap rather than juggling both keyd output names and Hyprland binds separately)

Help me generate the full custom keymap file and wire it up in hyprland.conf via kb_file, without losing any of my existing layout settings.
