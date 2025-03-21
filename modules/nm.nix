{
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [53317];
      allowedUDPPorts = [39001 53317]; # Clients and peers can use the same port, see listenport
    };
    wireless.networks = {
      TNCAP2B50D8 = {
        pskRaw = "4d0d1b0b94456d3b9f7d9855a63eaaa99db477f2baa939bbd8624bba758b8d21";
      };
      Home_5G = {
        priority = 69;
        pskRaw = "60f3d3f8c3814af6a8a45914b14190349c84fc7cbffaaa9cf3d1d7331ac4e96a";
      };
      Home = {
        pskRaw = "4430ba0091c79f15955be197c26dbd1273a2e320714441f2e0f3e83e03465984";
      };
      iPhone = {
        pskRaw = "96570be62eecd6cbe98a5508a9609fe937f31e0381b86efc5458e8500c185de8";
      };
    };
    # wg-quick.interfaces = {
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
  };
}
