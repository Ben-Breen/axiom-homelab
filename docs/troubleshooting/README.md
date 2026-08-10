# Axiom Troubleshooting

## Purpose

This directory contains troubleshooting records for significant technical
problems encountered within the Axiom homelab.

The purpose of these records is to preserve useful diagnostic information,
root causes, resolutions, verification steps, and lessons learned so that
future problems can be investigated more efficiently.

Troubleshooting documentation should capture meaningful failures and useful
technical lessons rather than every minor typo, misclick, or routine mistake.

## Scope

Troubleshooting records may cover areas including:

- Hardware
- Networking
- Storage
- Operating systems
- Virtualization
- Containers
- Automation
- Remote access
- Infrastructure services
- Configuration
- Firmware
- Software tooling

A troubleshooting record should be created when the problem, investigation,
or resolution is likely to provide useful future reference.

## Record Structure

Troubleshooting records should generally include the following information:

### Summary

Provide a concise description of the problem.

### Date

Record the date using ISO 8601 calendar format:

`YYYY-MM-DD`

Include a more precise timestamp only when the exact time is operationally
relevant.

### System or Component

Identify the system, device, service, application, or infrastructure
component involved.

### Symptoms

Describe the behavior that was actually observed.

Avoid presenting assumptions or suspected causes as confirmed facts.

### Expected Behavior

Describe what should have occurred under normal conditions.

### Investigation

Document the meaningful diagnostic steps performed.

Where useful, include:

- Commands used
- Relevant observations
- Logs or error messages
- Configuration checks
- Tests performed
- Hypotheses considered
- Results that eliminated possible causes

Sensitive information must be sanitized before publication.

### Root Cause

Document the confirmed root cause when it is known.

If the cause remains uncertain, state that uncertainty explicitly rather than
presenting an assumption as fact.

### Resolution

Describe the action taken to correct or mitigate the problem.

### Verification

Explain how normal operation was confirmed after the resolution.

A change should not be considered successful solely because it completed
without reporting an error.

### Lessons Learned

Record any useful conclusion that could improve future troubleshooting,
configuration, documentation, or system design.

## File Naming

Troubleshooting filenames should use lowercase words separated by hyphens.

An ISO 8601 date prefix may be used when useful.

Example:

`2026-08-10-github-ssh-authentication.md`

Filenames should describe the issue clearly enough to remain understandable
without opening the file.

## Evidence and Accuracy

Troubleshooting documentation should distinguish between:

- Observed behavior
- Verified facts
- Working hypotheses
- Unverified assumptions

Diagnostic conclusions should be supported by the available evidence.

When a root cause cannot be established confidently, the record should say so.

## Commands and Configuration

Commands and configuration excerpts may be included when they materially help
explain the investigation or resolution.

Before publication, verify that examples do not contain:

- Passwords
- Private keys
- Authentication tokens
- Recovery codes
- Personally identifying information
- Sensitive internal addresses or names where disclosure is unnecessary
- Other confidential information

Destructive commands should be presented carefully and should clearly identify
their intended target and risk where appropriate.

## What Not to Document

This directory is not intended to record every insignificant mistake.

Examples that normally do not require their own troubleshooting record include:

- Simple spelling errors
- Obvious command typos immediately corrected
- Accidental navigation to the wrong directory
- Routine configuration changes that produced no meaningful issue
- Minor mistakes with no lasting diagnostic value

A small mistake may still justify documentation if it reveals a broader
technical lesson or could reasonably recur with significant consequences.

## Verification Philosophy

Troubleshooting is not complete when a change has merely been made.

The resolution should be tested sufficiently to demonstrate that the original
problem has been corrected and that expected functionality has been restored.

Where practical, verification should reproduce the condition that originally
failed.

## Lessons and Continuous Improvement

Troubleshooting records should contribute to the long-term improvement of
Axiom.

Useful failures may lead to changes in:

- Documentation
- Configuration
- Monitoring
- Backup and recovery
- Automation
- Architecture
- Security controls
- Operational practices

Mistakes that produce useful knowledge should be treated as opportunities to
improve the environment rather than simply forgotten after the immediate
problem is resolved.

## Related Documentation

- [`../architecture.md`](../architecture.md) — high-level Axiom architecture
- [`../hardware.md`](../hardware.md) — hardware inventory and lifecycle status
- [`../networking.md`](../networking.md) — network topology and configuration
- [`../storage.md`](../storage.md) — storage architecture and organization
- [`../backup-and-recovery.md`](../backup-and-recovery.md) — backup and recovery
  practices
- [`../services.md`](../services.md) — infrastructure services
- [`../remote-access.md`](../remote-access.md) — remote administration and access
- [`../standards/documentation.md`](../standards/documentation.md) —
  documentation standards