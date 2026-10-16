# Riddle-firstperson

Forces first-person camera while aiming or shooting from any vehicle and restores the player's previous camera afterwards.

## Features

- Works in cars, bikes and as passenger
- Restores the previous camera mode after aiming
- Low resmon (sleeps while on foot)
- Standalone, with built-in notify support for **ox_lib, QBox, QBCore, ESX** and native GTA notifications
- Custom notify hook

## Installation

1. Put `Riddle-firstperson` into your `resources` folder
2. Add to `server.cfg`:
   ```
   ensure Riddle-firstperson
   ```
   If you use a framework or ox_lib, start it after them.

## Configuration

| Option | Description |
|---|---|
| `Config.DefaultCamMode` | Fallback camera mode (0 Close, 1 Default, 2 Far, 3 Cinematic) |
| `Config.IdleSleep` | Check interval in ms while on foot |
| `Config.Notify` | `auto`, `ox`, `qbx`, `qb`, `esx`, `native` or `custom` |
| `Config.ShowHint` | Show a one-time hint per session |
| `Config.HintTitle` / `HintText` / `HintDuration` | Hint content and duration |
| `Config.CustomNotify` | Your own notify function for `custom` |

`auto` detects in this order: ox_lib → QBox → QBCore → ESX → native.

## Note

Everything runs client-side. This is a gameplay script, not an anti-cheat.

## Support

Discord: https://discord.gg/t98E5Smesn

## License

MIT – see [LICENSE](LICENSE)

