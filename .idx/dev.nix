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
        command = ["python" "manage.py" "runserver" "0.0.0.0:$PORT"];
        manager = "web";
      };
    };
  };
  idx.workspace = {
    onCreate = {
      install-deps = "pip install -r requirements.txt";
      migrate = "python manage.py migrate";
    };
    onStart = {
      run-server = "python manage.py runserver 0.0.0.0:$PORT";
    };
  };
}
