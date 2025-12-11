{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python311Packages.virtualenv
    pkgs.git
  ];

  shellHook = ''
    export PIP_DISABLE_PIP_VERSION_CHECK=1
    echo "Activate with: python -m venv venv && source venv/bin/activate"
    echo "Install deps with: pip install django djangorestframework whitenoise"
  '';
}
