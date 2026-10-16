# Riddle-firstperson

Forces first-person camera while aiming or shooting from a vehicle and restores the previous camera afterwards.

## How it works

When a player aims or shoots a gun from inside a vehicle (driver or passenger, car or bike), the camera switches to first person automatically. While aiming, the camera can't be switched back to third person. Once the player stops aiming, the camera returns to the view they had before. The first time this happens, the player sees a short hint notification (can be disabled in `config.lua`).

Standalone: works on any server (ESX, QBCore, QBox or no framework). Notifications auto-detect ox_lib, QBox, QBCore, ESX or fall back to native GTA notifications.

## Installation

1. Drop `Riddle-firstperson` into your `resources` folder
2. Add `ensure Riddle-firstperson` to `server.cfg` (after your framework / ox_lib)

## Configuration

See `config.lua`. Each option has a short comment.

## Links

- Store: https://riddlecoding.tebex.io/
- Discord: https://discord.gg/t98E5Smesn

## License

MIT, see [LICENSE](LICENSE)
