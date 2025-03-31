# 2. Use Devbox and Task for Dev Env Management

Date: 2025-03-30

## Status

Accepted

## Context

We need a consistent way to manage developer dependencies and common tasks in this repo. This includes installing tools like `kubectl`, `helm`, or `adr-tools`, and providing an easy interface to run project workflows like provisioning, linting, and deploying.

There are many ways to do this: scripting (`bash`, `make`), containers (`nix`, `docker`), or task runners (`just`, `task`, etc). We want something lightweight, modern, and easy to reason about.

## Decision

We will use:
- [**Devbox**](https://www.jetpack.io/devbox/) to declaratively manage CLI tools and dependencies
- [**Task**](https://taskfile.dev) as our task runner to define repeatable dev workflows in YAML

## Rationale

- ✅ **Devbox** lets us declare tools in a `devbox.json` file and isolate environments cleanly. While we're new to it, this is a chance to learn and evaluate its developer experience.
- ✅ **Task** uses a readable `Taskfile.yml`, is language-agnostic, and fits well with our GitOps / YAML-heavy toolset.
- ✅ Both tools work well together, and `task` can call `devbox run` internally or vice versa.
- ✅ Easy onboarding for future contributors; `devbox shell` + `task` gets them going.

## Consequences

- All dev dependencies will be declared in `devbox.json`
- Repetitive CLI workflows will be defined in `Taskfile.yml`
- New contributors only need Devbox installed to start working on the repo
