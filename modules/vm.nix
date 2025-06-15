{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["flamin"];
  virtualisation = {
    libvirtd = {
      enable = true;
      hooks = {
        qemu = {
          #"win10" = ..
        };
      };
    };
    spiceUSBRedirection.enable = true;
  };
}
