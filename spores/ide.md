---
Description: Technical blueprints for the self-manifesting web interface (The Fruiting Body).
Status: dormant
Substrate Dependencies: [ide/config.md]
---
# 🛠️ The Self-Manifesting IDE

A specialized "Fruiting Body" manifested from a spore to allow human interaction with the mycelium.

## 🎯 Goal
Provide a UI to **create, edit, and save** spores in `/spores/` and configuration files in `/substrate/`.

## 🎨 Functional Requirements
- **UI Layout**: 
    - **Sidebar**: A recursive tree view showing all files in `/spores/` and `/substrate/`.
    - **Work Zone**: A Markdown/Text editor (syntax highlighting preferred) that loads the selected file's content.
    - **Actions**: 
        - **Save**: Persist changes back to the filesystem.
        - **Download Ecosystem**: A button to download a single ZIP file containing the `/root/`, `/spores/`, and `/substrate/` directories.
- **Constraint**: The generated ZIP file **MUST NOT** include the IDE server binary.
- **Backend (Golang)**: Must implement core capabilities: `GET /api/list`, `GET /api/read`, `POST /api/save`, and `GET /api/download` (ZIP generation). It should create its own self-signed HTTPs certificates for secure communication.

## 🏗️ Manifestation Steps
1. **Environment Preparation**: Ensure Golang is available.
2. **Configuration**: Read `spores/_ide/config.md`. (Default Port: 44104)
3. **Source Generation**: Create Golang source in `/ide/` utilizing standard packages. Implement strict path validation.
4. **UI Generation**: Embed the UI directly into the binary.
5. **Compilation**: Build the `/ide/server` binary.
6. **Purge**: Delete the `/ide/` source code. Only the binary remains.
7. **Verification**: Execute the binary and log the active URL.

## 📥 Input Dependencies
- `spores/manifest.md`
- `spores/substrate.md`

## 📤 Output Dependencies
- `/root/` (For management of the biomass)
- `/spores/` (For management of the intent)
