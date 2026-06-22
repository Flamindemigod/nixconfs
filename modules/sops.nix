{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../secrets.yaml;
    validateSopsFiles = false;

    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets."flamin/ssh" =
      lib.mkIf (builtins.hasAttr "flamin" config.users.users)
      {
        owner = "flamin";
        path = "/home/flamin/.ssh/id_ed25519";
      };
    secrets."velvy/ssh" =
      lib.mkIf (builtins.hasAttr "velvy" config.users.users)
      {
        owner = "velvy";
        path = "/home/velvy/.ssh/id_ed25519";
      };
  };
}
