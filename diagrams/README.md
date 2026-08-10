# Axiom Diagrams

## Purpose

This directory contains diagrams used to document the architecture and
relationships within the Axiom homelab.

Diagrams are intended to complement the written documentation by showing
connections, dependencies, topology, and system organization in ways that are
easier to understand visually than through prose alone.

They should reflect the actual environment where Current infrastructure is
being documented. Available, Experimental, and Planned components may also be
shown, but their lifecycle state must be identified clearly so that future
designs are not mistaken for deployed infrastructure.

A diagram should have a specific purpose. Complex subjects should be divided
into multiple diagrams rather than forcing the entire homelab into one
overloaded view.

## What Belongs Here

Diagrams may document areas such as:

- High-level Axiom architecture
- Physical and logical network topology
- Core and access switching
- Raspberry Pi node connectivity
- Storage architecture
- Network Attached Storage (NAS) connectivity
- Backup and recovery relationships
- Infrastructure services
- Service dependencies
- Administrative and management paths
- Remote-access architecture
- Planned infrastructure where clearly identified

Detailed configuration, troubleshooting history, hardware specifications, and
operational procedures should remain in the appropriate documentation files
rather than being reproduced inside diagrams.

For example, a network diagram may show that a system connects through a
particular switch, while port configuration, addressing, routing, and other
network details remain in
[`../docs/networking.md`](../docs/networking.md).

## Diagram Conventions

Axiom diagrams should favor clarity, accuracy, and maintainability.

System and device names should remain consistent with the rest of the
repository. Where an abbreviation may not be obvious to the intended reader,
the full term should be given on first use before the abbreviation is used
subsequently.

When multiple lifecycle states appear in the same diagram, they should be
identified explicitly.

For example:

```text
MikroTik CRS326-24G-2S+RM [Current]
   |
   +-- ASUS NUC 14 Pro Plus [Current]
   |
   +-- Raspberry Pi NAS Platform [Available]
   |
   +-- NETGEAR GS208v2 [Available]
         |
         +-- Pi 4 Model B Node 1 [Available]
         +-- Pi 4 Model B Node 2 [Available]
         +-- Pi 4 Model B Node 3 [Available]
         +-- Pi 4 Model B Node 4 [Available]
         +-- Pi 4 Model B Node 5 [Available]
         +-- Pi 4 Model B Node 6 [Available]
         +-- Pi 4 Model B Node 7 [Available]