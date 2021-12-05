##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=W806_SDK
ConfigurationName      :=BuildSet
WorkspacePath          :=../
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=zhaoxiansen
Date                   :=05/12/2021
CDKPath                :=../../../../../../../../../../C-Sky/CDK
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=W806
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=W806_SDK.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck804ef  -mhard-float  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)../../../../../../../ld/W806/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024 -mhard-float
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)../../../../../../../../../../C-Sky/CDK/CSKY/MinGW/csky-abiv2-elf-toolchain/csky-elfabiv2/include $(IncludeSwitch). $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../include/driver $(IncludeSwitch)../../../../../../../app/inc $(IncludeSwitch)../../../../../../../platform/component/FreeRTOS/include $(IncludeSwitch)../../../../../../../platform/component/FreeRTOS/portable/xt804  
IncludeAPath           := $(IncludeSwitch)../../../../../../../../../../C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)../../../../../../../../../../C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)../../../../../../../../../../C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../platform/component/FreeRTOS/include  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)dsp $(LibrarySwitch)m  
ArLibs                 := "dsp m" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)../../../../../../../lib/W806  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
CFLAGS   := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
ASFLAGS  := -mcpu=ck804ef  -mhard-float    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) \
	$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_dma$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_i2s$(ObjectSuffix) $(IntermediateDirectory)/src_main$(ObjectSuffix) $(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IntermediateDirectory)/src_lcd_init$(ObjectSuffix) \
	$(IntermediateDirectory)/src_tft7735r$(ObjectSuffix) $(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) \
	$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) $(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix): ../../../../../../../platform/drivers/wm_gpio.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_gpio$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_gpio$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_gpio.c

$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix): ../../../../../../../platform/drivers/wm_uart.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_uart$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_uart$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_uart.c

$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_cpu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_cpu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_cpu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_cpu.c

$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix): ../../../../../../../platform/drivers/wm_hal.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_hal.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_hal$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_hal$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_hal.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_hal$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_hal.c

$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi.c

$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix): ../../../../../../../platform/drivers/wm_wdg.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_wdg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_wdg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_wdg$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_wdg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_wdg$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_wdg.c

$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix): ../../../../../../../platform/drivers/wm_tim.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_tim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_tim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_tim$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_tim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_tim$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_tim.c

$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_internal_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_internal_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_internal_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_internal_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_internal_flash.c

$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix): ../../../../../../../platform/drivers/wm_adc.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_adc$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_adc$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_adc.c

$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pwm.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pwm$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pwm$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pwm.c

$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pmu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pmu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pmu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pmu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pmu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pmu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pmu.c

$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi_flash.c

$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix): ../../../../../../../platform/drivers/wm_i2c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_i2c$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_i2c$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_i2c.c

$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix): ../../../../../../../platform/drivers/wm_touch.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_touch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_touch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_touch$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_touch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_touch$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_touch.c

$(IntermediateDirectory)/drivers_wm_dma$(ObjectSuffix): ../../../../../../../platform/drivers/wm_dma.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_dma.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_dma$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_dma$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_dma$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_dma$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_dma.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_dma$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_dma.c

$(IntermediateDirectory)/drivers_wm_i2s$(ObjectSuffix): ../../../../../../../platform/drivers/wm_i2s.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_i2s.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_i2s$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_i2s$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_i2s$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_i2s$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_i2s.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_i2s$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_i2s.c

$(IntermediateDirectory)/src_main$(ObjectSuffix): ../../../../../../../app/src/main.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_main$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_main$(PreprocessSuffix): ../../../../../../../app/src/main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_main$(PreprocessSuffix) ../../../../../../../app/src/main.c

$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix): ../../../../../../../app/src/wm_hal_msp.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/wm_hal_msp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_hal_msp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_hal_msp$(PreprocessSuffix): ../../../../../../../app/src/wm_hal_msp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_hal_msp$(PreprocessSuffix) ../../../../../../../app/src/wm_hal_msp.c

$(IntermediateDirectory)/src_wm_it$(ObjectSuffix): ../../../../../../../app/src/wm_it.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/wm_it.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_it$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_it$(PreprocessSuffix): ../../../../../../../app/src/wm_it.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_it$(PreprocessSuffix) ../../../../../../../app/src/wm_it.c

$(IntermediateDirectory)/src_lcd_init$(ObjectSuffix): ../../../../../../../app/src/lcd_init.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/lcd_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_lcd_init$(ObjectSuffix) -MF$(IntermediateDirectory)/src_lcd_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_lcd_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_lcd_init$(PreprocessSuffix): ../../../../../../../app/src/lcd_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_lcd_init$(PreprocessSuffix) ../../../../../../../app/src/lcd_init.c

$(IntermediateDirectory)/src_tft7735r$(ObjectSuffix): ../../../../../../../app/src/tft7735r.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/tft7735r.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_tft7735r$(ObjectSuffix) -MF$(IntermediateDirectory)/src_tft7735r$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_tft7735r$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_tft7735r$(PreprocessSuffix): ../../../../../../../app/src/tft7735r.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_tft7735r$(PreprocessSuffix) ../../../../../../../app/src/tft7735r.c

$(IntermediateDirectory)/bsp_startup$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_startup$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_startup$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/startup.S

$(IntermediateDirectory)/bsp_system$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_system$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_system$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_system$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/system.c

$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_trap_c$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_trap_c$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/trap_c.c

$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_vectors$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_vectors$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/vectors.S

$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_board_init$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_board_init$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/board_init.c

$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/libc/libc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_libc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_libc_port$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_libc_port$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/libc/libc_port.c

$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/croutine.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/croutine.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_croutine$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_croutine$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/croutine.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_croutine$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/croutine.c

$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/event_groups.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/event_groups.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_event_groups$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_event_groups$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/event_groups.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_event_groups$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/event_groups.c

$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/list.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_list$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_list$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/list.c

$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/queue.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_queue$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_queue$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/queue.c

$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/stream_buffer.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/stream_buffer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_stream_buffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_stream_buffer$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/stream_buffer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_stream_buffer$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/stream_buffer.c

$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/tasks.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/tasks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_tasks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_tasks$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/tasks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_tasks$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/tasks.c

$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/timers.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/timers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_timers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_timers$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/timers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_timers$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/timers.c

$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/portable/xt804/cpu_task_sw.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/portable/xt804/cpu_task_sw.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_cpu_task_sw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/xt804_cpu_task_sw$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/portable/xt804/cpu_task_sw.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_cpu_task_sw$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/portable/xt804/cpu_task_sw.S

$(IntermediateDirectory)/xt804_port$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/portable/xt804/port.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/portable/xt804/port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_port$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/xt804_port$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/portable/xt804/port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_port$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/portable/xt804/port.c

$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix): ../../../../../../../platform/component/FreeRTOS/portable/MemMang/heap_5.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/component/FreeRTOS/portable/MemMang/heap_5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) -MF$(IntermediateDirectory)/MemMang_heap_5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/MemMang_heap_5$(PreprocessSuffix): ../../../../../../../platform/component/FreeRTOS/portable/MemMang/heap_5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/MemMang_heap_5$(PreprocessSuffix) ../../../../../../../platform/component/FreeRTOS/portable/MemMang/heap_5.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
