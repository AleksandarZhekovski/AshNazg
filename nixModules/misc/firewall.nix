{ ... }: {

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
    ];
  };

  networking.nftables.enable = true;
}
