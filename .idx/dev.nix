{pkgs}: {
  channel = "stable-23.11";
  packages = [
    (pkgs.python311.withPackages (python-pkgs: with python-pkgs; [
      django
      djangorestframework
      pip
    ]))
  ];
  idx.extensions = [
    "ms-python.python"
  ];
  idx.previews = {
    enable = true;
    previews = {
      web = {
        command = ["sh" "-c" "python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:$PORT"];
        manager = "web";
      };
    };
  };
  idx.workspace = {
    onCreate = {
      default.openFiles = ["blogsite/settings.py" "blog/models.py"];
    };
  };
}
