# Axiom Homelab

Axiom is my evolving, hands-on IT infrastructure homelab for exploring
Linux, Windows, macOS, networking, storage, automation, and systems
administration.

This repository documents its architecture, hardware, diagrams,
configurations, experiments, troubleshooting, operational practices,
and lessons learned as the lab evolves.

## Purpose

Axiom provides a practical environment for building, testing,
troubleshooting, and documenting infrastructure outside of a production
environment.

The lab is intended to develop and reinforce practical experience with:

- Linux and Windows systems administration
- Computer networking and network troubleshooting
- Hardware installation, configuration, and maintenance
- Storage and backup systems
- Infrastructure automation
- Remote systems administration
- Raspberry Pi and small-form-factor computing
- Technical documentation
- Service deployment and administration
- Backup and recovery testing

## Design Principles

Axiom is built around a few simple principles:

1. **Understand before automating.**
   Automation should reinforce understanding rather than hide it.

2. **Document what is built.**
   Infrastructure is easier to maintain, troubleshoot, and rebuild when
   its design and configuration are recorded.

3. **Test recovery, not merely backup.**
   A backup that has never been restored is only a theory.

4. **Prefer purposeful simplicity.**
   Complexity should solve a real problem or provide meaningful learning
   value.

5. **Treat the lab as an evolving system.**
   Designs, technologies, and operating practices will change as new
   requirements and lessons emerge.

## Environment

Axiom currently incorporates a mixture of:

- Linux systems
- Windows systems
- macOS
- Raspberry Pi systems
- Ethernet networking
- Network switching and routing
- Local and network storage
- Virtualized Linux environments using WSL2
- Administrative and automation tooling

### Planned and Experimental Technologies

The following technologies are installed, available, or planned for
expanded use as Axiom develops:

- Docker Desktop and containerized workloads
- VMware virtualization
- VirtualBox virtualization
- Ansible-based infrastructure automation
- Additional virtualized Linux and Windows systems

Technologies listed in this section should not be interpreted as
production or continuously deployed services. They represent areas
being evaluated, tested, or prepared for future expansion of the lab.

Specific hardware, software, and network configurations are documented
separately so that this README can remain a high-level introduction to
the project.

## Documentation

Detailed documentation is organized under the `docs/` directory.

Planned documentation includes:

- `docs/architecture.md` — overall architecture and system roles
- `docs/hardware.md` — hardware inventory and system specifications
- `docs/networking.md` — network architecture and configuration
- `docs/services.md` — deployed services and their purposes
- `docs/storage.md` — storage architecture and configuration
- `docs/backup-and-recovery.md` — backup and restoration practices
- `docs/remote-access.md` — remote administration architecture

Network and infrastructure diagrams will be maintained under
`diagrams/`.

## Project Status

**Active development**

Axiom is a working homelab rather than a finished reference
architecture. Documentation in this repository will therefore evolve
alongside the physical and logical infrastructure.

Planned systems and experiments will be identified as such rather than
documented as currently deployed infrastructure.

## Repository Scope

This repository is primarily intended for infrastructure documentation,
configuration examples, diagrams, operational notes, and lessons
learned.

Reusable automation and larger software projects may eventually be
maintained in separate repositories where doing so provides a clearer
project boundary.

## Security

Public documentation is intentionally sanitized.

Credentials, private keys, authentication tokens, sensitive network
information, and other secrets are not intended to be committed to this
repository. Configuration examples may use placeholders or
documentation-specific values in place of production information.

---

*Built to learn. Documented to remember. Improved through iteration.*
