---
Description: Technical DNA for the protected configuration and secret management layer.
Status: dormant
Substrate Dependencies: []
---
# 🏺 Substrate: Sacred Secrets

The Substrate is a protected path (`/substrate/`) parallel to `/root/` and `/spores/` where the application's non-volatile configuration and secrets (tokens, URLs, hashes, ports) reside.

## 🎯 Goal
To provide a secure isolation layer that allows the application to function with sensitive data without exposing that data to the Agent's reasoning context or manifestation logs.

## 🛡️ Core Rules

1.  **Strict Blindness**: The Agent must NEVER read the contents of files in `/substrate/` or reveal them in any response. 
2.  **Structural Stewardship**: The Agent is aware of the directory's existence and can create files (e.g., `.env`, `production.yaml`) and define variable names (keys), but MUST NOT assign or manifest actual values.
3.  **Explicit Reference**: Any spore requiring values from the Substrate must explicitly list the required file names in its frontmatter under `Substrate Dependencies`.
4.  **Operational Usage**: While manifesting code in `/root/`, the Agent assumes the path to `/substrate/` is available for the execution environment (e.g., sourcing into a Docker container or session). The Agent only plugs the path; it does not touch the content.
5.  **Protection**: The Substrate is considered sacred. Its values are maintained by the Chaman (User) or via the authorized IDE.
6.  **IDE Access**: The manifested IDE serves as the authorized interface for the Chaman to view and edit Substrate content securely without exposing it to the Agent's reasoning context.

## 📥 Input Dependencies
- `spores/manifest.md` (To determine required config files)

## 📤 Output Dependencies
- `/root/` (Path references in code/config)
