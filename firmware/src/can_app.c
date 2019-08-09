#include "can_app.h"

/**
 * @brief Prints a can message via usart
 */

void compute_rpm_avg(void)
{
    if(tachometer.rpm_avg_sum_count){
        tachometer.rpm_avg = tachometer.rpm_avg_sum/tachometer.rpm_avg_sum_count;
        tachometer.rpm_avg_sum = 0;
        tachometer.rpm_avg_sum_count = 0;
    }
}


inline void can_app_print_msg(can_t *msg)
{
#ifdef USART_ON
    usart_send_string("ID: ");
    usart_send_uint16(msg->id);
    usart_send_string(". D: ");

    for(uint8_t i = 0; i < msg->length; i++){
      usart_send_uint16(msg->data[i]);
      usart_send_char(' ');
    }

    usart_send_string(". ERR: ");
    can_error_register_t err = can_read_error_register();
    usart_send_uint16(err.rx);
    usart_send_char(' ');
    usart_send_uint16(err.tx);
    usart_send_char('\n');
#endif
}

/**
* @brief Manages the canbus application protocol
*/
inline void can_app_task(void)
{
    check_can();
                                            
    if(can_app_send_state_clk_div++ >= CAN_APP_SEND_STATE_CLK_DIV){
#ifdef USART_ON
        VERBOSE_MSG_CAN_APP(usart_send_string("state msg was sent.\n"));
#endif
        can_app_send_state();
        can_app_send_state_clk_div = 0;
    } 

    if(can_app_send_rpm_clk_div++ >= CAN_APP_SEND_RPM_CLK_DIV){
#ifdef USART_ON
        VERBOSE_MSG_CAN_APP(usart_send_string("rpm msg was sent.\n"));
#endif
        can_app_send_rpm();
        can_app_send_rpm_clk_div = 0;
    } 
}

inline void can_app_send_state(void)
{
    can_t msg;
    msg.id                                  = CAN_FILTER_MSG_MT19_STATE;
    msg.length                              = CAN_LENGTH_MSG_STATE;
    msg.flags.rtr = 0;

    msg.data[CAN_SIGNATURE_BYTE]            = CAN_SIGNATURE_SELF;
    msg.data[CAN_STATE_MSG_STATE_BYTE]      = (uint8_t) state_machine;
    msg.data[CAN_STATE_MSG_ERROR_BYTE]      = error_flags.all;

    can_send_message(&msg);
#ifdef VERBOSE_MSG_CAN_APP
    VERBOSE_MSG_CAN_APP(can_app_print_msg(&msg));
#endif
}

inline void can_app_send_rpm(void)
{ 
    can_t msg;
    msg.id                                  = CAN_FILTER_MSG_MT19_RPM;
    msg.length                              = CAN_LENGTH_MSG_MT19_RPM;
    msg.flags.rtr = 0;
    
    compute_rpm_avg();
    msg.data[CAN_SIGNATURE_BYTE]            = CAN_SIGNATURE_SELF;
    msg.data[CAN_MSG_MT19_RPM_AVG_BYTE_H]   = HIGH(tachometer.rpm_avg);
    msg.data[CAN_MSG_MT19_RPM_AVG_BYTE_L]   = LOW(tachometer.rpm_avg);

    can_send_message(&msg);
#ifdef VERBOSE_MSG_CAN_APP
    VERBOSE_MSG_CAN_APP(can_app_print_msg(&msg));
#endif
}

/**
 * @brief Manages to receive and extract specific messages from canbus
 */
inline void check_can(void)
{   
    #ifdef CAN_DEPENDENT
    #endif

    if(can_check_message()){
    #ifdef LED_ON
        cpl_led(LED1);    // Incluido para sinalizar entrada na função
    #endif
        VERBOSE_MSG_DISPLAY_TEST(usart_send_string("\nchecking can"));
        can_t msg;
        if(can_get_message(&msg)){
           // can_app_msg_extractors_switch(&msg);
        }
    }

}

