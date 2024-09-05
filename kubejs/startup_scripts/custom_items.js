// Listen to item registry event
StartupEvents.registry('item', e => {
  e.create('inert_totem').maxStackSize(1)
  e.create('hammer_smithing_template')
  e.create('arrow_bundle').maxStackSize(16)

  e.create('tomato_slice').food(food => {
    food
      .hunger(1)
      .saturation(0.2)
  })


  e.create('catfish_slice').food(food => {
    food
      .hunger(1)
      .saturation(0.2)
  })
  e.create('bass_slice').food(food => {
    food
      .hunger(1)
      .saturation(0.2)
  })


  e.create('cooked_catfish_slice').food(food => {
    food
      .hunger(3)
      .saturation(0.36)
  })
  e.create('cooked_bass_slice').food(food => {
    food
      .hunger(3)
      .saturation(0.36)
  })


  e.create('catfish_roll').food(food => {
    food
      .hunger(7)
      .saturation(0.575)
  })
  e.create('bass_roll').food(food => {
    food
      .hunger(7)
      .saturation(0.575)
  })
})