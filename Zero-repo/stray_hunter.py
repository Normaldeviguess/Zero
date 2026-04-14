import os
import re

path = os.path.expanduser("~/.config/hypr/hyprland.conf")
with open(path, "r") as f:
    content = f.read()

# This regex removes entire blocks of input, gestures, and touchpad 
# even if they are malformed or nested incorrectly.
patterns = [
    r'input\s*\{.*?\}',
    r'gestures\s*\{.*?\}',
    r'touchpad\s*\{.*?\}'
]

for pattern in patterns:
    content = re.sub(pattern, '', content, flags=re.DOTALL)

# Clean up double empty lines
content = re.sub(r'\n\s*\n', '\n\n', content)

# Append the ONE TRUE INPUT BLOCK
perfect_block = """
input {
    kb_layout = us
    follow_mouse = 1
    middle_button_emulation = true
    
    touchpad {
        natural_scroll = no
        tap-to-click = true
    }
}

gestures {
    workspace_swipe = on
}
"""

with open(path, "w") as f:
    f.write(content.strip() + "\n" + perfect_block)

print("Purge complete. Checking for errors...")
