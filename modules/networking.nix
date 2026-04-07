{
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [53317 57976 59100];
      allowedUDPPorts = [39001 53317 57976 59100 59200]; # Clients and peers can use the same port, see listenport
    };
  };
}
