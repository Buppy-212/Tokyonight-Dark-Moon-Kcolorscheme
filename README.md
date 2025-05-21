# Tokyonight Dark Moon Kcolorscheme

## Usage

To install the theme run

```bash
git clone https://github.com/Buppy-212/Tokyonight-Dark-Moon-Kcolorscheme.git
mkdir ~/.local/share/color-schemes
mv Tokyonight-Dark-Moon-Kcolorscheme/Tokyonight-Dark-Moon.colors ~/.local/share/color-schemes
```

then set the theme.

For Hyprland install qt6ct-kde

```bash
paru -S qt6ct-kde
```

and set QT_QPA_PLATFORMTHEME=qt6ct.

## Extras

### Zen

Copy userChrome.css into ~/.zen/(your_profile)/chrome/

### OBS

Copy Tokyonight-Dark-Moon.ovt uses the default Yari theme

### Hyprland

Uses uwsm managed session.

### Rofi

Rofi.sh is the intended way to open rofi. Refer to hyprland keybinds for usage.
Wallpaper script uses hyprpaper.

### Eww

Requires dash, jq and python and the systemd units in this repo. Uses paru to update.

```bash
sudo pacman -S dash jq python
sudo pacman -S bluetui pulsemixer btop hyprsunset
systemctl --user enable update-check.timer eww.service
```
