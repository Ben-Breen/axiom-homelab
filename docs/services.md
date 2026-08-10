# Axiom Services

## Purpose

This document describes the infrastructure services used, hosted, or planned
within the Axiom homelab.

A service is documented here when it provides an ongoing function to systems,
administrators, applications, or other infrastructure components.

This document distinguishes between Current, Available, Experimental, and
Planned services. Software installation, hardware capability, or future intent
should not be interpreted as an actively deployed service.

Detailed hardware, networking, storage, backup, and remote-access information
is documented separately in the appropriate Axiom documentation.

## Service Principles

Axiom services are guided by several principles:

- Document services according to their actual deployment state.
- Prefer understandable and maintainable services over unnecessary complexity.
- Introduce services in response to practical requirements rather than solely
  because a technology is available.
- Understand a service manually before automating its administration where
  practical.
- Record dependencies so that failure of one system does not create
  unexpected failures elsewhere.
- Avoid unnecessary single points of failure for important services.
- Protect credentials, secrets, tokens, keys, and other sensitive
  configuration information.
- Verify that important services can be restored or rebuilt.
- Document significant configuration and troubleshooting information.
- Retire services deliberately when they are no longer needed.

## Current Service Environment

Axiom is still developing its dedicated infrastructure-services layer.

At present, most administrative and development activity is performed from the
ASUS NUC 14 Pro Plus rather than from dedicated infrastructure-service hosts.

Services should be added to this section only after their role, hosting
location, and operational state have been verified.

### GitHub Repository Hosting

**Status:** Current  
**Hosting:** External

GitHub currently provides remote repository hosting for Axiom documentation
and related version-controlled material.

Current uses include:

- Remote Git repository hosting
- Version history
- Documentation storage
- Change tracking
- Repository synchronization between local and remote copies

GitHub is an external dependency rather than an Axiom-hosted infrastructure
service.

Local Git repositories remain separate from the remote hosting service, and
important repository contents should remain recoverable independently of any
single working copy.

Backup and recovery considerations are documented in
[`backup-and-recovery.md`](backup-and-recovery.md).

## Current Service Hosting

### ASUS NUC 14 Pro Plus

**Status:** Current

The ASUS NUC 14 Pro Plus currently serves as the primary administrative and
development system for Axiom.

It provides the environment from which infrastructure is configured,
documented, tested, and managed.

Current capabilities include:

- Windows administrative tooling
- Windows Subsystem for Linux 2 (WSL2) environments
- Git
- PowerShell
- Scripting and development tools
- Infrastructure documentation
- Network and systems administration

These capabilities should not automatically be interpreted as continuously
running network services.

## Planned Infrastructure Services

Axiom may introduce dedicated infrastructure services as operational needs
develop.

Potential service categories include:

- Configuration management and automation
- Monitoring and observability
- Centralized logging
- Infrastructure inventory
- Scheduled administrative jobs
- Configuration backup and export
- Git automation or continuous integration
- Authentication and access management
- Remote administration
- Infrastructure dashboards
- Service health monitoring
- Notification and alerting

Individual technologies should not be documented as deployed merely because
they are being evaluated or are installed for testing.

## Future Infrastructure Management Host

A future architecture may transition the ASUS NUC 14 Pro Plus from its current
primary-workstation role to a dedicated infrastructure-management and
services role.

This transition would occur only after another workstation assumes the
primary interactive workstation and administrative role.

Potential future responsibilities for the NUC may include:

- Configuration-management control
- Infrastructure automation
- Monitoring
- Centralized logging
- Scheduled administrative tasks
- Git-related automation
- Administrative tooling
- Selected supporting infrastructure services

The final service set has not yet been determined.

Where practical, unrelated services should be separated through appropriate
virtualization, containers, or other isolation mechanisms rather than
installed as an undifferentiated collection on a single operating system.

The NUC should not become a dependency for every critical Axiom function
without consideration of failure impact and recovery requirements.

## Service Dependencies

Each important service should eventually document its dependencies.

Relevant dependencies may include:

- Host system
- Operating system
- Network connectivity
- Domain Name System (DNS)
- Storage
- Authentication
- Other services
- External providers
- Configuration files
- Credentials or secrets
- Backup and recovery mechanisms

Dependencies should be recorded clearly enough that the effect of a service
or host failure can be understood.

## Service Hosting

Services may eventually be hosted using:

- Physical systems
- Virtual machines
- Containers
- Windows environments
- Linux environments
- Raspberry Pi systems
- External service providers

The hosting method should reflect the requirements of the service rather than
being selected solely because a particular platform is available.

Service placement should consider:

- Resource requirements
- Reliability
- Security
- Isolation
- Maintenance
- Backup and recovery
- Network requirements
- Hardware dependencies
- Failure impact

## Service Configuration

Important service configuration should be documented sufficiently to support
maintenance, troubleshooting, and recovery.

Documentation may include:

- Service purpose
- Hosting system
- Deployment status
- Installation method
- Configuration location
- Network ports
- Dependencies
- Startup behavior
- Administrative interface
- Backup requirements
- Recovery method
- Monitoring method
- Upgrade history
- Known limitations

Sensitive configuration information must not be committed to public
repositories.

Examples and configuration excerpts should be sanitized before publication.

## Secrets and Credentials

Passwords, private keys, authentication tokens, recovery codes, application
secrets, and similar credentials must not be stored directly in public Axiom
documentation or repositories.

Documentation may describe:

- Where secrets are expected
- How they are referenced
- Which system manages them
- How access is controlled
- How they may be rotated or recovered

Actual secret values should remain outside public documentation.

## Monitoring and Health

As services are deployed, Axiom should develop practical methods for
determining whether they are operating correctly.

Monitoring may eventually include:

- Service availability
- Host availability
- Resource utilization
- Storage health
- Network reachability
- Application errors
- Backup status
- Scheduled-job results

Monitoring should provide useful operational information rather than generate
alerts solely because metrics are available.

## Service Recovery

Important services should have a documented method for restoration or
recreation.

Depending on the service, recovery may involve:

- Restoring configuration
- Restoring application data
- Reinstalling software
- Recreating a virtual machine or container
- Rebuilding from documented configuration
- Restoring credentials through an appropriate recovery process
- Reconnecting dependent systems

Recovery procedures should be tested where practical.

Backup and recovery policy is documented in
[`backup-and-recovery.md`](backup-and-recovery.md).

## Service Lifecycle

Services should move through lifecycle states deliberately.

A typical service lifecycle may include:

**Planned → Experimental → Current → Retired**

A service may also be removed entirely when it no longer provides useful
functionality.

Lifecycle changes should be reflected in documentation so that retired or
abandoned services are not mistaken for active infrastructure.

## Known Gaps

The Axiom services architecture is still developing.

Items requiring further evaluation include:

- Dedicated infrastructure-service hosting
- Configuration-management platform
- Monitoring platform
- Centralized logging
- Service inventory
- Authentication architecture
- Service isolation strategy
- Virtual-machine and container strategy
- Alerting and notification
- Service backup requirements
- Service recovery testing
- Dependency documentation

These gaps should be updated as services are selected, implemented, and
verified.

## Future Development

Future development may include:

- Dedicated infrastructure-management services
- Automated configuration management
- Monitoring and observability
- Centralized log collection
- Automated configuration backups
- Infrastructure inventory
- Administrative dashboards
- Git and automation services
- Authentication and access-control services
- Remote-management services
- Service recovery testing

Specific technologies should be selected according to demonstrated
requirements and should not be classified as Current until deployed and
verified.

## Related Documentation

- [`architecture.md`](architecture.md) — high-level Axiom architecture
- [`hardware.md`](hardware.md) — hardware inventory and lifecycle status
- [`networking.md`](networking.md) — network topology and configuration
- [`storage.md`](storage.md) — storage architecture and organization
- [`backup-and-recovery.md`](backup-and-recovery.md) — backup and recovery
  practices
- [`remote-access.md`](remote-access.md) — remote administration and access
- [`standards/documentation.md`](standards/documentation.md) — documentation
  standards
