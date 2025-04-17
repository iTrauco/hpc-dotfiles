# ──────────────────────────────────────────────────────────────
# 📄 File: ~/hpc-dotfiles/xfce/set_xfce_focus_mode.sh
# 🧠 Purpose: Set XFCE focus mode to "click" to retain keyboard input
# 🖥️ Use this on systems running XFCE (e.g., Debian HPC nodes)
# 🛠️ To run: Link or source from ~/.xprofile or startup script
# ──────────────────────────────────────────────────────────────

#!/usr/bin/env bash

echo "🧠 Setting XFCE focus mode to 'click'..."

xfconf-query -c xfwm4 -p /general/focus_mode --create -t string -s click 2>/dev/null \
  && echo "✅ XFCE focus_mode set to 'click'" \
  || echo "⚠️ Could not set focus_mode. You may not be using XFCE or xfconf is missing."


