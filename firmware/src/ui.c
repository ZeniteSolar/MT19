#include "ui.h"

/**
 * @brief inicializa o UI
 */
void ui_init(void)
{
    display_init();
    test_display();

    ui_clear();
    ui_draw_layout();
    ui_update();   
}

void ui_clear(void)
{
    display_clear();
}

void ui_update(void)
{
    display_update();
}

void ui_draw_layout(void)
{
    display_layout();
}

void ui_update_battery_voltage_main(uint16_t num)
{
    display_send_uint16(num, col2, line2);
}

void ui_update_battery_voltage_extra(uint16_t num)
{
    display_send_uint16(num, col2, line3);
}

void ui_update_battery_voltage_auxiliary(uint16_t num)
{
    display_send_uint16(num, col2, line4);
}

void ui_update_battery_current_input(uint16_t num)
{
    display_send_uint16(num, col4, line2);
}

void ui_update_battery_current_output(uint16_t num)
{
    display_send_uint16(num, col4, line3);
}

