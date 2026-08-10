# Axiom Architecture

## Purpose

This document provides a high-level architectural overview of the Axiom
homelab.

It describes how the major systems, networking, compute, storage, and
administrative components relate to one another.

Detailed hardware specifications, network configuration, storage design,
and recovery practices are documented separately in their respective files.

The architecture documented here distinguishes between Current, Available,
Experimental, and Planned components. Hardware capabilities or intended
roles should not be interpreted as deployed infrastructure unless explicitly
identified as Current.

## Design Goals

Axiom is intended to provide a practical environment for learning,
experimentation, systems administration, infrastructure development, and
automation.

The architecture is guided by several principles:

- Understand systems before automating them.
- Document the environment that actually exists.
- Distinguish deployed infrastructure from planned infrastructure.
- Prefer purposeful simplicity over unnecessary complexity.
- Preserve the ability to experiment without unnecessarily disrupting
  working infrastructure.
- Treat recovery as something that must be tested rather than assumed.
- Allow the architecture to evolve as requirements and experience change.

## High-Level Architecture

The current and intended high-level architecture is:

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
   +-- Raspberry Pi NAS Platform
   |
   +-- NETGEAR GS208v2 Access Switch
         |
         +-- Pi 4 Model B Node 1
         +-- Pi 4 Model B Node 2
         +-- Pi 4 Model B Node 3
         +-- Pi 4 Model B Node 4
         +-- Pi 4 Model B Node 5
         +-- Pi 4 Model B Node 6
         +-- Pi 4 Model B Node 7

Not all components shown above are currently deployed.

The ASUS NUC 14 Pro Plus, Calix GigaSpire GS4220E, and MikroTik
CRS326-24G-2S+RM are Current components.

The Raspberry Pi systems, Raspberry Pi NAS platform, and NETGEAR GS208v2
are presently Available rather than deployed.

## Administrative and Workstation Layer

### ASUS NUC 14 Pro Plus

The ASUS NUC 14 Pro Plus serves as the primary administrative workstation
for Axiom.

Current uses include:

- Windows administration
- Linux environments using Windows Subsystem for Linux 2 (WSL2)
- PowerShell and scripting
- Git and GitHub
- Homelab documentation
- Infrastructure experimentation
- General systems administration

The NUC provides the principal administrative interface through which much
of the Axiom environment is configured, documented, and evaluated.

## Network Layer

### Calix GigaSpire GS4220E

The Calix GigaSpire GS4220E currently provides the primary residential
gateway and wireless access point.

It connects the Axiom environment to the residential fiber service.

### MikroTik CRS326-24G-2S+RM

The MikroTik CRS326-24G-2S+RM provides the primary managed Ethernet
switching layer for Axiom.

Core-connected systems such as the administrative workstation and planned
network storage connect through this switching layer.

Detailed addressing, switch configuration, uplinks, port assignments,
segmentation, and related networking information are documented in
[`networking.md`](networking.md).

## Compute Layer

### Primary Compute System

The ASUS NUC 14 Pro Plus currently provides the primary general-purpose
compute and administrative environment.

### Raspberry Pi Systems

Seven Raspberry Pi 4 Model B systems are Available for future deployment as
homelab nodes.

Their specific infrastructure roles have not yet been assigned.

The intended topology places these systems behind a dedicated access switch
rather than connecting each system directly to the primary CRS326.

This allows the Pi systems to be treated as a logical access-layer group
while conserving ports on the primary switch.

## Access Switching

### NETGEAR GS208v2

The NETGEAR GS208v2 is Available for use as the initial Raspberry Pi access
switch.

Its intended eight-port allocation is:

- One port for the uplink to the MikroTik CRS326
- Seven ports for Raspberry Pi 4 Model B nodes

Because the GS208v2 is an unmanaged Gigabit Ethernet switch, the seven Pi
nodes would share a single Gigabit Ethernet uplink to the wider Axiom
network.

This configuration is planned and is not presently deployed.

A managed access-switch replacement may be introduced later if requirements
such as VLAN support, greater uplink capacity, or future multi-gigabit
connectivity justify the change.

## Storage Layer

### External NVMe Storage

External NVMe storage is currently available to the primary workstation for
high-speed portable storage, testing, backup, and data transfer.

Detailed storage roles and organization are documented separately in
[`storage.md`](storage.md).

### Raspberry Pi NAS Platform

A Raspberry Pi-based Network Attached Storage (NAS) platform is Available
and under development.

The NAS is intended to connect directly to the MikroTik CRS326 rather than
through the Raspberry Pi access switch.

This avoids placing NAS traffic behind the shared Gigabit Ethernet uplink
used by the access-layer Pi nodes.

The NAS platform is not currently deployed, and its final storage
architecture, filesystem, redundancy strategy, and backup role remain under
evaluation.

## Virtualization and Linux Environments

Windows Subsystem for Linux 2 (WSL2) currently provides virtualized Linux
environments on the primary administrative workstation.

Additional virtualization or container platforms may be evaluated as Axiom
develops.

Technologies should not be documented as part of the Current architecture
until they are actively deployed and their role has been verified.

## Backup and Recovery

Backup and recovery are treated as architectural concerns rather than merely
storage functions.

Protection mechanisms, recovery objectives, restore testing, known gaps,
and future recovery architecture are documented in
[`backup-and-recovery.md`](backup-and-recovery.md).

A backup should not be considered operationally trustworthy solely because
data has been copied. Recovery must be demonstrated through appropriate
restore testing.

## Architecture Evolution

Axiom is intentionally an evolving environment.

Architecture changes should be driven by practical requirements, learning
objectives, operational limitations, security considerations, or clear
technical benefits rather than complexity for its own sake.

When architecture changes materially, this document should be updated to
reflect the new relationships between major systems.

Detailed implementation information should remain in the appropriate
specialized documentation rather than turning this file into a duplicate
hardware inventory or configuration reference.

## Related Documentation

- [`hardware.md`](hardware.md) — hardware inventory and lifecycle status
- [`networking.md`](networking.md) — network topology and configuration
- [`storage.md`](storage.md) — storage architecture and organization
- [`backup-and-recovery.md`](backup-and-recovery.md) — backup and recovery
  practices
- [`services.md`](services.md) — infrastructure services
- [`remote-access.md`](remote-access.md) — remote administration and access