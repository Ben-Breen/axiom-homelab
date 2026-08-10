# Axiom Remote Access

## Purpose

This document describes the remote-access principles, security expectations,
and developing remote-administration architecture of the Axiom homelab.

Remote access refers to administrative access to Axiom systems from outside
their normal local management context.

This document distinguishes between Current, Available, Experimental, and
Planned remote-access capabilities. Software installation, platform support,
or future intent should not be interpreted as an actively deployed
remote-access service.

Public-facing application hosting is outside the primary scope of this
document unless it directly affects administration of Axiom infrastructure.

## Remote-Access Principles

Axiom remote access is guided by several principles:

- Prefer secure administrative access over convenience.
- Do not expose management services directly to the public Internet without
  a deliberate, documented, and secured reason.
- Use encrypted protocols for remote administration.
- Require strong authentication appropriate to the system being accessed.
- Prefer Multi-Factor Authentication (MFA) where supported and practical.
- Limit remote access to systems and services that actually require it.
- Apply least-privilege access where practical.
- Avoid relying on a single remote-access mechanism without understanding its
  failure and recovery implications.
- Document remote-access dependencies and recovery methods.
- Treat remote access as an administrative capability rather than a substitute
  for proper network security.

## Current Remote-Access State

Axiom does not currently document a dedicated inbound remote-administration
platform as a Current service.

Most infrastructure administration is presently performed from within the
local environment using the ASUS NUC 14 Pro Plus.

Remote-access technologies should be added to this section only after they
have been configured, tested, and verified.

## Administrative Protocols

Remote administration may eventually use protocols or platforms appropriate
to the operating system and security requirements of the target system.

Potential technologies may include:

- Secure Shell (SSH)
- Remote Desktop Protocol (RDP)
- Secure browser-based administrative interfaces
- Dedicated remote-management platforms
- Virtual Private Network (VPN) access
- Other encrypted administrative protocols

The existence of protocol support on a system does not mean that the protocol
should automatically be enabled or exposed externally.

## Secure Shell

Secure Shell (SSH) may be used for administrative access to Linux,
networking, automation, or other compatible systems.

Where SSH is deployed, configuration should consider:

- Key-based authentication
- Appropriate account permissions
- Protection of private keys
- Restricted administrative access
- Logging
- Host verification
- Removal or disabling of unnecessary access paths

Password authentication should not be retained solely for convenience when a
more appropriate authentication method has been deliberately implemented.

Actual SSH deployment details should be documented only after verification.

## Remote Desktop Protocol

Remote Desktop Protocol (RDP) may be useful for remote administration of
Windows systems.

RDP should not be exposed directly to the public Internet as a routine
remote-access method.

If RDP is used remotely, it should operate behind an appropriately secured
access layer rather than relying solely on direct Internet exposure.

Relevant controls may include:

- Strong authentication
- Multi-Factor Authentication (MFA) where supported
- Restricted network access
- Appropriate firewall policy
- Session logging
- Account lockout protection
- Timely operating-system updates

Specific RDP configuration should be documented only after implementation and
verification.

## Dedicated Remote-Access Platform

Axiom may eventually deploy a dedicated remote-access platform for secure
administration of homelab systems.

Potential requirements include:

- Encrypted connections
- Strong authentication
- Multi-Factor Authentication (MFA)
- Role-appropriate access control
- Session logging
- Device revocation
- Secure credential handling
- Support for multiple operating systems
- Local or self-hosted operation where practical
- Recovery procedures if the remote-access platform becomes unavailable

Specific technologies should remain classified as Planned or Experimental
until they are deployed and verified.

## Authentication

Remote access should use authentication mechanisms appropriate to the
sensitivity and capabilities of the system.

Potential authentication mechanisms include:

- Public-key authentication
- Strong passwords where passwords remain necessary
- Multi-Factor Authentication (MFA)
- Hardware-backed authentication
- Device-based authorization
- Centralized identity services if eventually deployed

Authentication design should avoid creating unnecessary dependence on a
single credential, device, or external provider.

Recovery methods should be documented without storing recovery secrets in
public repositories.

## Access Control

Remote users and administrative accounts should receive only the access
necessary for their intended role.

Where practical, Axiom should distinguish between:

- Normal user access
- Administrative access
- Service accounts
- Automation accounts
- Emergency or recovery access

Administrative privileges should not be granted solely because an account is
used remotely.

## Network Exposure

Remote-access services should expose the minimum network surface required for
their intended function.

Remote administration should avoid unnecessary direct exposure of:

- Operating-system management interfaces
- Storage administration
- Network-device management
- Hypervisor management
- Infrastructure dashboards
- Authentication services
- Backup administration
- Other privileged management interfaces

Where practical, remote access should enter the environment through a
deliberately controlled access path rather than exposing each managed system
individually.

## Remote Access to Network Infrastructure

Network devices such as managed switches, gateways, and future infrastructure
components should be administered through trusted management paths.

Management interfaces should not be exposed directly to the public Internet
without a specific technical requirement and appropriate security controls.

Network-device remote-access configuration should be coordinated with
[`networking.md`](networking.md).

## Remote Access to Infrastructure Services

Future Axiom services may require remote administration.

Remote administration should be distinguished from public service access.

For example, a service may be reachable by users while its administrative
interface remains restricted to trusted management paths.

Service-specific access requirements should be documented in
[`services.md`](services.md).

## Logging and Visibility

Remote-access activity should be observable enough to support troubleshooting
and security review.

Where supported, useful information may include:

- Successful authentication
- Failed authentication attempts
- Session start and end
- Administrative account used
- Source system or address
- Access method
- Security-relevant configuration changes

Logging should collect information that provides operational or security value
rather than accumulating data solely because it can be recorded.

## Remote-Access Recovery

Loss of remote access should not automatically make Axiom infrastructure
unmanageable.

Recovery planning should consider:

- Loss of authentication credentials
- Failure of a remote-access host
- Failure of an authentication service
- Network outage
- Firewall misconfiguration
- Expired or revoked credentials
- Failed software upgrade
- Loss of an authorized device

Where practical, local administrative access should remain available as a
recovery path.

Recovery procedures should avoid creating undocumented backdoors solely for
convenience.

## Secrets and Credentials

Remote-access credentials must not be committed to public Axiom repositories.

Sensitive information includes:

- Passwords
- Private keys
- Authentication tokens
- Recovery codes
- Pre-shared secrets
- Session credentials
- Application secrets

Public documentation may describe how authentication works without publishing
the credentials required to use it.

Examples should be sanitized before publication.

## Known Gaps

The Axiom remote-access architecture is still developing.

Items requiring further evaluation include:

- Primary remote-access platform
- Virtual Private Network (VPN) requirements
- Multi-Factor Authentication (MFA) implementation
- Hardware-backed authentication
- Remote-access logging
- Administrative access segmentation
- Remote-access account management
- Device authorization and revocation
- Emergency access
- Recovery procedures
- Remote access to future infrastructure services

These gaps should be updated as remote-access capabilities are selected,
implemented, and verified.

## Future Development

Potential future remote-access development may include:

- Secure remote administration of Axiom systems
- Dedicated remote-access infrastructure
- Virtual Private Network (VPN) connectivity
- Multi-Factor Authentication (MFA)
- Hardware-backed authentication
- Centralized access control
- Remote-access logging and monitoring
- Administrative access segmentation
- Documented credential-recovery processes
- Periodic review of remote-access permissions

Specific technologies should be selected according to demonstrated
requirements rather than convenience alone.

## Related Documentation

- [`architecture.md`](architecture.md) — high-level Axiom architecture
- [`hardware.md`](hardware.md) — hardware inventory and lifecycle status
- [`networking.md`](networking.md) — network topology and configuration
- [`services.md`](services.md) — infrastructure services
- [`backup-and-recovery.md`](backup-and-recovery.md) — backup and recovery
  practices
- [`standards/documentation.md`](standards/documentation.md) — documentation
  standards
