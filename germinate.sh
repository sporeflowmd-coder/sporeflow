#!/bin/bash

# --- Configuration ---
SPOREFLOW_SOURCE_URL="https://raw.githubusercontent.com/sporeflowmd-coder/sporeflow/refs/heads/main/sporeflow.md"

# --- Argument Parsing ---
SILENT=false
for arg in "$@"; do
    if [ "$arg" == "--silent" ]; then
        SILENT=true
        shift
    fi
done

# --- Input Helpers ---
prompt_user() {
    local var_name=$1
    local prompt_text=$2
    local default_val=$3
    local examples=$4

    if [ "$SILENT" = true ]; then
        eval "$var_name=\"$default_val\""
    else
        echo -e "\n🍄 $prompt_text"
        echo -e "   Examples: $examples"
        read -p "   (Default: $default_val): " input_val
        if [ -z "$input_val" ]; then
            eval "$var_name=\"$default_val\""
        else
            eval "$var_name=\"$input_val\""
        fi
    fi
}

# --- 1. Gathering Nutrients ---
echo "🧬 SporeFlow Germination Engine"

prompt_user "PROJECT_NAME" "Project Name" "mycelium-project" "my-api, spore-tracker, web-harvester"
prompt_user "TECH_STACK" "Primary Tech Stack" "Python/General" "Node/TypeScript, Rust/Wasm, Python/FastAPI"
prompt_user "LOGIC_SUMMARY" "Logic Summary (What does it do?)" "A project following SporeFlow protocol." "A real-time chat app, A CSV processing pipeline"
prompt_user "DEPLOYMENT" "Deployment Target" "Local Execution" "Vercel, Docker, AWS Lambda, GitHub Pages"

echo -e "\n🌱 Germinating in: ./$PROJECT_NAME..."

# --- 2. Protocol Check ---
if [ ! -f "sporeflow.md" ]; then
    echo "🔍 sporeflow.md not found locally. Attempting to download protocol..."
    if curl -s -O "$SPOREFLOW_SOURCE_URL"; then
        echo "✅ Protocol downloaded successfully."
    else
        echo "❌ Error: Could not download sporeflow.md. Please place it manually in this directory."
        exit 1
    fi
fi

# --- 3. Create Directory Structure ---
mkdir -p "$PROJECT_NAME/root"
mkdir -p "$PROJECT_NAME/spores/_shadow"
mkdir -p "$PROJECT_NAME/spores/_food"
mkdir -p "$PROJECT_NAME/spores/core"

# --- 4. Create Spore Manifest (The Root Spore) ---
cat <<EOF > "$PROJECT_NAME/spores/manifest.md"
---
Description: Root Spore for $PROJECT_NAME. Defines the global vision and environment.
Status: growing
---
# Manifest: $PROJECT_NAME

## 🎯 Goal
$LOGIC_SUMMARY

## 🛠️ Tech Stack / Tools
- Primary Medium: $TECH_STACK
- Deployment Target / Outcome: $DEPLOYMENT

## 📥 Input Dependencies
- None (Root)

## 📤 Output Dependencies
- /spores/_shadow/architecture.md
EOF

# --- 5. Create Nutrient Files (_food) ---
touch "$PROJECT_NAME/spores/_food/last-bug.md"

cat <<EOF > "$PROJECT_NAME/spores/_food/prompt.md"
# 🍎 Atomic Instructions
- [ ] Define the base folder structure in /root/ based on $TECH_STACK conventions.
EOF

cat <<EOF > "$PROJECT_NAME/spores/_food/post-mortem.md"
# 🧠 Immune System (Post-Mortems)
Errors and fixes are recorded here to prevent regressions.

---
EOF

# --- 6. Create Initial Shadow Spore (Architectural DNA) ---
cat <<EOF > "$PROJECT_NAME/spores/_shadow/architecture.md"
---
Description: Language-agnostic technical blueprint for $PROJECT_NAME.
Status: growing
---
# System DNA

## 🏗️ Structure Convention
- /root/src: Source files or primary assets.
- /root/output: Resulting artifacts or compiled data.

## 🔌 Core Interfaces / Contracts
TBD
EOF

# --- 7. Finalize ---
echo "--- Initial manifestation ---" > "$PROJECT_NAME/spores/manifest.log"
cp "sporeflow.md" "$PROJECT_NAME/"

cd "$PROJECT_NAME"
echo -e "\n✅ Germination complete."
echo "📂 Your biomass lives in /root/"
echo "🍄 Your intent lives in /spores/"
echo "🚀 Point your agent to this directory to begin manifestation."
