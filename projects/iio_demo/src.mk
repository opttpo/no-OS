#See No-OS/tool/scripts/src_model.mk for variable description

SRC_DIRS += $(PROJECT)/src
SRC_DIRS += $(NO-OS)/iio/iio_demo
SRC_DIRS += $(NO-OS)/iio/iio_app

# For the moment there is support only for aducm for iio with network backend
ifeq (aducm3029,$(strip $(PLATFORM)))
ENABLE_IIO_NETWORK = y
endif

ifeq (y,$(strip $(ENABLE_IIO_NETWORK)))
DISABLE_SECURE_SOCKET ?= y
SRC_DIRS += $(NO-OS)/network
SRCS	 += $(NO-OS)/util/circular_buffer.c
SRCS	 += $(PLATFORM_DRIVERS)/delay.c
SRCS	 += $(PLATFORM_DRIVERS)/timer.c
endif


LIBRARIES += iio

SRCS += $(PLATFORM_DRIVERS)/uart.c					\
	$(PLATFORM_DRIVERS)/irq.c					\
	$(NO-OS)/util/xml.c						\
	$(NO-OS)/util/list.c						\
	$(NO-OS)/util/fifo.c						\
	$(NO-OS)/util/util.c						\

INCS += $(INCLUDE)/xml.h						\
	$(INCLUDE)/fifo.h						\
	$(INCLUDE)/irq.h						\
	$(INCLUDE)/uart.h						\
	$(INCLUDE)/list.h						\
	$(INCLUDE)/util.h						\
	$(INCLUDE)/error.h						\
	$(PLATFORM_DRIVERS)/irq_extra.h					\
	$(PLATFORM_DRIVERS)/uart_extra.h				
