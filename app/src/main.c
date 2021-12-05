
#include <stdio.h>
#include "wm_hal.h"
#include "lcd_init.h"
#include "tft7735r.h"
void Error_Handler(void);

SPI_HandleTypeDef hspi;
DMA_HandleTypeDef hdma_spi_tx;
DMA_HandleTypeDef hdma_spi_rx;

static void SPI_Init(void);
static void DMA_Init(void);
#define data_len (10000)
uint8_t tx_data[data_len] = {0};
uint8_t rx_data[data_len] = {0};

int main(void)
{

	
	SystemClock_Config(CPU_CLK_240M);
	printf("enter main\r\n");
	LCD_GPIO_Init();
	DMA_Init();
	SPI_Init();
	__HAL_SPI_SET_CS_LOW(&hspi);
	LCD_Init();//LCD初始化

	while(1)
	{
		uint32_t start = HAL_GetTick();
		LCD_Fill(0,0,LCD_W,LCD_H,WHITE);
		uint32_t end = HAL_GetTick();
		printf("time %dms \r\n",end - start);
		
		LCD_Fill(0,0,LCD_W,LCD_H,BLACK);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,BLUE);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,BRED);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,GRED);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,GBLUE);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,MAGENTA);
		HAL_Delay(1000);
		LCD_Fill(0,0,LCD_W,LCD_H,GREEN);
		HAL_Delay(1000);
		
	}
}

static void SPI_Init(void)
{
	hspi.Instance = SPI;
	hspi.Init.Mode = SPI_MODE_MASTER;
	hspi.Init.CLKPolarity = SPI_POLARITY_LOW;
	hspi.Init.CLKPhase = SPI_PHASE_1EDGE;
	hspi.Init.NSS = SPI_NSS_SOFT;
	hspi.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
	hspi.Init.FirstByte = SPI_LITTLEENDIAN;
	
	if (HAL_SPI_Init(&hspi) != HAL_OK)
	{
		Error_Handler();
	}
}

static void DMA_Init(void)
{
	__HAL_RCC_DMA_CLK_ENABLE();
	
	HAL_NVIC_SetPriority(DMA_Channel0_IRQn, 0);
	HAL_NVIC_EnableIRQ(DMA_Channel0_IRQn);
	
	HAL_NVIC_SetPriority(DMA_Channel1_IRQn, 0);
	HAL_NVIC_EnableIRQ(DMA_Channel1_IRQn);
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
	__HAL_SPI_SET_CS_HIGH(hspi);
	printf("tx cplt\r\n");
}

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi)
{
	__HAL_SPI_SET_CS_HIGH(hspi);
	printf("rx cplt\r\n");
}

void Error_Handler(void)
{
	while (1)
	{
	}
}

void assert_failed(uint8_t *file, uint32_t line)
{
	printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}