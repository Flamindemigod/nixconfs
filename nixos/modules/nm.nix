{
  networking.networkmanager.enable = true;
   networking.firewall = {
      allowedTCPPorts = [53317];
     allowedUDPPorts = [39001 53317]; # Clients and peers can use the same port, see listenport
   };
  # networking.wg-quick.interfaces = {
  #   wg0 = {
  #     address = ["10.99.99.3/32"];
  #     dns = ["1.1.1.1" "1.0.0.1"];
  #     privateKeyFile = "/home/flamin/.wg.priv";
  #
  #     peers = [
  #       {
  #         publicKey = "UexpnolBhlMQCulmhAQCBSWLUwFBjhpzVE3pRgWIXl0=";
  #         presharedKeyFile = "/home/flamin/.wg.preshared";
  #         allowedIPs = ["0.0.0.0/0"];
  #         endpoint = "136.243.175.33:39001";
  #         persistentKeepalive = 25;
  #       }
  #     ];
  #   };
  # };
}
