---
Description: Defines the /util/ directory convention and the signature verification mechanism for all utility scripts.
Status: growing
---
# Utils Spore

## 🎯 Goal
Establish a /util/ directory at the same level as /spores/ and /root/. All utility scripts created during manifestation must live here. Every util must implement a signature verification mechanism at startup that validates its compatibility with the current project state.

## 📥 Input Dependencies
- /spores/manifest.md (for computing/verifying MD5 hash)

## 📤 Output Dependencies
- /spores/_shadow/architecture.md (to document the /util/ convention)

## 🔐 Signature Verification Protocol

### 1. Location
- All utils reside in `/util/` (parallel to `/spores/` and `/root/`)
- Each util `X` must have a companion signature file `X.sig`

### 2. Verification Logic (pseudocode)
```
START:
  manifest_hash = MD5("/spores/manifest.md")
  sig_file = util_path + ".sig"

  IF NOT EXISTS(sig_file):
    WRITE sig_file, manifest_hash
    CONTINUE execution

  IF EXISTS(sig_file):
    stored_hash = READ(sig_file)

    IF stored_hash == manifest_hash:
      CONTINUE execution
    ELSE:
      FAIL_GRACEFULLY("destroy")
```

### 3. "destroy" Signal Behavior
When a mismatch is detected:
1. Log the failure reason
2. Delete the util file itself
3. Signal the agent to re-create the util with correct state
4. The re-creation will generate a fresh .sig file on next run

### 4. Failure Scenarios
- `.sig` file missing: First-run scenario → compute hash, save, proceed
- Hash mismatch: Util is stale or belongs to different project → destroy and recreate
- `manifest.md` missing: Cannot verify → fail with error (utils require manifest)
