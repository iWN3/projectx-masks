# Project X Masks - QB | QBOX | ESX | Custom Frameworks

**A simple secure script that allows your players to
put on functional gas masks and night vision goggles
the items are being used in our crime scripts, link below**

![Gas Mask](https://cdn.discordapp.com/attachments/1224996846406078514/1304106476075356200/gasmask.png?ex=672e2f4d&is=672cddcd&hm=e56306fe10173f52b0378c68a3de3296a91db0890e861d62efbfe229f534f6e8&)
![NightVision](https://cdn.discordapp.com/attachments/1224996846406078514/1304106450477649940/nightvision.png?ex=672e2f46&is=672cddc6&hm=014e3f4ab40831d061b89e6d68358a04453b945667f99239e7a95799cd42d7a0&)

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Our Store](https://www.projectx.gg)

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

- 

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
