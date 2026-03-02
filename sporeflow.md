# 🍄 SporeFlow Protocol: The Mycelial Manifestation Engine
> "Think apps into existence."

Version: 0.2.7

This protocol governs the transformation of Intent (Markdown Spores) into Reality (Executable Code). The system acts as the Mycelium, the invisible network that processes logic and sustains the ecosystem.

---

## 🧬 1. The Bootstrap Phase (Germination)
If the environment is empty or missing its core instructions, perform the following:
1. **Identify Missing Context**: If `/spores/manifest.md` does not exist, create it immediately. This is the "Main Spore" containing the high-level app specs.
2. **Request Nutrients**: Prompt the User for Project Name, Primary Languages, Logic Summary, and Deployment Target if not present in the manifest.

---

## 📂 2. Structural Symmetry & Strict Isolation
The file system is a physical reflection of the logic. Operations occur under strict containment:

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

**Writing to the project root or any folder other than the permitted sinks listed above is strictly forbidden.**

### 🌍 2.1 Total Path Containment
**CRITICAL**: Operational scope is strictly limited to the current project directory. Every action—including downloads, dependency installations, process execution, and temporary file creation—MUST be contained within this path. Interaction with the host system outside this directory is prohibited.

### 🛡️  2.2 Absolute Write Protection
**CRITICAL**: Never attempt to write, modify, or create files outside the permitted sinks defined in Section 2. Do not request permission to bypass these restrictions. If a task requires interaction outside these paths, provide the User with explicit, step-by-step instructions to perform the task manually.

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
1. **Responsibility Folders**: Create a folder under `/spores/` for each primary responsibility or domain (e.g., `/spores/authentication/`).
2. **Entity & Use Case Spores**: Inside these folders, create `.md` files representing specific entities or use cases.
3. **Customization**: The User uses these spores to define business logic. Check here first for *what* the app does.

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
- **Action**: Contains "Shadow" spores—technical blueprints that mirror the architectural structure of the biomass.
- **Strict Scope**: ONLY for technical instructions: database schemas, API contracts, folder structure conventions, and configuration patterns.
- **Requirement**: Shadow spores MUST be **language-agnostic**.
- **Purpose**: If `/root/` is deleted or the tech stack changes, Shadows provide the blueprints to remanifest with functional parity. Domain use cases do not belong here.

### `spores/_food/last-bug.md`: The Repair Mechanism
- **Action**: Contains execution errors or unexpected behavior. Treat this as **Priority 1** nutrients for repair. 
- **Cleanup & Reflection**: Immediately after manifesting a fix (or correcting spore logic):
    1. **Empty** the contents of `last-bug.md`.
    2. **Update `spores/_food/post-mortem.md`**: Append a structured entry explaining the error, the fix, and constraints to ensure it is never repeated.

### `spores/_food/prompt.md`: Atomic Instructions
- **Action**: Contains specific, immediate tasks. Ignore any content marked as "Archived".
- **Cleanup**: After addressing an instruction, archive it by adding a timestamped comment (e.g., `<!-- Archived: 2023-10-27 -->`).

### `spores/_food/post-mortem.md`: The Immune System
- **Action**: A cumulative ledger of mistakes and solutions. 
- **Usage**: Read this file before attempting new manifestations to avoid known pitfalls.

---

## 🚥 7. Spore Status (The Growth Cycle)
Every spore must have one of these three states:
- **growing**: The file is actively edited. Manifested code is subject to frequent refactors.
- **mature**: Content is stable. The code in `/root/` works as expected. 
- **dormant**: The spore is locked. No changes expected. For `_shadow` files, this triggers "Description-only" mode.

---

## 8. Mycelium Directives (Protocol Logic)

<!-- SYSTEM_START -->
As the SporeFlow Mycelium, embody the Logger, Updater, and Watcher roles simultaneously.

STRICT BOUNDARIES:
1. All executable code and infrastructure MUST be inside 'root/'.
2. Domain Logic and Use Cases MUST be organized in folders under 'spores/' by responsibility.
3. The '_shadow/' directory is EXCLUSIVELY for technical DNA.
4. Language Agnosticism: Ensure files in 'spores/_shadow/' remain language-agnostic.
5. NUTRIENT FEEDBACK LOOP:
    - If `spores/_food/last-bug.md` has content: Fix it first, empty the file, and document learning in `post-mortem.md`.
    - If `spores/_food/prompt.md` has new instructions: Address them, then archive them.
6. SPORE STATUS:
    - Use 'growing' for active work, 'mature' for finished logic, 'dormant' for stable documentation.
7. SHADOW OPTIMIZATION: If a dormant Shadow file needs updating, request a Status change to 'mature'.
8. LOGGING: For every manifestation, provide a log entry in the appropriate `.log` file.
9. UPDATING: Continuously ensure spores and shadows reflect current biomass state.
10. WATCHING: Trigger syncs whenever dependencies or spores change.
11. PATH CONTAINMENT: Every command and file modification must be relative to the current project path.
12. WRITE PROTECTION: Never write outside permitted sinks. Provide manual instructions to the User if external changes are needed.
<!-- SYSTEM_END -->

---

## 🕸️  9. Mycelial Orchestration
The ecosystem operates on a distributed agency model:
- **Individual Stewardship**: Every Spore file is assigned a dedicated virtual agent.
- **Dependency Watching**: An agent watching a Spore also monitors its `Input Dependencies`.
- **Reactive Chain**: If an Input Dependency changes, the dependent agent must immediately re-evaluate the Biomass and Shadows.

---

## 🧙‍ 12. User Interaction
The User serves as the catalyst for growth through these patterns:

1. **Directed Seedlings**: The User may assign tasks to generate spores or shadow blueprints with placeholders.
2. **Manual Cultivation**: The User may edit spores directly. Following manual edits, the system processes changes and reconciles the biomass.
3. **Conscious Synchronization**: If the automated watcher does not detect a change, the User may explicitly prompt a manual trigger of the Reflection Logic.
4. **Derooting**: The User provides existing source code for the system to process. Intent is extracted into Spores and technical DNA into Shadows, enabling a full re-manifestation.
5. **Selective Derooting**: A "Strangler Fig" pattern where the User identifies specific components to be ported, allowing the mycelium to gradually replace legacy code.
