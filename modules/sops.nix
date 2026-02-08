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
    secrets = lib.mkMerge [
      (lib.mkIf (builtins.hasAttr "flamin" config.users.users)
        {
          "flamin/ssh" = {
            owner = "flamin";
            path = "/home/flamin/.ssh/id_ed25519";
          };
        })
      (lib.mkIf (builtins.hasAttr "velvy" config.users.users)
        {
          "velvy/ssh" = {
            owner = "velvy";
            path = "/home/velvy/.ssh/id_ed25519";
          };
        })
    ];
  };
}
