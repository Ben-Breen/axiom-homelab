# Axiom Storage

## Purpose

This document describes the storage systems, storage roles, and developing
storage architecture of the Axiom homelab.

Storage hardware inventory is documented in [`hardware.md`](hardware.md),
while backup and restoration practices are documented separately in
[`backup-and-recovery.md`](backup-and-recovery.md).

This document distinguishes between Current, Available, Experimental, and
Planned storage capabilities. Hardware ownership alone should not be
interpreted as an implemented storage service.

## Storage Principles

Axiom storage is guided by several principles:

- Document storage according to its actual role and deployment state.
- Distinguish primary storage from backup storage.
- Do not treat storage redundancy as equivalent to backup.
- Avoid depending on a single storage device for important data where
  practical.
- Verify hardware, capacity, filesystem, and storage roles before documenting
  them as established facts.
- Prefer storage designs that can be understood, maintained, and recovered.
- Allow storage architecture to evolve as requirements become clearer.

## Current Storage

### ASUS NUC 14 Pro Plus Internal Storage

**Status:** Current

The ASUS NUC 14 Pro Plus contains internal NVMe solid-state storage used by
the primary Axiom workstation and administrative environment.

Current storage supports activities including:

- Windows environment
- Windows Subsystem for Linux 2 (WSL2) environments
- Administrative tools
- Git repositories
- Homelab documentation
- Scripts and development work
- General workstation data

The exact number, model, and capacity of the installed NVMe devices should be
documented after verification rather than inferred from previous plans or
purchase information.

### DOCKCASE Explorer External NVMe Storage

**Status:** Current

A DOCKCASE Explorer NVMe enclosure containing a Samsung M.2 NVMe solid-state
drive provides portable high-speed external storage.

Current uses include:

- Data transfer
- Temporary storage
- Testing
- Portable high-speed storage
- Backup-related activities where appropriate

The enclosure does not need to remain continuously connected to be classified
as Current. Its classification reflects active use rather than permanent
attachment.

Exact SSD model, capacity, filesystem, and other relevant storage details
should be recorded after verification.

## Available Storage Infrastructure

### Raspberry Pi NAS Platform

**Status:** Available

A Raspberry Pi-based Network Attached Storage (NAS) platform is being
assembled for future use within Axiom.

Components currently on hand include:

- Raspberry Pi 4 Model B
- X735 v3 expansion and power-management board
- Two X838 v1 SATA expansion boards
- SATA storage devices
- Dedicated cooling and enclosure hardware

Additional boot storage hardware is still required before the NAS platform is
ready for deployment and active testing.

The planned boot storage arrangement requires:

- DOCKCASE NVMe 2230 enclosure
- Compatible NVMe solid-state drive

The NAS is not currently deployed and should not be represented as an active
storage service.

## Planned NAS Connectivity

The Raspberry Pi NAS platform is intended to connect directly to the MikroTik
CRS326-24G-2S+RM rather than through the Raspberry Pi access switch.

This arrangement keeps NAS traffic off the shared Gigabit Ethernet uplink
used by the planned Raspberry Pi access-layer nodes.

Detailed network configuration will be documented in
[`networking.md`](networking.md) when implemented.

## Raspberry Pi NAS Storage Role

The final role of the Raspberry Pi NAS platform remains under evaluation.

Potential responsibilities may include:

- Centralized network storage
- Homelab file storage
- Backup storage
- Infrastructure data storage
- Storage for future services
- Experimental storage and filesystem testing

A final role should not be assigned until the Raspberry Pi NAS platform has
been assembled, configured, tested, and its intended use established.

## Filesystems and Storage Organization

Filesystem selection and logical storage organization should be documented
from the implemented environment.

Future documentation may include:

- Filesystem type
- Partition layout
- Mount points
- Storage pools
- Shared directories
- Permissions
- Network sharing protocols
- Capacity allocation
- Snapshot behavior
- Storage monitoring

Planned filesystem or redundancy technologies should not be documented as
Current until they have been implemented and verified.

## Redundancy and Backup

Storage redundancy and backup serve different purposes.

Redundancy may improve availability when a storage device fails, but it does
not independently protect against events such as:

- Accidental deletion
- Filesystem corruption
- Malware
- Incorrect configuration
- Destructive synchronization
- Loss of the storage system itself

Backup strategy, restore testing, retention, and recovery planning are
documented in [`backup-and-recovery.md`](backup-and-recovery.md).

## Storage Verification

Storage documentation should be based on information obtained from the actual
hardware and operating system where practical.

Useful information to verify includes:

- Manufacturer
- Model
- Capacity
- Interface
- Firmware
- Filesystem
- Partition layout
- Mount point
- Storage role
- Health information
- Encryption status where applicable

Unverified information should be identified as such rather than documented as
fact.

## Known Gaps

The Axiom storage architecture is still developing.

Items requiring further evaluation include:

- Exact internal NUC storage inventory
- Exact external NVMe SSD model and capacity
- NAS boot storage hardware
- NAS filesystem selection
- NAS redundancy strategy
- Storage sharing protocols
- Permissions and access controls
- Capacity planning
- Storage monitoring
- Snapshot strategy
- NAS backup and recovery role

These gaps should be updated as storage systems are configured and verified.

## Future Development

Potential future storage development may include:

- Deployment of the Raspberry Pi NAS platform
- Additional storage capacity
- Network-based storage services
- Storage monitoring and health reporting
- Snapshot capability
- Storage automation
- Additional backup destinations
- Fractal Design Define 7 XL archival storage system
- Rack-mounted NAS platform designed for improved serviceability and
  integration with the Axiom rack environment
- Storage performance testing

Storage technologies should be introduced according to practical
requirements rather than architectural complexity alone.

## Related Documentation

- [`architecture.md`](architecture.md) — high-level Axiom architecture
- [`hardware.md`](hardware.md) — hardware inventory and lifecycle status
- [`networking.md`](networking.md) — network topology and configuration
- [`backup-and-recovery.md`](backup-and-recovery.md) — backup and recovery
  practices
- [`services.md`](services.md) — infrastructure services
- [`standards/documentation.md`](standards/documentation.md) — documentation
  standards