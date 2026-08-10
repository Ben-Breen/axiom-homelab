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

The MikroTik CRS326-24G-2S+RM provides managed Ethernet switching for the
homelab network.

At a high level:

Internet
  |
Residential Fiber
  |
Calix GigaSpire GS4220E
  |
MikroTik CRS326-24G-2S+RM
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

The CRS326 provides the primary wired switching layer for Axiom.

Logical configuration, port assignments, uplinks, VLANs, management
configuration, and other operational settings will be documented as those
configurations are implemented and verified.

Configuration details should not be inferred solely from the capabilities of
the hardware.

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