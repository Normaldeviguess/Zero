import os

path = os.path.expanduser("~/.config/hypr/hyprland.conf")
with open(path, "r") as f:
    lines = f.readlines()

# Filter out all old input, touchpad, and gesture lines to start fresh
clean_lines = []
skip = False
for line in lines:
    if "input {" in line or "gestures {" in line:
        skip = True
    if not skip:
        clean_lines.append(line)
    if skip and "}" in line:
        # We only stop skipping once we hit the closing bracket
        skip = False

# Add the perfect, error-free input block at the end
final_config = "".join(clean_lines) + """
input {
    kb_layout = us
    follow_mouse = 1
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    
    touchpad {
        natural_scroll = no
        tap-to-click = true
        middle_button_emulation = true
    }
}

gestures {
    workspace_swipe = on
}
"""

with open(path, "w") as f:
    f.write(final_config)
