{
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [53317 57976];
      allowedUDPPorts = [39001 53317 57976]; # Clients and peers can use the same port, see listenport
    };
  };
}
