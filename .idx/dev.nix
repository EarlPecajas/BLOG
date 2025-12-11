{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.python311
    pkgs.python311Packages.pip
  ];
  idx.extensions = [
    "ms-python.python"
  ];
  idx.previews = {
    enable = true;
    previews = {
      web = {
        command = ["sh" "-c" "pip install -r requirements.txt && python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:$PORT"];
        manager = "web";
      };
    };
  };
}
