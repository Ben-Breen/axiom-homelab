# Axiom Hardware

This document records the physical systems and major infrastructure
components used by the Axiom Homelab.

Hardware is grouped by current use and future expansion. Planned hardware
should not be interpreted as currently deployed.

## Status Definitions

- **Current** — Presently installed and in active use.
- **Experimental** — Actively used for testing, development, evaluation, or experimentation.
- **Available** — Owned and retained for use, but not currently deployed.
- **Planned** — Intended for future acquisition or implementation.

---

## Primary Systems

### ASUS NUC 14 Pro Plus

**Status:** Current  
**Role:** Primary workstation and homelab administration system

**Hardware:**

- Intel Core Ultra 9 185H
- 128 GB DDR5 memory
- NVMe solid-state storage
- Integrated Ethernet and wireless networking

**Current Uses:**

- Windows administration
- Linux environments through WSL2
- PowerShell and scripting
- Git and GitHub administration
- Homelab documentation
- Infrastructure experimentation
- General systems administration

The ASUS NUC 14 Pro Plus currently serves as the primary administrative
workstation for Axiom and provides access to both Windows and Linux tooling.

---

## Raspberry Pi Systems

Axiom includes multiple Raspberry Pi systems intended for experimentation,
infrastructure services, storage projects, and distributed computing
experiments.

### Raspberry Pi 4B

**Status:** Available

Axiom currently has Raspberry Pi 4B systems in both 4 GB and 8 GB
configurations.

Known hardware includes:

- Raspberry Pi 4B 8 GB systems
- Raspberry Pi 4B 4 GB systems
- Multi-node Raspberry Pi stack hardware
- Raspberry Pi-based NAS/storage project hardware

The Raspberry Pi 4B systems are owned and available for future deployment
but have not yet been placed into active service.

Individual node roles will be documented as systems are configured,
deployed, and stabilized.

### Raspberry Pi 3B

**Status:** Available

Retained for lightweight infrastructure experiments and projects where the
additional performance of the Raspberry Pi 4B is unnecessary.

---

## Storage Hardware

### Raspberry Pi NAS Platform

**Status:** Available

The Raspberry Pi-based NAS platform is a work in progress assembled from
hardware currently on hand. It is not yet deployed or in active testing.

**Components on hand include:**

- Raspberry Pi 4B
- X735 v3 expansion/power management board
- Two X838 v1 SATA expansion boards
- SATA storage devices
- Dedicated cooling and enclosure components

Additional boot-storage hardware is still required before deployment and
active testing can begin.

The final storage architecture, filesystem design, redundancy strategy, and
backup role remain under evaluation.

### External NVMe Storage

**Status:** Current

External NVMe storage is available for portable high-speed storage,
testing, backup workflows, and data transfer.

**Current hardware includes:**

- Dockcase NVMe enclosure
- Samsung NVMe SSD

---

## Networking Hardware

### Ubiquiti Cloud Gateway Ultra (UCG-Ultra)

**Status:** Current

**Role:** Primary gateway for the Axiom Homelab

The owner confirmed on 2026-11-12 that the UCG-Ultra now performs the
gateway role previously documented for the Calix GigaSpire GS4220E.
Firmware, hardware identifiers, interface assignments, and detailed gateway
configuration have not yet been supplied.

### Calix GigaSpire GS4220E

**Status:** Current  
**Role:** Wi-Fi access point

The owner confirmed on 2026-11-12 that the Calix currently serves as a Wi-Fi
access point. The gateway role now belongs to the UCG-Ultra.
Access-point configuration and physical uplink details remain unverified.

### MikroTik CRS326-24G-2S+RM

**Status:** Current  
**Role:** Managed Ethernet switch

**Device name:** `BARDCORE-SW1`

**Hardware:**

- 24 Gigabit Ethernet ports
- 2 SFP+ ports
- Rack-mount form factor
- Managed switching capabilities
- ARM CPU, 2 cores at 800 MHz (`arm` architecture)
- 512 MiB RAM
- 16 MiB internal flash storage

The CRS326 provides managed Ethernet switching for the Axiom Homelab.

**Device inventory reported on 2026-11-11:**

| Field | Reported value |
| --- | --- |
| Hardware revision | `r2` |
| Serial number | `HKH0AWGBYRR` |
| Firmware type | `dx3230L` |
| Factory RouterBOOT firmware | `7.19.6` |
| Current RouterBOOT firmware | `7.23.3` |
| Running operating system | RouterOS `7.23.3 (stable)` |
| Reported `factory-software` | `6.44.6` |

MikroTik defines the RouterBOARD factory/current firmware fields as
[RouterBOOT bootloader versions](https://help.mikrotik.com/docs/spaces/ROS/pages/40992878/RouterBOARD).
The separate `/system resource print` output supplied on 2026-11-11 confirms
RouterOS `7.23.3 (stable)` is running. Its version matches the reported
current RouterBOOT version; they remain separate software components.

MikroTik defines `factory-software` as the minimum RouterOS version in its
[resource field documentation](https://help.mikrotik.com/docs/spaces/ROS/pages/40992875/Resource).
The reported value `6.44.6` is distinct from factory RouterBOOT firmware
`7.19.6`.

#### Resource Snapshot

User-supplied `/system resource print` output, reported on 2026-11-11:

```text
                  uptime: 13w5d19h11m6s
                 version: 7.23.3 (stable)
              build-time: 2026-07-30 11:17:12
        factory-software: 6.44.6
             free-memory: 439.8MiB
            total-memory: 512.0MiB
                     cpu: ARM
               cpu-count: 2
           cpu-frequency: 800MHz
                cpu-load: 0%
          free-hdd-space: 3044.0KiB
         total-hdd-space: 16.0MiB
 write-sect-since-reboot: 13173
        write-sect-total: 13975
       architecture-name: arm
              board-name: CRS326-24G-2S+
                platform: MikroTik
```

The collection time and build timestamp timezone were not supplied. Uptime,
free resources, CPU load, and write counters describe this sample. Uptime
is 96 days, 19 hours, 11 minutes, and 6 seconds since boot; it does not
establish uninterrupted network connectivity. A separate bridge-port report
on 2026-11-11 confirms hardware-offload flags on all 26 bridge ports, with
`ether2` and `ether23` active. See the verified bridge-port snapshot in
[`networking.md`](networking.md).

The model supports dual boot with RouterOS or SwOS. Operating system
guidance, verification commands, logical configuration, port assignments,
uplinks, VLANs, management configuration, and topology belong in
[`networking.md`](networking.md).

---

### NETGEAR GS208v2

**Status:** Available  
**Role:** Raspberry Pi access switch

**Hardware:**

- 8 Gigabit Ethernet ports
- Unmanaged Ethernet switching
- Gigabit Ethernet connectivity

The GS208v2 is planned as a dedicated access switch for seven Raspberry Pi
systems operating on a flat network segment.

Seven ports will provide connectivity to the Raspberry Pi nodes, with the
remaining port serving as the uplink to the primary Axiom network.

The switch provides sufficient connectivity for the intended Raspberry Pi
workloads without consuming additional ports on the primary managed switch.

---

### MikroTik CRS310-8G+2S+IN

**Status:** Planned  
**Role:** Future managed Raspberry Pi access switch

The CRS310-8G+2S+IN is being considered as a future replacement for the
NETGEAR GS208v2 Raspberry Pi access switch.

Its eight 2.5 GbE Ethernet ports would provide connectivity for the Pi
nodes, while an SFP+ interface could provide a higher-bandwidth uplink to
the primary MikroTik switching infrastructure.

The upgrade would primarily provide managed switching, VLAN support,
higher uplink capacity, and additional flexibility for future
multi-gigabit systems rather than increasing the onboard Ethernet speed
of existing Raspberry Pi nodes.

Additional switching, routing, segmentation, and wireless infrastructure
will be documented separately in `networking.md`.

---

## Rack and Physical Infrastructure

### Homelab Rack

**Status:** Planned

Axiom is planned to use an enclosed equipment rack for organizing
networking, compute, power, and related infrastructure.

The rack layout will evolve as dedicated network and server hardware are
added.

Future rack documentation may include:

- Rack-unit allocation
- Power distribution
- Network patching
- Cooling considerations
- Cable management
- UPS deployment

---

## Experimental Hardware

Hardware in this section is actively used for testing, development, or
learning but is not necessarily part of the established Axiom architecture.

Examples may include:

- Additional PCs and laptops
- Raspberry Pi development systems
- Removable storage devices
- USB networking and storage adapters
- Test peripherals
- Virtualization-capable systems

Experimental hardware should be classified as Current once it has a stable,
defined, and actively deployed role within Axiom.

---

## Planned Hardware

The following categories are candidates for future Axiom expansion:

- Additional managed Ethernet switching
- 2.5 GbE and higher-speed networking
- Dedicated wireless access points
- UPS and rack power management
- Additional storage systems
- Dedicated virtualization hosts
- Additional Raspberry Pi nodes
- Dedicated automation/control systems

Planned hardware may be classified as Available once acquired, Experimental
while actively used for testing or development, and Current once deployed
and placed into active use.

---

## Inventory Philosophy

Axiom documentation favors recording the purpose of hardware rather than
simply listing specifications.

Where practical, each major system should eventually document:

- Hardware model
- Primary role
- Deployment status
- Relevant specifications
- Network role
- Storage role
- Dependencies
- Upgrade history
- Retirement or replacement information

The inventory should reflect the environment as it actually exists rather
than presenting planned systems as completed infrastructure.
