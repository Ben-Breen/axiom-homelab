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

The Axiom network currently uses the residential fiber connection and Calix
GigaSpire GS4220E as the primary gateway and wireless access point.

The MikroTik CRS326-24G-2S+RM (`BARDCORE-SW1`) provides managed Ethernet
switching for the homelab network.

At a high level:

Internet
  |
Residential Fiber
  |
Calix GigaSpire GS4220E
  |
BARDCORE-SW1 (MikroTik CRS326-24G-2S+RM)
  |
  +-- ASUS NUC 14 Pro Plus
  |
  +-- Additional Ethernet-connected systems as deployed

The Raspberry Pi systems are currently Available rather than deployed and
therefore are not represented as active network nodes.

## Gateway

### Calix GigaSpire GS4220E

**Role:** Primary residential gateway and wireless access point

The Calix gateway currently provides connectivity between the residential
fiber service and the local network.

Its responsibilities presently include:

- Internet gateway connectivity
- Residential wireless networking
- Connectivity to the Axiom switching infrastructure

Detailed configuration should be documented here only where it materially
affects Axiom.

## Core Switching

### MikroTik CRS326-24G-2S+RM

**Role:** Primary managed Ethernet switch

**Device name:** `BARDCORE-SW1`

The CRS326 provides the primary wired switching layer for Axiom.
Hardware revision, serial number, and reported RouterBOOT firmware versions
are recorded in [`hardware.md`](hardware.md).

Logical configuration, port assignments, uplinks, VLANs, management
configuration, and other operational settings will be documented as those
configurations are implemented and verified.

Configuration details should not be inferred solely from the capabilities of
the hardware.

#### Operating System Guidance

**Status:** Recommendation recorded on 2026-11-11; the active boot OS and
running OS version have not yet been verified.

The CRS326 supports either RouterOS or SwOS through
[MikroTik's dual-boot feature](https://manual.mikrotik.com/hardware/crs326-24g-2s-plus-rm/).
Only one operating system runs at a time.

| Option | Fit for BARDCORE-SW1 |
| --- | --- |
| RouterOS | Recommended for Axiom's learning and automation goals: CLI/SSH, WinBox, scripting, configuration exports, and detailed diagnostics. It can serve as a Layer 2 switch. |
| SwOS | Suitable when simple browser-based administration of VLANs, ports, link aggregation, and other switch functions is the priority. |

The recommendation is to use RouterOS for managed switching while retaining
the Calix as the current gateway. Use one hardware-offloaded bridge; this
switch supports bridge VLAN filtering with hardware offload when VLANs are
introduced. Check the `H` flag on active bridge ports with
`/interface bridge port print`. Some features disable offload and cause
traffic to use the CPU. See
[MikroTik's bridge hardware-offload guidance](https://manual.mikrotik.com/docs/bridging-and-switching/).

To verify the inventory while running RouterOS, use these read-only commands:

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

No VLAN or network-segmentation architecture is documented as Current until it
has been implemented and verified.

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
