ItemEvents.modification(event => {
    event.modify('farmersdelight:tomato', item => {
      item.foodProperties = food => {
        food
            .hunger(2)
            .saturation(0.1)
      }
    })
  })