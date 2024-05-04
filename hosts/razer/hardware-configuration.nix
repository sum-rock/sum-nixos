# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];

  boot.kernelModules = [ "kvm-amd" ];

  # NOTE: The v4l2loopback is a modification added for immersed-vr but it might break x11

  # boot.kernelModules = [ "kvm-amd" "v4l2loopback" ];
  # boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  # boot.extraModprobeConfig = ''
  #   options v4l2loopback card_label="Virtual Camera" exclusive_caps=1
  # '';

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/ee2498db-e023-4ce3-bfab-915fff49fb0d";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b2f449c3-abf7-4163-8e30-03a3c05c5fba".device = "/dev/disk/by-uuid/b2f449c3-abf7-4163-8e30-03a3c05c5fba";

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/20BF-2B1C";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/34f9ae78-9c5e-4a28-af57-8c8cc13624d8"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
