// Listen to item registry event
StartupEvents.registry('item', e => {
  e.create('inert_totem').maxStackSize(1)
  e.create('hammer_smithing_template')
  e.create('arrow_bundle').maxStackSize(16)
})