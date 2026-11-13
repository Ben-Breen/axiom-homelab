# Axiom Networking

## Purpose

This document describes the network architecture, connectivity, logical
relationships, and operational networking practices used within the Axiom
homelab.

Hardware inventory and lifecycle status are documented separately in
[`hardware.md`](hardware.md).

This document reflects the current network where known. Planned or
experimental configurations are identified explicitly and should not be
interpreted as deployed infrastructure.

## Current Network Overview

The Axiom network uses the residential fiber connection with a Ubiquiti
Cloud Gateway Ultra (UCG-Ultra) as its current gateway. The Calix GigaSpire
GS4220E provides Wi-Fi access.

**Gateway and Wi-Fi roles updated:** 2026-11-12

The MikroTik CRS326-24G-2S+RM (`BARDCORE-SW1`) provides managed Ethernet
switching for the homelab network.

At a high level, the logical gateway and wired-switching path is:

Internet
  |
Residential Fiber
  |
Ubiquiti Cloud Gateway Ultra (UCG-Ultra)
  |
BARDCORE-SW1 (MikroTik CRS326-24G-2S+RM)
  |
  +-- ASUS NUC 14 Pro Plus
  |
  +-- Additional Ethernet-connected systems as deployed

This is a logical overview. The physical cable and port map, including the
ISP handoff and Calix uplink, is still to be documented.

The Raspberry Pi systems are currently Available rather than deployed and
therefore are not represented as active network nodes.

## Gateway

### Ubiquiti Cloud Gateway Ultra (UCG-Ultra)

**Status:** Current

**Role:** Primary gateway for the Axiom Homelab

The UCG-Ultra is Axiom's primary gateway, replacing the Calix in that role.

WAN addressing and ISP handoff, LAN addressing, DHCP and DNS configuration,
firewall policy, firmware version, and gateway-to-switch port assignments
are still to be documented.

## Wireless Access

### Calix GigaSpire GS4220E

**Status:** Current

**Role:** Wi-Fi access point

The Calix provides Wi-Fi access, with the UCG-Ultra handling the gateway
role. Operating-mode settings, wireless configuration, management address,
and uplink details are still to be documented.

## Core Switching

### MikroTik CRS326-24G-2S+RM

**Role:** Primary managed Ethernet switch

**Device name:** `BARDCORE-SW1`

**Current operating system:** RouterOS `7.23.3 (stable)`

**Resource and bridge checks:** 2026-11-11

The CRS326 provides the primary wired switching layer for Axiom.
Hardware revision, serial number, and RouterBOOT firmware versions
are recorded in [`hardware.md`](hardware.md).

The port table below records bridge membership and hardware-offload flags.
VLANs are not yet configured. Connected-device assignments, uplink identity,
and management settings are still to be documented.

#### Bridge-Port Snapshot

`/interface bridge port print` — 2026-11-11:

All 24 Ethernet ports and both SFP+ ports belong to the bridge named `bridge`.
Every entry has `hw=yes` and the `H` hardware-offload flag. `ether2` and
`ether23` are active; the remaining 24 entries also carry `I` (inactive).

| Interface(s) | Flags | State at check |
| --- | --- | --- |
| `ether1` | `IH` | Inactive; hardware-offload flag present |
| `ether2` | `H` | Active; hardware offload active |
| `ether3` through `ether22` | `IH` | Inactive; hardware-offload flag present |
| `ether23` | `H` | Active; hardware offload active |
| `ether24` | `IH` | Inactive; hardware-offload flag present |
| `sfp-sfpplus1`, `sfp-sfpplus2` | `IH` | Inactive; hardware-offload flag present |

The `H` flag confirms bridge hardware offload, rather than merely the
requested `hw=yes` setting. See
[MikroTik's hardware-offload documentation](https://manual.mikrotik.com/docs/bridging-and-switching/).

Shared values across all 26 entries:

- `bridge=bridge`, `hw=yes`, `horizon=none`
- `pvid=1`, `frame-types=admit-all`
- `trusted=no`, `trusted-ra=no`, `trusted-dhcpv6=no`
- `fast-leave=no`, `bpdu-guard=no`
- `edge=auto`, `point-to-point=auto`
- Comment: `defconf`

Endpoint assignments, negotiated link speeds, and the gateway uplink port
still need checking. All ports currently show PVID 1 and `admit-all`; VLAN
segmentation is planned. Bridge-level `vlan-filtering` and VLAN table values
still need to be recorded.

#### Operating System and Management

BARDCORE-SW1 runs RouterOS `7.23.3 (stable)` with bridge hardware offload.
The saved Boot OS setting still needs checking.

The CRS326 supports either RouterOS or SwOS through
[MikroTik's dual-boot feature](https://manual.mikrotik.com/hardware/crs326-24g-2s-plus-rm/).
Only one operating system runs at a time.

| Operating system | Management options |
| --- | --- |
| RouterOS | Current OS. Provides CLI/SSH, WinBox, scripting, configuration exports, and detailed diagnostics alongside Layer 2 switching. |
| SwOS | Alternative switch OS with browser-based administration of VLANs, ports, link aggregation, and other switch functions. |

The UCG-Ultra handles gateway duties while BARDCORE-SW1 provides switching.
The switch has one hardware-offloaded bridge and supports bridge VLAN
filtering with hardware offload. The `H` flag in
`/interface bridge port print` shows whether offload is active. Some bridge
features disable offload and send traffic through the CPU. See
[MikroTik's bridge hardware-offload guidance](https://manual.mikrotik.com/docs/bridging-and-switching/).

These read-only commands check the inventory and management settings:

```routeros
/system identity print
/system routerboard print
/system resource print
/system routerboard settings print
/system device-mode print
/interface bridge port print
```

Record the running RouterOS version from `/system resource print` separately
from RouterBOOT firmware in `/system routerboard print`. If running SwOS,
record its version from the SwOS interface instead.

To change OS, use **System > RouterBOARD > Settings > Boot OS** in RouterOS,
then reboot. In SwOS, use **System > Boot RouterOS** to return. On RouterOS
7.17 and later, device-mode can restrict this transition. Check
`/system device-mode print`; if `routerboard=no`, enabling it with
`/system device-mode update routerboard=yes` requires physical confirmation
and causes a reboot. Follow the device's prompt; a normal software reboot
does not satisfy physical confirmation. See
[MikroTik's device-mode documentation](https://manual.mikrotik.com/docs/system-information-and-utilities/device-mode/).

Before changing OS, save the existing configuration and arrange local
management access during the outage. Back up and verify configuration for
each OS separately, including management access, VLANs, and forwarding.

## Raspberry Pi Networking

The Raspberry Pi systems are currently classified as Available and are not
active network nodes.

The NETGEAR GS208v2 is also Available and is intended for use as a simple
Raspberry Pi access switch.

The current concept is:

MikroTik CRS326
  |
  +-- NETGEAR GS208v2
        |
        +-- Raspberry Pi nodes

Because the GS208v2 is an unmanaged Gigabit Ethernet switch, systems connected
through it would share a single Gigabit Ethernet uplink to the wider Axiom
network.

This topology is planned and should not be interpreted as currently deployed.

## Planned Managed Pi Access Switching

A MikroTik CRS310-8G+2S+IN is being considered as a future managed access
switch for Raspberry Pi and related systems.

The primary expected benefits would be:

- Managed switching
- VLAN capability
- Greater uplink capacity
- Support for future 2.5 GbE systems
- More flexible network segmentation

Existing Raspberry Pi 4 systems are limited by their onboard Gigabit Ethernet
interfaces, so 2.5 GbE switching would not directly increase their individual
network-interface speeds.

## Network Segmentation

**Status:** Planned

VLANs are not yet configured on `BARDCORE-SW1` as of 2026-11-11.

The current bridge-port report shows all 26 ports with `pvid=1` and
`frame-types=admit-all`. VLAN design and implementation are pending.

Future segmentation may separate infrastructure according to operational or
security requirements.

Any implemented VLAN structure should document:

- VLAN identifier
- Purpose
- Address space
- Gateway
- DHCP behavior
- Allowed inter-VLAN communication
- Relevant firewall policy

## Addressing and Naming

Network addressing, host naming, DHCP reservations, and related conventions
will be documented as the environment becomes sufficiently stable to justify
formal standards.

Sensitive or unnecessarily identifying information should be sanitized before
publication.

## Management

Administrative access to network infrastructure should use secure management
methods appropriate to the device and environment.

Management interfaces should not be exposed directly to the public Internet.

Specific management configuration will be documented once implemented and
verified.

## Documentation Practice

Networking documentation should distinguish between:

- Observed and verified configuration
- Planned configuration
- Experimental configuration
- Assumptions that still require verification

Port assignments, VLANs, routes, firewall rules, and other configuration
details should be documented from the actual environment rather than inferred
from hardware capabilities or intended designs.

## Future Documentation

As Axiom develops, this document may expand to include:

- Physical and logical topology diagrams
- Switch port assignments
- VLAN architecture
- IP addressing
- DHCP and DNS
- Routing
- Firewall policy
- Wireless networking
- Infrastructure management
- Network monitoring
- Performance testing
- Troubleshooting references
