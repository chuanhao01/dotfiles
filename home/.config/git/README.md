# Git configs

Hello future chuan hao  
You made this because it was easier to keep track of config updates this way.  
Multiple configs files are also here now.  
Also sensitive data is here (your keys mainly), so do not upload this anywhere.  

This is supposed to be `~/.config/git`.  
All you need is for the main/global `~/.gitconfig` to include the path to `~/.config/git/gitconfig`.  

Example:  
```bash
# .gitconfig 
# Main/Global gitconfig used by profile
# Just used to linked to Version Controlled ~/.config/git/gitconfig

[include]
	path = ~/.config/git/gitconfig
```

## Commit template
Addition and full template here (`.gitcommitmessage`):  
```bash

# --- Example ---
# [<tag>] (If applied, this commit will...) <subject> (Max 72 char)
# |<----   Preferably using up to 50 chars   --->|<------------------->|
# Changes (If any)
# Description (If any)
#
# Example
# [feat] Implement automated commit messages
#
# Changes
# - Did X
# - Did Y
#
# Description
# This was done...
# 
# --- Notes ---
# For the subject, think `If applied, this commit will...`
# A `Changes` section can be inclcuded to list changes
# A `Description` section can be included as well
# 
# General rules to follow
# 1. Limit the subject line to 50 characters
# 2. Capitalize the subject line
# 3. Use the imperative mood in the subject line
# 5. Use the description to explain what and why vs. how
# 
# --- Commit Tags ---
# Tag can be 
#    feat     (new feature)
#    fix      (bug fix)
#    refactor (refactoring code)
#    doc      (changes to documentation)
#    test     (adding or refactoring tests; no production code change)
#    version  (version bump/new release; no production code change)
#    dbg      (Changes in debugging code/frameworks; no production code change)
#    hack     (Temporary fix to make things move forward; please avoid it)
#    WIP      (Work In Progress; for intermediate commits to keep patches reasonably sized)
#    config   (changes default options)
```
