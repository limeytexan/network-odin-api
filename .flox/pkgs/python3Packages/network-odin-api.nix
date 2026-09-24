{ runCommand, catalogs }:
let
  dep_python3Packages_flox_odin = catalogs.brantley.python3Packages.flox-odin;
  dep_python3Packages_network_vendor_api = catalogs.brantley.python3Packages.network-vendor-api;
in
runCommand "network-odin-api-1" { pname = "network-odin-api"; version = "1"; inputs = [ dep_python3Packages_flox_odin dep_python3Packages_network_vendor_api ]; } ''
  sleep 4
  mkdir -p "$out/share"
  printf '%s\n' "python3Packages.network-odin-api" > "$out/share/name"
  for i in $inputs; do printf '%s\n' "$i"; done > "$out/share/inputs"
''
