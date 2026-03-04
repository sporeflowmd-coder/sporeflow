---
Description: Defines behavior for long-running tasks that span multiple steps.
Status: growing
---
# Long-Task Spore

## 🎯 Goal
Define the protocol for handling tasks that require multiple steps to complete, ensuring persistence, recovery, and deterministic completion behavior.

## 📥 Input Dependencies
- `spores/_food/to-do.md`: Persistent storage for pending task items

## 📤 Output Dependencies
- Agent execution flow

---

## ⚡ Core Rules

### 1. What is a Long Task?
Any task that requires **more than one step** to complete is considered a long task. This includes but is not limited to:
- Multi-step workflows
- Tasks with sub-tasks
- Operations requiring sequential execution
- Any operation that cannot be completed in a single atomic action

### 2. Persistence Protocol
When a long task is initiated:
1. **Parse the task** into discrete actionable items
2. **Write each item** to `spores/_food/to-do.md`
3. **Process items sequentially**, marking each as complete
4. **After all items are done**, clear the contents of `spores/_food/to-do.md`

### 3. Recovery Behavior
If the agent instance crashes or is restarted:
- Read `spores/_food/to-do.md` on startup
- Resume from the first incomplete item found
- Continue until all items are processed
- Clear the file upon completion

### 4. Gatekeeper Rule (CRITICAL)
**The agent MUST refuse to perform ANY work** if `spores/_food/to-do.md` contains pending (incomplete) tasks.

When refused, the agent must respond with:
```
⚠️ Pending tasks detected in spores/_food/to-do.md

I cannot proceed with new instructions until all pending tasks are complete.

To proceed, you must either:
1. Manually clear/delete the contents of spores/_food/to-do.md, OR
2. Strictly instruct me to "discard" or "clear" the to-do list

Current pending tasks:
[list items from to-do.md]
```

### 5. Override Command
The user can explicitly override the gatekeeper by issuing a **strict command** containing one of these phrases:
- "discard the to-do list"
- "clear the to-do list"
- "ignore pending tasks"
- "forget the pending tasks"

When detected, the agent will clear `spores/_food/to-do.md` before proceeding.

---

## 📝 To-Do File Format

The `spores/_food/to-do.md` file must follow this structure:

```markdown
# 📋 Pending Tasks

## 🔄 In Progress
- [ ] [Task description]

## ⏳ Queued
- [ ] [Task description]
- [ ] [Task description]

## ✅ Completed
- [x] [Task description]
```

---

## 🔄 Task Lifecycle

```
[Task Initiated]
       │
       ▼
[Parse into Items]
       │
       ▼
[Write to to-do.md]
       │
       ▼
[Process Item 1] ──► [Mark Complete]
       │
       ▼
[Process Item 2] ──► [Mark Complete]
       │
       ▼
    ...
       │
       ▼
[All Items Complete?] ──Yes──► [Clear to-do.md]
       │
      No
       ▼
[Wait for Resume]
```
