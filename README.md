# 🍄 SporeFlow: The Mycelial Manifestation Engine

SporeFlow is a protocol designed to transform human intent into executable reality. It leverages the power of Large Language Models (LLMs) like Claude or OpenCode to "grow" applications from structured Markdown definitions (Spores) into source code (Biomass). It is not just another Spec-Driven Development (SDD) framework; it is an LLM Operating System designed to manifest value from intent. Just plain text and the raw power of LLMs.

## 🚀 Quick Start

1.  **Prepare the Soil**: Create a new project directory.
2.  **Plant the Core**: Copy the `sporeflow.md` protocol file into your project root.
3.  **Summon the Agent**: Open your AI agent (Claude, OpenCode, etc.) and provide it with the `sporeflow.md` file. 
    *   *Instruction:* "I want to build an application using the attached SporeFlow protocol."
4.  **Germinate**: The agent will identify that `/spores/manifest.md` is missing. It will ask you for:
    *   Project Name
    *   Primary Languages/Tech Stack
    *   Logic Summary
    *   Deployment Target

## Germinating

To initialize your environment and begin the germination process immediately, run the following command in your terminal:

```bash
curl -sL https://raw.githubusercontent.com/sporeflowmd-coder/sporeflow/refs/heads/main/germinate.sh -o germinate.sh && bash germinate.sh
```

## 🛠️ Operational Workflow

### 1. Growing the Spores
Once the manifest is created, ask the agent to:
*   **Create Example Spores**: "Generate some initial domain spores to kick off the project."
*   **Define the DNA**: Request the creation of files in `spores/_shadow/` to define technical blueprints (database schemas, API contracts, folder conventions) that are language-agnostic.

### 2. The Nutrient Loop (Feeding the Mycelium)
The agent monitors specific files in `spores/_food/` to self-correct and take instructions:
*   **Bug Correction**: If you encounter a bug or execution error, paste the details into `spores/_food/last-bug.md`. The agent treats this as Priority 1 nutrients, fixes it, and moves the lesson to `post-mortem.md`.
*   **Atomic Tasks**: To give the agent specific tasks, add them to `spores/_food/prompt.md`. The agent will complete the task and archive the text automatically.
*   **Knowledge Injection**: You can drop any documentation or factual files into the `_food` directory to provide the mycelium with necessary information to prevent hallucinations of architectural or business rules.

### 3. Watching & Syncing
You can tell the agent to "Keep watchers open." This instructs the agent to monitor changes in your Spore files and automatically update the code in `/root/` whenever you modify your intent.

### 4. The Self-Contained IDE (through the `ide.md` spore)
If you prefer a web-based interface for managing your spores without a local editor, ask the agent to "Build the self-contained Golang IDE."
*   The agent will generate a Go backend and a modern UI that allows you to manage the spore tree through a browser.
*   Once compiled, the source is purged, leaving only the binary.

## 💾 Version Control & Portability

SporeFlow treats code as a manifestation of the spores:
-   **The DNA**: Your `/spores/` directory is the source of truth.
-   **The Biomass**: Your `/root/` directory contains the generated code.
-   **Pro Tip**: You can add `root/` to your `.gitignore`. A well-described spore structure should manifest the same application consistently, even if the code is deleted.

## 🌈 Have Fun!
The mycelial network is now yours. **Think apps into existence.**
