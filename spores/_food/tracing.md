---
Description: Instructs agents to enclose all manifested blocks with spore name and version tags for grep-able extraction, and to add proper logs tagged with spore fingerprints.
Status: growing
Version: 3
---
# Tracing Spore

## 🎯 Goal
Ensure all manifested code/text blocks are enclosed with identifiable tags containing the source spore's name and version. This enables future agents to surgically extract specific functionality using grep, reducing token usage and increasing analysis speed. Additionally, ensure all manifested code includes proper logging with spore fingerprints that can be flagged for review.

## 📥 Input Dependencies
- None (this is a meta spore)

## 📤 Output Dependencies
- All other spores in the system

## 📋 Implementation Rules

### 1. Version Management
- Every spore MUST have a `Version` field in its header (YAML frontmatter)
- Use simple incremental integers: 1, 2, 3, ...
- Increment version on ANY change to the spore content
- Do NOT increment if the spore status is `dormant`

### 2. Enclosing Tags Format
- Use the format: `spore:<spore-name>:v<version>`
- Choose a comment syntax INVISIBLE to end users but GREP-ABLE by agents:
  - **Code files**: Use language-appropriate block/line comments
    - JS/TS: `/* SPORE:spore-name:v1 START */` / `/* SPORE:spore-name:v1 END */`
    - Python: `# SPORE:spore-name:v1 START` / `# SPORE:spore-name:v1 END`
    - Rust: `// SPORE:spore-name:v1 START` / `// SPORE:spore-name:v1 END`
    - HTML/XML: `<!-- SPORE:spore-name:v1 START -->` / `<!-- SPORE:spore-name:v1 END -->`
    - CSS: `/* SPORE:spore-name:v1 START */` / `/* SPORE:spore-name:v1 END */`
    - Shell: `# SPORE:spore-name:v1 START` / `# SPORE:spore-name:v1 END`
    - C/C#/Java: `/* SPORE:spore-name:v1 START */` / `/* SPORE:spore-name:v1 END */`
  - **Markdown files**: Use HTML comments
    - `<!-- SPORE:spore-name:v1 START -->`
    - `<!-- SPORE:spore-name:v1 END -->`
  - **Config files** (JSON/YAML/TOML): Use the comment syntax supported by the format, or wrap in a dedicated `_spore_tags` field if no comments supported
  - **Other formats**: Adapt to whatever comment mechanism exists; if none exists, add metadata field

### 3. Application Scope
- Apply to ALL manifested content: code, configs, documentation
- Tags should wrap logically cohesive blocks (functions, classes, routes, etc.)
- Place tags at the start and end of each spore-derived block

### 4. Logging with Spore Fingerprints

#### 4.1 Required Logging
Every manifested function, class, or significant code block MUST include proper logging that identifies which spore produced it.

#### 4.2 Log Fingerprint Format
- Use the format: `[SPORE:<spore-name>:v<version>]`
- Example: `logger.info('[SPORE:authentication:v3] User login attempted')`

#### 4.3 Log Flagging Mechanism
When implementing logs, the agent MUST ask the User how they want logs to be flaggable. Common approaches include:

- **Log Level Flagging**: Use specific log levels that can be filtered
  - `DEBUG`: Detailed information for debugging
  - `INFO`: General informational messages
  - `WARN`: Warning messages that might need attention
  - `ERROR`: Error messages
  
- **Custom Spore Prefix**: All spore logs include the `[SPORE:...]` prefix for easy grep-based filtering:
  ```bash
  # Extract all spore logs
  grep -r "SPORE:" --include="*.log" .
  
  # Filter logs by specific spore
  grep -r "SPORE:authentication:" --include="*.log" .
  ```

- **Environment-based Flagging**: Use environment variables to enable/disable spore logging
  - `SPORE_LOG_ENABLED=true`
  - `SPORE_LOG_LEVEL=debug`

- **Structured Metadata**: Include structured metadata in logs for programmatic filtering:
  ```json
  {"spore": "authentication", "version": 3, "action": "user_login", "level": "info"}
  ```

#### 4.4 User Preference Question
**MUST ASK**: Before implementing logging, prompt the User with:
> "How would you like spore logs to be flaggable? Options: (1) Log level filtering, (2) Custom prefix grep, (3) Environment variables, (4) Structured metadata, or (5) Other (describe)."

#### 4.5 Log Placement
- Entry points of spore-manifested functions
- Key decision points (branching logic)
- Error handlers and exception paths
- Performance-critical sections
- State transitions

#### 4.6 Example with Fingerprints

```javascript
/* SPORE:authentication:v3 START */
/* SPORE:authentication:v3 START - Logging setup */
// Logger configured with spore fingerprint
const sporeLogger = {
  info: (msg) => console.log(`[SPORE:authentication:v3] ${msg}`),
  error: (msg) => console.error(`[SPORE:authentication:v3] ERROR: ${msg}`),
  warn: (msg) => console.warn(`[SPORE:authentication:v3] WARN: ${msg}`),
  debug: (msg) => console.debug(`[SPORE:authentication:v3] DEBUG: ${msg}`)
};
/* SPORE:authentication:v3 END - Logging setup */

function authenticateUser(credentials) {
  sporeLogger.info('User login attempted'); // [SPORE:authentication:v3]
  
  if (!credentials.username || !credentials.password) {
    sporeLogger.warn('Missing credentials'); // [SPORE:authentication:v3]
    return null;
  }
  
  try {
    const user = await validateCredentials(credentials);
    sporeLogger.info('User authenticated successfully'); // [SPORE:authentication:v3]
    return user;
  } catch (error) {
    sporeLogger.error(`Authentication failed: ${error.message}`); // [SPORE:authentication:v3]
    throw error;
  }
}
/* SPORE:authentication:v3 END */
```

### 5. Grep Extraction Example
```bash
# Extract all auth-related code
grep -r "spore:auth:" --include="*.js" .

# Extract all spore logs
grep -r "SPORE:" --include="*.log" .

# Filter logs by specific spore
grep -r "SPORE:authentication:" --include="*.log" .
```

## 📝 Example Output

Given a spore named `authentication` at version 3:

```javascript
/* SPORE:authentication:v3 START */
function authenticateUser(credentials) {
  // auth logic here
}
/* SPORE:authentication:v3 END */
```

## 🔄 Version Update Protocol
1. Agent detects spore content change
2. Increment version in spore header by 1
3. Only NEW or MODIFIED blocks get the new version tag
4. EXISTING blocks keep their original version tags (preserving provenance)

**Rationale**: Each block's tag records which spore version created it. Re-tagging all blocks would destroy this historical record.
