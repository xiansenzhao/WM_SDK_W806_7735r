#ifndef __SPI_H
#define __SPI_H

#include "wm_hal.h"
#include "assert.h"


extern SPI_HandleTypeDef hspi;
extern DMA_HandleTypeDef hdma_spi_tx;
extern DMA_HandleTypeDef hdma_spi_rx;

void SPI_Init();
void DMA_Init(void);


#endif
