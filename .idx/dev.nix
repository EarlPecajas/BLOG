{ pkgs ? import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz") {} }:

{
  packages = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    git
  ];

  idx = {
    # Start Django in preview with deps installed into a venv.
    start = "python -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python manage.py runserver 0.0.0.0:8000";
    previewPort = 8000;
  };
}
