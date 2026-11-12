# Public WiiCompiled source mirror

This branch preserves upstream WiiCompiled history and the reviewed portable
translator, runtime and setup recipes. Upstream source is frozen at
`ffbde831317c2a3fc7841f53e7244db83f024ff2` (0.9.4), with Aurora submodule
`33067e34a17ca680eb961d9e0f3d48ddb22a7d7f`.

The approved public builder roots are `wiicompiled-translator`,
`wiicompiled-native-prebuilt`, and `wiicompiled-setup` on x86 Linux, ARM Linux
and ARM Darwin, plus `wiicompiled-setup-unwrapped` on the two Linux platforms.
Nodtool is a setup dependency, not an additional approved standalone build root.
Game/disc/translation recipes and user game data are excluded.

Inherited upstream game/recompilation workflows are removed from this mirror.
Native package validation uses the maintained approved public builder route,
with exact source, lock, derivation and recursive-public-scope evidence for each
selected output. No host activation is part of those builds.

Future source updates preserve upstream ancestry and require ordinary source
review, regenerated dependency metadata where needed, native validation and a
reviewed public projection before consumers advance their exact pins.
