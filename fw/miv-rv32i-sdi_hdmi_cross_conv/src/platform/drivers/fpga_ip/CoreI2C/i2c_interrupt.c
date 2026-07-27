/*******************************************************************************
 * (c) Copyright 2009-2017 Microsemi SoC Products Group.  All rights reserved.
 * 
 * CoreI2C driver interrupt control.
 * 
 * SVN $Revision: 8971 $
 * SVN $Date: 2017-04-10 17:58:12 +0530 (Mon, 10 Apr 2017) $
 */
#include "../platform/hal/hal.h"
#include "../platform/hal/hal_assert.h"
#include "core_i2c.h"
#include "miv_rv32_hal/miv_rv32_hal.h"

/*------------------------------------------------------------------------------
 * This function must be modified to enable interrupts generated from the
 * CoreI2C instance identified as parameter.
 */
void I2C_enable_irq( i2c_instance_t * this_i2c )
{
    MRV_enable_local_irq(MRV32_MSYS_EIE1_IRQn);
}

/*------------------------------------------------------------------------------
 * This function must be modified to disable interrupts generated from the
 * CoreI2C instance identified as parameter.
 */
void I2C_disable_irq( i2c_instance_t * this_i2c )
{
   // HAL_ASSERT(0)
    MRV_disable_local_irq(MRV32_MSYS_EIE1_IRQn);
}
