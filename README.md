# Project X Masks - QB | QBOX | ESX | Custom Frameworks

**A simple secure script that allows your players to
put on functional gas masks and night vision goggles,
the items are being used in our crime scripts, link below**

![Gas Mask](https://github.com/user-attachments/assets/64d2473d-a938-4fbc-838e-a470e2367256)
![NightVision](https://github.com/user-attachments/assets/d34bc713-1bc0-4551-9955-4ce912d334ea)

## [Our Tebex Store](https://www.projectx.gg)

## [Discord](https://discord.gg/bJNxYDAm5u)

## Features

- 🛡️ **Secure**: Checks in place to prevent duplication and exploitation
- 🔧 **Easy to Configure**: Clear configuration for all your needs
- 🛠️ **Easy Integration**: Made easy with config options
- 🐥 **Easy Installation**: Detailed README
- 📈 **Optimized**: 0.00ms
- ⬆️ *More to come when I need to use them in my scripts*

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib) (Drag and drop)

## Installation Guide

- **Drag and drop the projectx-masks folder in your resources folder**
- **Drag and drop the images from the images folder into your inventory script**
- **Copy and paste the items below into your inventory scripts accordingly**
- **Configure the config to your liking, choosing your correct Framework, Inventory, and your prefered Notification system**

## Commands

- Remove Gas Mask: 'removegasmask'
- Remove Nightvision Goggles: 'removenightvision'
- Toggle Nightvision: 'togglenightvision'

### (QBCore or others) Items to add in qb-core/shared/items.lua on the bottom of the list

```lua
 ['gasmask']        = {['name'] = 'gasmask',      ['label'] = 'Gas Mask',     ['weight'] = 450,   ['type'] = 'item',   ['image'] = 'gasmask.png',    ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = "Phewww.."},
 ['nightvision']         = {['name'] = 'nightvision',       ['label'] = 'Nightvision Goggles',      ['weight'] = 450,  ['type'] = 'item',   ['image'] = 'nightvision.png',     ['unique'] = true,   ['useable'] = true,  ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = "Phewww.."},
 ```

 ### (Ox_inventory item list)

```lua
    ['gasmask'] = {
  label = 'Gas Mask',
  weight = 450,
  stack = false,
  close = true,
  description = "Phewww..",
  client = {
   event = 'projectx-gasmask:client:UseGasMask',
  }
 },

 ['nightvision'] = {
  label = 'Nightvision Goggles',
  weight = 450,
  stack = false,
  close = true,
  description = "Phewww..",
  client = {
   event = 'projectx-gasmask:client:UseNightVision',
  }
 },
```
