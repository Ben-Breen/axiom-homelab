# Axiom Diagrams

## Purpose

This directory contains diagrams that visually document the architecture,
topology, connectivity, dependencies, and organization of the Axiom homelab.

Diagrams complement the written documentation by showing relationships that
may be difficult to understand from text alone. They should help answer
questions such as how systems connect, where services or storage reside, and
how major infrastructure components relate to one another.

Diagrams should represent verified infrastructure when documenting the
Current environment. Available, Experimental, and Planned infrastructure may
also be shown when useful, but its status must be clearly identified so that
future designs are not mistaken for deployed systems.

## Diagram Scope

Diagrams may cover areas including:

- High-level Axiom architecture
- Physical network topology
- Logical network topology
- Core and access switching
- Raspberry Pi system connectivity
- Storage and Network Attached Storage (NAS) architecture
- Backup and recovery relationships
- Infrastructure services and dependencies
- Administrative and management paths
- Remote-access architecture
- Planned infrastructure designs

A diagram should have a clear purpose and contain only the detail needed to
explain that subject.

Detailed configuration, troubleshooting history, hardware specifications, and
operational procedures belong in their respective documentation rather than
being reproduced inside a diagram.

Complex subjects should be divided into separate diagrams when a single view
would become difficult to understand.

## Diagram Conventions

System names, device names, terminology, and lifecycle status should remain
consistent with the rest of the Axiom documentation.

When lifecycle status is relevant, diagrams should use the established Axiom
terms:

- **Current**
- **Experimental**
- **Available**
- **Planned**

A component appearing in a diagram does not by itself mean that the component
is deployed.

Planned or conceptual connections should therefore be labeled clearly.

Diagrams should favor readability over excessive detail. Information should
not be added simply because it can be shown.

Where abbreviations are used, the full term should be provided on first use
when the abbreviation may not be obvious to the intended reader.

## File Formats and Naming

Text-based diagram sources are preferred where practical because they can be
reviewed and versioned effectively through Git.

Appropriate formats may include:

- Markdown text diagrams
- Mermaid diagrams
- Scalable Vector Graphics (SVG)
- Portable Network Graphics (PNG)
- Other maintainable diagram source formats

When a rendered diagram is generated from another source file, the source
should be retained where practical so the diagram can be modified later.

Diagram filenames should normally use lowercase words separated by hyphens.

Examples include:

- `high-level-architecture.md`
- `physical-network-topology.md`
- `logical-network-topology.md`
- `storage-architecture.md`
- `service-dependencies.md`
- `remote-access-architecture.md`

Where both source and rendered versions exist, their filenames should make
their relationship clear.

## Accuracy and Maintenance

Diagrams should be based on verified information rather than assumptions about
how hardware, software, or services are expected to operate.

Uncertain relationships should be identified as uncertain instead of being
presented as confirmed facts.

Diagrams should be reviewed when significant changes occur to:

- Network topology
- Major hardware
- Storage architecture
- Service placement or dependencies
- Remote-access architecture
- System roles
- Infrastructure lifecycle state

A diagram that no longer represents the environment accurately should be
updated, clearly identified as historical, or removed if it no longer provides
useful documentation.

Before committing a diagram, verify that it does not unnecessarily expose
credentials, authentication material, sensitive management information,
personally identifying information, or other information that should not be
published.

## Diagram Index

As diagrams are created, they should be listed here so this README also serves
as the entry point to the Axiom diagram collection.

The initial diagram set is expected to grow alongside the infrastructure and
may eventually include:

- High-level architecture
- Physical network topology
- Logical network topology
- Raspberry Pi access topology
- NAS and storage architecture
- Backup and recovery relationships
- Service dependencies
- Remote-access architecture

Diagrams should be created when they provide practical documentation value,
not merely to populate the directory.

## Related Documentation

- [`../docs/architecture.md`](../docs/architecture.md) — high-level Axiom architecture
- [`../docs/hardware.md`](../docs/hardware.md) — hardware inventory and lifecycle status
- [`../docs/networking.md`](../docs/networking.md) — network topology and configuration
- [`../docs/storage.md`](../docs/storage.md) — storage architecture and organization
- [`../docs/backup-and-recovery.md`](../docs/backup-and-recovery.md) — backup and recovery practices
- [`../docs/services.md`](../docs/services.md) — infrastructure services
- [`../docs/remote-access.md`](../docs/remote-access.md) — remote administration and access
- [`../docs/troubleshooting/README.md`](../docs/troubleshooting/README.md) — troubleshooting documentation
- [`../docs/standards/documentation.md`](../docs/standards/documentation.md) — documentation standards