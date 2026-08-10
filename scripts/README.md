# Axiom Scripts

## Purpose

This directory contains scripts used to support administration, automation,
testing, maintenance, documentation, and other repeatable tasks within the
Axiom homelab.

Scripts stored here should provide practical value by making a task more
consistent, repeatable, understandable, or efficient.

This directory is intended for reusable scripting and administrative tooling,
not for collecting arbitrary shell commands or isolated command-line
snippets.

A command does not need to become a script simply because it can be saved to a
file. Likewise, a full script should not be compressed into a one-line command
merely because the scripting language permits it.

Readability and maintainability take priority over unnecessary compression.

## Script Design

Axiom scripts should favor clear and structured logic.

Where appropriate, scripts should use:

- Meaningful variable and function names
- Parameters instead of unnecessarily hard-coded values
- Input validation
- Explicit control flow
- Appropriate error handling
- Useful status or error output
- Reusable functions when they improve clarity
- Comments where the purpose or reasoning is not obvious
- Predictable exit behavior and meaningful exit codes where appropriate
- Verification that the requested operation completed successfully

Command pipelines and command chaining may be used when they make a task
clearer or more concise.

They should not be used as a substitute for structured scripting when a task
requires branching, validation, error handling, repeated logic, state
management, or meaningful troubleshooting.

Complex logic should be expanded into readable script structure rather than
compressed into long chains of commands.

A script should be understandable by someone reviewing it later without
having to mentally reconstruct its control flow from a single line.

## Supported Scripting Environments

Axiom is not restricted to a single scripting language.

PowerShell and Python are the preferred general-purpose scripting languages
where either is appropriate. Bash or other Unix-like shell scripting may also
be used for tasks that are naturally associated with Linux or other Unix-like
environments.

Other scripting or programming languages may be used when the associated
platform, application, experiment, or technical requirement provides a
practical reason to do so.

Examples may include Lua, Perl, Lisp, JavaScript, Ruby, or other languages as
Axiom evolves.

Language selection should be based on the requirements of the task rather
than novelty or unnecessary variety.

Scripts that require a particular interpreter, runtime, module, package, or
software version should document that dependency when it is not reasonably
obvious.

## Safety and Security

Scripts should be written with the assumption that mistakes, unexpected input,
and environmental differences can occur.

Operations capable of modifying or deleting data, changing system
configuration, restarting services, altering permissions, modifying network
settings, or otherwise disrupting a system should be handled deliberately.

Where appropriate, scripts should:

- Validate important paths and values before acting on them
- Confirm required resources exist
- Detect missing dependencies
- Avoid unnecessarily broad operations
- Fail safely when required conditions are not met
- Provide meaningful errors rather than silently continuing
- Verify the result of significant changes
- Support non-destructive testing or preview behavior where practical

Destructive operations should make their intended target clear.

Scripts should not depend on safeguards in an underlying command as the only
protection against incorrect paths, variables, arguments, or target selection.

Credentials and other sensitive information must not be embedded in scripts
committed to this repository.

This includes passwords, private keys, authentication tokens, recovery codes,
application secrets, and similar authentication material.

Where scripts require sensitive values, those values should be supplied
through an appropriate external mechanism such as environment variables,
credential stores, protected configuration, or another suitable secrets
management method.

Examples and diagnostic output should also be reviewed before publication to
ensure that sensitive information has not been exposed unintentionally.

## Testing and Verification

A script should not be considered successful merely because it completed
without producing an obvious error.

Where practical, scripts should be tested against the conditions they are
intended to handle and their results should be verified.

Testing may include:

- Normal expected operation
- Invalid or missing input
- Missing files or dependencies
- Unexpected system state
- Permission failures
- Repeated execution and its effects
- Partial failure conditions
- Recovery or cleanup behavior

Where practical, scripts intended for repeated use should behave predictably
when executed more than once and should not create unintended duplicate
changes or destructive side effects.

The amount of testing should be appropriate to the risk and complexity of the
script.

A small informational script may require little more than verification of its
output. A script capable of modifying infrastructure should receive
substantially greater scrutiny.

Experimental scripts should be identified as such when their reliability or
behavior has not yet been established sufficiently for normal use.

When a scripting failure produces a useful troubleshooting lesson, the
problem, investigation, resolution, and verification may be documented under
[`../docs/troubleshooting/`](../docs/troubleshooting/).

## Documentation and Organization

Each script should contain enough information for its purpose and basic usage
to be understood.

For scripts of meaningful complexity, useful documentation may include:

- Purpose
- Required parameters
- Optional parameters
- Dependencies
- Expected environment
- Example usage
- Important assumptions
- Output or return behavior
- Safety considerations
- Known limitations

Documentation may be included in the script itself or in accompanying Markdown
when additional explanation is useful.

Filenames should normally use clear, descriptive names appropriate to the
scripting language and platform.

As the directory grows, scripts may be organized into subdirectories according
to platform or function. Possible categories may include administration,
networking, storage, backup, monitoring, deployment, testing, or maintenance.

Subdirectories should be created when actual scripts require them rather than
solely to establish an empty hierarchy.

Scripts that rely on configuration files should keep reusable configuration
separate from executable logic where practical.

Configuration material intended for version control belongs under
[`../configs/`](../configs/) when that organization provides a clearer
separation of responsibilities.

## Change Management

Scripts should be maintained through Git like the rest of the Axiom
documentation and configuration.

Meaningful changes should use commit messages that describe the purpose of the
change rather than simply stating that a script was modified.

Changes affecting script behavior should be reviewed for unintended effects,
especially when the script performs administrative or destructive operations.

Obsolete scripts should be updated, retained with clear historical context
when they remain useful, or removed when they no longer provide practical
value.

A script should not remain in normal use simply because it has worked in the
past. Changes to operating systems, software versions, dependencies,
permissions, application programming interfaces (APIs), hardware, or
infrastructure may alter its behavior.

The contents of this directory should evolve alongside Axiom as repeatable
manual tasks become good candidates for reliable automation.

Automation should follow understanding rather than replace it.

## Related Documentation

- [`../configs/README.md`](../configs/README.md) — configuration files, templates, and sanitized exports
- [`../docs/architecture.md`](../docs/architecture.md) — high-level Axiom architecture
- [`../docs/networking.md`](../docs/networking.md) — network topology and configuration
- [`../docs/storage.md`](../docs/storage.md) — storage architecture and organization
- [`../docs/services.md`](../docs/services.md) — infrastructure services
- [`../docs/backup-and-recovery.md`](../docs/backup-and-recovery.md) — backup and recovery practices
- [`../docs/troubleshooting/README.md`](../docs/troubleshooting/README.md) — troubleshooting documentation
- [`../docs/standards/documentation.md`](../docs/standards/documentation.md) — documentation standards