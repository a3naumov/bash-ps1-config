# PS1 FUNCTION
# ==========================================
parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)
  [ -n "$branch" ] && echo " ($branch)"
}
PS1='\[\e[1;36m\]\u@\h:\[\e[0;32m\]\w\[\e[0;31m\]$(parse_git_branch)\[\e[0m\]$ '
# ==========================================
