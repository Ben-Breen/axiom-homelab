# Axiom Configurations

## Purpose

This directory contains configuration files, templates, sanitized exports, and
configuration examples used to document and support the Axiom homelab.

Configuration stored here should provide practical value for understanding,
rebuilding, troubleshooting, testing, or maintaining Axiom systems. This
directory is not intended to be a complete dump of every configuration file
from every device or operating system.

Files should be added deliberately and should represent configuration that is
useful enough to preserve in version control.

Configuration may include material associated with networking, operating
systems, storage, services, Raspberry Pi systems, automation, remote access,
and other infrastructure components as Axiom develops.

## Configuration Use

Configuration files should make their purpose and status reasonably clear.

A file may represent:

- **Current** — A sanitized representation of configuration presently in use.
- **Experimental** — Configuration being tested or evaluated.
- **Example** — An illustrative configuration that does not necessarily match
  the live environment.
- **Template** — A reusable configuration containing placeholders for values
  that must be supplied before use.
- **Historical** — Configuration retained from an earlier system state because
  it still provides useful technical or operational context.

Examples and templates must not be presented as Current simply because they
are technically valid.

Where practical, configuration should remain in the native format used by the
system or application. This makes the material easier to compare, validate,
reuse, and track through Git.

Formats may include files such as `.conf`, `.ini`, `.json`, `.yaml`, `.yml`,
`.toml`, `.xml`, `.ps1`, `.rsc`, and other formats required by the associated
platform.

When an application requires a specific filename or naming convention, that
requirement takes precedence over the general Axiom filename convention.

## Security and Sanitization

Every configuration file must be reviewed before it is committed to the
repository.

Credentials and other secrets must not be stored here.

This includes:

- Passwords
- Private keys
- Authentication tokens
- Application secrets
- Recovery codes
- Session credentials
- Pre-shared secrets
- Other confidential authentication material

Sensitive values should be removed or replaced with unmistakable
placeholders.

For example:

```text
username = example-user
password = <REDACTED>
api_token = <REDACTED>
```

Where a configuration obtains a secret from another source, the committed
configuration may reference that source without including the secret itself.

For example:

```text
api_token = ${AXIOM_API_TOKEN}
```

Information that is not technically secret should still be reviewed before
publication when it unnecessarily reveals details about the environment.
Examples may include internal addresses, account names, sensitive hostnames,
device identifiers, management endpoints, serial numbers, or personally
identifying information.

Sanitization should preserve the technical meaning of a configuration as much
as practical without exposing information that does not need to be public.

A secret accidentally committed to Git must be treated as exposed. Removing
the value from a later revision does not remove it from repository history.

Preventing sensitive information from entering the repository is therefore
preferable to attempting to remove it afterward.

## Organization and Naming

Configuration files should be organized according to the systems or functions
they support.

Subdirectories may be introduced as the repository grows. Possible examples
include:

```text
configs/
├── network/
├── linux/
├── windows/
├── raspberry-pi/
├── storage/
└── services/
```

These directories should be created when actual configuration material
requires them rather than simply to populate an empty hierarchy.

When the underlying software does not require a particular filename, Axiom
filenames should normally use lowercase words separated by hyphens.

Examples include:

```text
mikrotik-switch-example.rsc
ssh-server-example.conf
samba-share-example.conf
backup-job-template.yaml
```

Configuration files should contain enough context for their purpose to be
understood.

When the format supports comments, useful information may include the system
or service involved, configuration purpose, important dependencies, lifecycle
status, sanitized values, required placeholders, or significant assumptions.

When the native format does not support comments, a nearby Markdown file may
be used to provide the necessary explanation.

Documentation should remain concise enough that configuration files do not
become substitutes for the primary Axiom documentation.

## Validation and Change Management

A configuration should not be described as working merely because it appears
syntactically correct.

Where practical, Current and Experimental configuration should be validated on
the system or service for which it is intended.

Validation may include syntax checking, successful import or application,
service startup, connectivity testing, functional testing, or confirmation
that the expected settings are actually active.

If a configuration has not been tested, that limitation should be stated
rather than assuming that it will work.

Configuration examples should also not be assumed to be directly deployable
on another system without review. Differences in operating system versions,
software versions, hardware, network design, dependencies, permissions, or
local requirements may affect their behavior.

Git provides a history of configuration changes, but significant changes
should still have meaningful commit messages. A commit should describe the
purpose of the change when that purpose is not obvious from the diff alone.

Changes that materially affect architecture, networking, storage, services,
remote access, security, or recovery should also be reflected in the
corresponding Axiom documentation.

When a configuration failure produces useful diagnostic knowledge, the issue
and its resolution may also be recorded under
[`../docs/troubleshooting/`](../docs/troubleshooting/).

Configuration stored in this repository may assist with rebuilding and
recovery, but the repository itself is not a complete configuration backup
strategy. Some systems require additional state, metadata, credentials,
encryption material, or exports that cannot or should not be stored in a
public repository.

Recovery requirements should therefore be considered separately from the
presence of a configuration file in this directory.

Obsolete configuration should be updated, clearly retained as Historical when
it remains useful, or removed when it no longer provides meaningful value.
Old configuration should not remain in a form that could easily be mistaken
for the Current environment.

The contents of this directory should evolve with Axiom as real configuration
becomes worth preserving.

## Related Documentation

- [`../docs/architecture.md`](../docs/architecture.md) — high-level Axiom architecture
- [`../docs/networking.md`](../docs/networking.md) — network topology and configuration
- [`../docs/storage.md`](../docs/storage.md) — storage architecture and organization
- [`../docs/services.md`](../docs/services.md) — infrastructure services
- [`../docs/backup-and-recovery.md`](../docs/backup-and-recovery.md) — backup and recovery practices
- [`../docs/remote-access.md`](../docs/remote-access.md) — remote administration and access
- [`../docs/troubleshooting/README.md`](../docs/troubleshooting/README.md) — troubleshooting documentation
- [`../docs/standards/documentation.md`](../docs/standards/documentation.md) — documentation standards