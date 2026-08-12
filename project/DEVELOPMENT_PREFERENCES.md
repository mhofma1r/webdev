Commit/message preference: Michael likes gitmoji in commit messages and prefers adherence to widely adopted best practices.
Result summaries preference: After completing requested work and presenting results, include a suitable commit message by default.
Memory maintenance preference: If a stored memory is clearly stale or no longer relevant, it may be removed instead of preserved.

# Development Preferences – Michael

## General Principles

- Prioritize practical, working solutions over theoretical perfection.
- Assume a Linux-first environment unless explicitly stated otherwise.
- Prefer solutions that are easy to maintain in a homelab or small-team environment.
- Explain tradeoffs when multiple valid approaches exist.
- Do not introduce unnecessary frameworks, abstractions, or dependencies.
- Keep solutions simple unless complexity is justified.
- clean code is better than well-commented code.
- common coding practices usually lead to better code. tharefore, we should try to follow them.

---

## Operating System Assumptions

Unless told otherwise, assume:

- Debian-based Linux systems
- Debian 12 or Kubuntu

Avoid instructions that depend on:

- Windows-specific tooling
- macOS-specific tooling
- GUI-only workflows

---

## Communication Style

### For Multi-Step Troubleshooting

- Present **one step at a time**.
- Wait for confirmation before moving to the next step.
- Do not provide a 20-step checklist unless specifically requested.

### For Debugging

When debugging code:

- Return the **entire corrected snippet/file**.
- Do not return partial patches unless explicitly requested.
- Minimize explanations.
- Focus on fixing the problem.

### For Technical Explanations

- Be concise.
- Assume solid technical knowledge.
- Avoid over-explaining basic Linux, networking, or programming concepts.
- Provide deeper explanations when discussing architecture, security, or design decisions.

---

## Development Stack

### Primary Languages

- PHP
- JavaScript
- Bash

### Databases

- MariaDB
- PDO preferred when working directly with SQL

### PHP Preferences

- Modern PHP
- Composer-based projects
- Prefer clear, maintainable code
- Avoid unnecessary magic

Commonly used:

- Doctrine ORM
- Symfony Components
- Laravel

Assume familiarity with:

- Dependency Injection
- Routing
- MVC concepts
- ORM patterns

---

## Frontend Preferences

### JavaScript

- Prefer vanilla JavaScript unless a framework is already present.
- Keep implementations straightforward.
- Avoid unnecessary build complexity.

### Vue

- Prefer Vue 3
- Prefer Single File Components (`.vue`)
- Bundler-based setup is acceptable

---

## Infrastructure Preferences

### Containers

- Docker-friendly solutions preferred
- Containerized development environments are common

### Deployment

- rsync-based deployments are acceptable
- SSH-based workflows are preferred
- CI/CD should be compatible with GitLab CI

### Homelab

Assume experience with:

- Proxmox
- WireGuard
- Reverse proxies
- Linux containers
- Self-hosted services

---

## Security Preferences

- Prefer secure defaults.
- Explain security implications when relevant.
- Avoid recommending insecure shortcuts without clearly labeling them.
- When investigating compromise:
    - Focus on evidence collection first.
    - Avoid destructive remediation steps until indicators are confirmed.

---

## Code Style

### General

- Favor readability over cleverness.
- Keep functions focused.
- Avoid unnecessary abstraction layers.
- Avoid premature optimization.

### Bash

- Use `#!/usr/bin/env bash`
- Prefer robust scripting practices
- Quote variables appropriately
- Consider failure scenarios

### PHP

- Use strict typing where appropriate
- Prefer explicitness over magic
- Favor dependency injection

### JavaScript

- Use modern syntax
- Prefer `const` and `let`
- Avoid legacy patterns unless compatibility requires them

---

## Architecture Preferences

### Preferred Characteristics

- Modular
- Maintainable
- Observable
- Self-hostable

### Avoid

- Vendor lock-in
- Excessive microservices
- Enterprise complexity without justification

---

## AI Assistant Expectations

When generating code:

- Produce code that can realistically be deployed.
- Do not leave obvious TODOs unless requested.
- Do not generate placeholder implementations for critical functionality.
- If assumptions are required, state them explicitly.

When reviewing code:

- Point out bugs.
- Point out security concerns.
- Point out maintainability concerns.
- Suggest improvements only when they provide meaningful value.

When multiple solutions exist:

1. Recommend the preferred approach.
2. Briefly explain why.
3. Mention alternatives when relevant.

---

## Project-Specific Context

### LogRefinery

- Goal: Extract intelligence from collected log data.
- Data source: Homelab log aggregation.
- MariaDB is the primary datastore.
- Automation and maintainability are important.

### ScientiViva

- Educational platform.
- Focus areas:
    - Mathematics
    - Digital skills
    - Media literacy
- AI-assisted learning is a core feature.
- Solutions should prioritize accessibility and learner support.

---

## Git Commit Messages

- Prefer Gitmoji when appropriate.
- Commit messages should clearly explain:
    - What changed
    - Why it changed

Example:

✨ Add asynchronous plugin execution to prevent Terminator UI freezes

---

## Assumed Skill Level

Assume the user is comfortable with:

- Linux administration
- Docker
- Networking
- SSH
- PHP development
- Databases
- CI/CD concepts
- Self-hosted infrastructure

Avoid beginner-level explanations unless explicitly requested.