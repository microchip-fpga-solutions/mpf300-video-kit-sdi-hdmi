/*-------------------------------------------------------------------------------------------------
-- File Name    : AXI4-Lite.c
-- Description  : AXI4-Lite bus read/write functions
-- Author       : India Solutions Team
-- COPYRIGHT 2021 BY MICROCHIP
--
-- NOTE on volatile usage:
-- The POINTER to hardware registers must be volatile to prevent compiler optimization
-- of the actual memory access. However, the RETURN VALUE and function itself don't
-- need to be volatile - once the value is read from hardware into a CPU register,
-- it's just a normal value.
-------------------------------------------------------------------------------------------------*/

#include "AXI4-Lite.h"

/**
 * axi4literead - Read 32-bit value from AXI4-Lite bus
 * @param address: Memory-mapped register address
 * @return: 32-bit value read from address
 *
 * The volatile cast on the pointer ensures the compiler doesn't optimize
 * away the memory read or reorder it with other accesses.
 */
uint32_t axi4literead(uint32_t address)
{
    return *(volatile uint32_t *)address;
}

/**
 * axi4litewrite - Write 32-bit value to AXI4-Lite bus
 * @param address: Memory-mapped register address
 * @param data: 32-bit value to write
 *
 * The volatile cast on the pointer ensures the compiler doesn't optimize
 * away the memory write or reorder it with other accesses.
 */
void axi4litewrite(uint32_t address, uint32_t data)
{
    *(volatile uint32_t *)address = data;
}
