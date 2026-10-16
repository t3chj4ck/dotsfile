#!/bin/bash
# dwm 风格的 zoom for i3（Mod+Return）：
# 把聚焦的平铺窗口和工作区的第一个平铺窗口交换位置（= dwm 把窗口推上 master 位）；
# 聚焦的就是第一个时，与第二个交换（= dwm zoom() 在 master 上按下时的行为）；
# 聚焦浮动窗口时不动作。交换的是叶子窗口，永远不会触发 i3 的父子容器交换限制。

TREE=$(i3-msg -t get_tree) || exit 0

CMD=$(printf '%s' "$TREE" | python3 -c '
import json, sys

try:
    t = json.load(sys.stdin)
except Exception:
    sys.exit(0)

focused = None
def walk(n, parent):
    global focused
    n["__p"] = parent
    if n.get("focused"):
        focused = n
    for c in n.get("nodes", []):
        walk(c, n)
    for c in n.get("floating_nodes", []):
        walk(c, n)
walk(t, None)

if focused is None:
    sys.exit(0)

# 向上找到所属 workspace（浮动窗口同样挂在 workspace 下，但不在平铺叶子里）
ws = focused
while ws is not None and ws.get("type") != "workspace":
    ws = ws.get("__p")
if ws is None:
    sys.exit(0)

leaves = []
def collect(n):
    ch = n.get("nodes", [])
    if not ch:
        if n.get("window"):
            leaves.append(n)
        return
    for c in ch:
        collect(c)
collect(ws)

ids = [n["id"] for n in leaves]
try:
    i = ids.index(focused["id"])
except ValueError:
    sys.exit(0)   # 聚焦的是浮动窗口：dwm zoom() 忽略浮动窗口

if len(ids) < 2:
    sys.exit(0)
j = 1 if i == 0 else 0
print(f"[con_id=\"{ids[i]}\"] swap container with con_id {ids[j]}")
') || exit 0

[ -n "$CMD" ] && i3-msg "$CMD" >/dev/null 2>&1
