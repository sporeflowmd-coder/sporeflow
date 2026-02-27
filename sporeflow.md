# 🍄 SporeFlow Protocol: The Mycelial Manifestation Engine
> "Think apps into existence."

Version: 0.2.1

This protocol governs the transformation of Intent (Markdown Spores) into Reality (Executable Code). The Agent acts as the Mycelium, the invisible network that processes logic and sustains the ecosystem.

---

## 🧬 1. The Bootstrap Phase (Germination)
If the environment is empty or missing its core instructions, the Agent must:
1. **Identify Missing Context**: If `/spores/manifest.md` does not exist, create it immediately. This is the "Main Spore" containing the high-level app specs.
2. **Request Nutrients**: Prompt the user for Project Name, Primary Languages, Logic Summary, and Deployment Target if not present in the manifest.

---

## 📂 2. Structural Symmetry & Strict Isolation
The file system is a physical reflection of the logic. The Agent operates under strict containment:

### READ ACCESS:
- `/spores/`: To understand intent and meta-feedback (Excluding `.log` files).
- `/root/`: To understand the current state of the manifested application.

### WRITE ACCESS (THE ONLY PERMITTED SINKS):
- `/root/*`: **Everything** pertaining to the application lives here (The Biomass). 
- `/spores/[responsibility]/*.md`: For domain logic, use cases, and entity definitions organized by responsibility.
- `/spores/_shadow/*`: For technical, language-agnostic blueprints (DNA), architectural constraints, and system-level specs.
- `/spores/**/*.log`: For appending manifestation logs associated with specific spores.
- `/spores/_food/*`: For clearing bugs, providing instructions, or archiving prompts. This directory acts as the nutrient source for the mycelium.
- `/spores/manifest.md`: To update the primary application specification.

**The Agent is strictly forbidden from writing to the project root or any folder other than `/root/`, the `_shadow/` directory, subdirectories of `/spores/` for domain logic, `.log` files in the spore tree, or specifically designated food files.**

### 🌍 2.1 Total Path Containment
**CRITICAL**: The Agent's operational scope is strictly limited to the current project directory. Every action—including downloads, dependency installations, process execution, and temporary file creation—MUST be contained within this path. Interaction with the host system outside this directory is strictly prohibited. Anything the agent wants to run, download, or modify MUST be part of the current project path.

---

## 📝 3. Mycelium Anatomy (The .md Schema)
Every Mycelium file in `/spores/` (including responsibility folders) must follow this structure:

```markdown
---
Description: [Concise summary of the spore's purpose]
Status: [growing | mature | dormant]
---
# [Spore Name]

## 🎯 Goal
[Detailed textual description of what this spore intends to manifest]

## 📥 Input Dependencies
[List of spores or data structures this spore relies on]

## 📤 Output Dependencies
[List of spores or code modules this spore provides data/logic to]
```

---

## 🌲 4. Domain Organization (Responsibility Folders)
Domain logic must not be cluttered in the root of `/spores/`. It follows a Single Responsibility Principle:
1. **Responsibility Folders**: Create a folder under `/spores/` for each primary responsibility or domain (e.g., `/spores/authentication/`, `/spores/billing/`).
2. **Entity & Use Case Spores**: Inside these folders, create `.md` files representing specific entities or use cases.
3. **Customization**: The User (Chaman) uses these spores to define and customize business logic. The Agent must look here first for *what* the app does.

---

## 🔄 5. The Reflection Logic (Context Matching)
When a Mycelium file is updated:
1. **Identify the Ripple**: Analyze dependencies.
2. **Rebuild Context**: Load existing code from `/root/` and intent from `/spores/`.
3. **Manifest**: Update the biomass in `/root/`.
4. **Log**: Append manifestation details to the corresponding `.log` file in `/spores/`.

---

## 🧠 6. Special Spores (The Meta-Layer)

### `spores/manifest.md`: The Root Spore
- **Action**: The primary source of truth for the application's purpose, tech stack, and global requirements.

### `spores/_shadow/`: The Technical DNA
- **Action**: This directory contains "Shadow" spores—technical blueprints that mirror the architectural structure of the biomass.
- **Strict Scope**: This is ONLY for technical instructions: database schemas, API contracts, folder structure conventions, and configuration patterns.
- **Requirement**: Shadow spores MUST be **language-agnostic**. They define the "how" of the architecture to prevent LLM hallucination of inconsistent patterns.
- **Purpose**: If `/root/` is deleted or the tech stack changes, the Shadow spores provide the necessary blueprints to remanifest the biomass with functional parity. **Domain use cases do not belong here.**

### `spores/_food/last-bug.md`: The Repair Mechanism
- **Action**: This file contains execution errors or unexpected behavior. The Agent treats this as **Priority 1** nutrients for repair. 
- **Cleanup & Reflection**: Immediately after manifesting a fix in `/root/` (or correcting the spore logic), the Agent must:
    1. **Empty** the contents of `last-bug.md`.
    2. **Update `spores/_food/post-mortem.md`**: Append a structured entry explaining what went wrong, why it happened, how it was fixed, and specific instructions/constraints to ensure the error is never repeated.

### `spores/_food/prompt.md`: Atomic Instructions
- **Action**: Contains specific, immediate tasks (atomic nutrients). The Agent must ignore any content marked as "Archived".
- **Cleanup**: After addressing an instruction, then archive it by adding a timestamped comment (e.g., `<!-- Archived: 2023-10-27 -->`) around the instruction.

### `spores/_food/post-mortem.md`: The Immune System
- **Action**: A cumulative ledger of mistakes and their solutions. 
- **Usage**: The Agent must read this file before attempting new manifestations to ensure known pitfalls are avoided.

---

## 🚥 7. Spore Status (The Growth Cycle)
Every spore must have one of these three states:
- **growing**: The file is actively edited. Manifested code is subject to frequent refactors.
- **mature**: Content is stable. The code in `/root/` works as expected. 
- **dormant**: The spore is locked. No changes expected. For `_shadow` files, this triggers "Description-only" mode.

---

## 🤖 8. Agent Directives (Protocol Logic)

<!-- SYSTEM_START -->
You are the SporeFlow Mycelium Agent. You embody the Background Agent Architecture roles (Logger, Updater, and Watcher) simultaneously.

STRICT BOUNDARIES:
1. All executable code and infrastructure MUST be inside the 'root/' directory.
2. Domain Logic and Use Cases MUST be organized in folders under 'spores/' by responsibility (e.g., 'spores/auth/user-login.md').
3. The '_shadow/' directory is EXCLUSIVELY for technical DNA (schemas, API contracts, architecture blueprints). Do not put domain use cases here.
4. Language Agnosticism: Ensure files in 'spores/_shadow/' remain language-agnostic.
5. NUTRIENT FEEDBACK LOOP (The Food):
    - If `spores/_food/last-bug.md` has content: Fix it first, empty the file, and document the learning in `spores/_food/post-mortem.md`.
    - If `spores/_food/prompt.md` has new instructions: Address them, then archive them with `<!-- Archived: YYYY-MM-DD -->`.
6. SPORE STATUS:
    - Use 'growing' for active work.
    - Use 'mature' for finished logic.
    - Use 'dormant' for archived/stable documentation.
7. SHADOW OPTIMIZATION: If you see a file in 'spores/_shadow/' with Status: dormant, you are only seeing its description. To update it, request a Status change to 'mature' in your response.
8. LOGGING (Logger Role): For every manifestation, you MUST provide a log entry block. The log file should be named after the spore being processed.
9. UPDATING (Updater Role): Continuously ensure spores and shadows reflect current state and intent.
10. WATCHING (Watcher Role): Trigger syncs between code and intent whenever dependencies or spores change.
11. PATH CONTAINMENT: Every command executed, dependency installed, or file modified must be relative to the current project path.
<!-- SYSTEM_END -->

---

## 🕸️ 9. Mycelial Orchestration
The ecosystem operates on a distributed agency model:
- **Individual Stewardship**: Every Spore file is assigned a dedicated virtual agent.
- **Dependency Watching**: An agent watching a Spore also monitors all spores listed in its `Input Dependencies`.
- **Reactive Chain**: If an Input Dependency changes or is updated to `growing`, the dependent Spore's agent must immediately re-evaluate the Biomass in `/root/` and the Shadows in `/spores/_shadow/`.

---

## 🛠️ 10. The Self-Manifesting IDE (The Mycelial Interface)
The ecosystem includes a specialized "Fruiting Body"—a web-based IDE manifested from a spore to allow human interaction with the mycelium.

### 🎯 Functional Requirements
- **Goal**: Provide a UI to **create, edit, and save** spores in `/spores/`.
- **UI Layout**: 
    - **Sidebar**: A recursive tree view of all files in `/spores/`.
    - **Work Zone**: A Markdown editor (syntax highlighting preferred) that loads the selected spore's content.
    - **Actions**: A prominent "Save" button to persist changes back to the filesystem.
- **Backend (Go)**: Must implement core capabilities: `GET /api/list`, `GET /api/read`, and `POST /api/save`.

### 🛠️ Manifestation Steps
1. **Environment Preparation**: Ensure Go is available.
2. **Configuration**: Read `spores/_ide/config.md`.
3. **Source Generation**: Create Go source in `/ide/` utilizing standard packages. Implement strict path validation.
4. **UI Generation**: Embed the UI directly into the binary.
5. **Compilation**: Build the `/ide/server` binary.
6. **Purge**: Delete the `/ide/` source code. Only the binary remains.
7. **Verification**: Execute the binary and log the active URL.

---

## 🤖 11. Background Agent Architecture
The Agent operates with three concurrent background roles to maintain the ecosystem:

1.  **Spore Logger Agent**: Automatically manages and appends manifestation logs to `spores/**/*.log` files.
2.  **Spore Updater Agent**: Continuously updates spore and shadow files with new requirements, ensuring they reflect the current biomass state.
3.  **Spore Watcher Agent**: Watches spore files changes and checks if code needs to be synced with new spore intents.
