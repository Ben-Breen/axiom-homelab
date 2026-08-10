# Axiom Backup and Recovery

## Purpose

This document describes the backup, recovery, and restoration principles,
practices, and planned capabilities of the Axiom homelab.

Backup and recovery are treated as related but distinct functions. Creating
a copy of data does not by itself demonstrate that the data can be
successfully restored.

> A backup that has never been restored is only as good as an unproven theory.

This document distinguishes between Current, Available, Experimental, and
Planned capabilities. Planned backup mechanisms should not be interpreted as
currently implemented protection.

## Objectives

The backup and recovery architecture is intended to:

- Protect important data from accidental deletion, corruption, hardware
  failure, or configuration mistakes.
- Preserve important infrastructure documentation and configuration history.
- Provide practical methods for restoring data and systems.
- Verify that protected data can actually be recovered.
- Reduce dependence on any single storage device or system.
- Document known recovery limitations rather than assuming protection exists.
- Evolve as the Axiom infrastructure becomes more complex.

## Recovery Philosophy

Axiom treats recovery as the purpose of backup.

A successful backup process should ultimately answer three questions:

1. Was the required data captured?
2. Can the required data be restored?
3. Is the restored data usable and complete enough for its intended purpose?

Backup success should therefore not be measured solely by whether a copy
operation completed without reporting an error.

Where practical, restoration should be tested independently from the original
data source.

## Data Requiring Protection

As the environment develops, backup coverage may include:

- Homelab documentation
- Git repositories
- Infrastructure configuration files
- Administrative scripts
- Automation code
- System configuration
- Network-device configuration
- Important workstation data
- Storage hosted by future infrastructure services
- Application or service data introduced later

Not every file or system necessarily requires the same backup frequency,
retention period, or recovery priority.

## Documentation and Repository Protection

Axiom documentation is maintained using Git and GitHub.

Git provides version history that can help recover previous revisions of
tracked files. A remote repository also provides an additional copy of
committed and pushed repository contents.

Version control should not, however, be treated as a complete replacement for
a broader backup strategy.

Repository recovery should eventually be tested by cloning the repository into
a separate location and verifying that the expected documentation and history
are present.

## External Storage

External NVMe storage is currently available for high-speed storage, data
transfer, testing, and backup-related use.

Its presence alone should not be interpreted as proof that all important Axiom
data is currently backed up.

Specific datasets, schedules, retention behavior, and recovery procedures
should be documented as those practices are implemented.

## Raspberry Pi NAS Platform

The Raspberry Pi-based Network Attached Storage (NAS) platform is currently
Available and under development rather than deployed.

The NAS may eventually participate in the Axiom backup architecture, but its
final role has not yet been established.

Questions still requiring evaluation include:

- Which systems or datasets it will protect
- Whether it will function as primary storage, backup storage, or both
- Filesystem selection
- Storage redundancy
- Snapshot capability
- Retention strategy
- Recovery procedures
- Protection of the NAS itself
- Whether additional off-device or off-site copies will be required

Storage redundancy should not be treated as equivalent to backup.

## Configuration Backup

Infrastructure configuration can be as important as user data.

As Axiom develops, configuration protection should include relevant
configuration from systems such as:

- Managed network devices
- Operating systems
- Infrastructure services
- Automation tools
- Storage systems
- Virtualized environments

Configuration exports should be documented, stored securely, and sanitized
before any public repository publication where they contain sensitive
information.

## Restore Verification

Recovery testing should demonstrate that protected information can be
restored into a usable state.

Depending on the data being protected, verification may include:

- Restoring an individual file
- Restoring a directory
- Cloning a repository from its remote copy
- Recovering a previous configuration revision
- Restoring application or service data
- Rebuilding a system from documented configuration
- Confirming that restored data opens, executes, or operates as expected

A restore test should record what was restored, the source used, the result,
and any problems discovered.

## Failure Scenarios

Backup and recovery planning should consider failures such as:

- Accidental file deletion
- Incorrect configuration changes
- Storage-device failure
- Filesystem corruption
- Operating-system failure
- Hardware loss
- Network-device configuration loss
- Repository corruption or accidental modification
- Malware or destructive software
- Failure of future NAS infrastructure

Recovery planning should prioritize realistic failure scenarios rather than
attempting to anticipate every theoretical possibility.

## Known Gaps

The Axiom backup and recovery architecture is still developing.

Current gaps requiring further evaluation include:

- Formal backup schedules
- Defined retention periods
- Automated backup processes
- Off-site backup strategy
- Restore-test schedules
- Recovery-time expectations
- Recovery-point expectations
- NAS integration
- Network-device configuration backup
- System configuration coverage
- Automated restore verification

These gaps are documented intentionally and should be updated as protection
mechanisms are implemented and verified.

## Future Development

Potential future improvements may include:

- Automated scheduled backups
- Multiple backup destinations
- Off-device and off-site protection
- NAS-based backup services
- Configuration export automation
- Snapshot-based recovery
- Backup monitoring and alerting
- Periodic restore testing
- Documented recovery exercises
- Recovery metrics and test history

Technologies should be selected according to demonstrated requirements rather
than added solely for architectural complexity.

## Related Documentation

- [`architecture.md`](architecture.md) — high-level infrastructure architecture
- [`hardware.md`](hardware.md) — hardware inventory and lifecycle status
- [`networking.md`](networking.md) — network architecture and configuration
- [`storage.md`](storage.md) — storage architecture and organization
- [`services.md`](services.md) — infrastructure services
- [`docs/standards/documentation.md`](standards/documentation.md) — documentation
  standards
