#!/usr/bin/env bash
# shellcheck disable=SC2034

# El nombre del archivo .iso final
iso_name="r-linos-1"

# La etiqueta del USB (Máximo 32 caracteres, estética limpia)
iso_label="R_LINOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"

# Quién manda aquí: Tú primero, luego la base
iso_publisher="ERREKID <https://github.com/ERREKID-Things>"

# Nombre de la aplicación al bootear
iso_application="R-Linos KDE Plasma Edition"

# Versión basada en la fecha actual
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"

# IMPORTANTE: Mantenemos "arch" para evitar errores de ruta en los scripts internos
install_dir="arch"

buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/systemd/system/display-manager.service"]="0:0:644"
)