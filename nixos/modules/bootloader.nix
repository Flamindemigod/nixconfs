{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.initrd.kernelModules = [ "amdgpu" ];
  #boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
}
