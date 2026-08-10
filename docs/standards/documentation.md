# Axiom Documentation Standards

This document defines the basic documentation conventions used throughout
the Axiom Homelab repository.

The goal is to keep Axiom documentation accurate, consistent, readable,
and useful as the environment grows and evolves.

## Documentation Principles

Documentation should describe the environment as it actually exists.

Planned technologies, experimental systems, and currently deployed systems
must be clearly distinguished. Future capabilities should not be presented
as though they are already implemented.

Technical decisions should include enough context to explain why a
configuration, tool, or architecture was chosen when that information is
useful for future troubleshooting or review.

Significant problems should document the observed behavior, investigation,
root cause, resolution, verification, and lessons learned when practical.

## System Status

The following status labels may be used throughout Axiom documentation.

### Current

The system, service, technology, or configuration is presently implemented
and in use within the homelab.

### Experimental

The system or technology is being actively evaluated, tested, or used for
learning purposes but is not considered part of the established environment.

### Planned

The system, technology, or configuration is intended for future
implementation but has not yet been deployed.

## Dates and Times

Dates use the ISO 8601 calendar date format:

`YYYY-MM-DD`

Example:

`2026-08-09`

Times and timestamps should use ISO 8601 notation when the time of an event
is operationally relevant.

Example:

`2026-08-09T20:05:00-05:00`

Dates alone should be preferred when additional time precision provides no
useful technical information.

## File Naming

Documentation filenames should use lowercase letters and hyphens where
practical.

Examples:

`backup-and-recovery.md`

`remote-access.md`

`network-topology.md`

## Markdown

Documentation should use standard Markdown syntax supported by GitHub.

Headings should follow a logical hierarchy beginning with a single level-one
heading identifying the document.

Code, commands, configuration values, filenames, paths, and other technical
values should be formatted appropriately using inline code or fenced code
blocks.

## Accuracy

Documentation should distinguish verified information from assumptions.

When exact information is unknown, the documentation should identify the
uncertainty rather than substitute an unsupported value.

Configurations should be updated when the environment changes materially.

## Security and Sensitive Information

Public documentation must not contain credentials, authentication tokens,
private keys, recovery codes, or other secrets.

Configuration examples should use sanitized values or placeholders whenever
real values would expose sensitive information.

Internal infrastructure details should be included only when their disclosure
provides useful documentation value without creating unnecessary security
risk.

## Troubleshooting Records

Troubleshooting documentation should preserve useful failures as well as
successful configurations.

A troubleshooting record may include:

- Symptoms and observed behavior
- Expected behavior
- Investigation and diagnostic steps
- Root cause
- Resolution
- Verification
- Lessons learned

The purpose is not merely to record that something failed, but to preserve
the reasoning and information that may make a similar problem easier to
resolve in the future.

## Maintenance

These standards may evolve as Axiom grows.

Changes should favor clarity and practical usefulness rather than creating
documentation requirements that provide little technical value.