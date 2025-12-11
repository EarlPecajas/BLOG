{ pkgs ? import <nixpkgs> {} }:

{
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.python312Packages.virtualenv
    pkgs.git
  ];

  idx = {
    # Start Django in preview with deps installed into a venv.
    start = "python -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python manage.py runserver 0.0.0.0:8000";
    previewPort = 8000;
  };
}
