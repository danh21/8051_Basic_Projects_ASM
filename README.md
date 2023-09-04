# Description
    Basic projects related to 8051 microcontroller using ASM.

# Software
    - Keil C IDE
    - Proteus
    - Matrix Led
    - EdSim51DI
    
# Source: 
    - create_Pulse: 
        + Version 1: the highest possible frequency, duty cycle is 25%.
        + Version 2: the highest possible frequency, duty cycle is 50%.
        + Version 3: frequency is 100KHz, duty cycle is 50%.
        + Version 4: frequency is 10KHz, duty cycle is 50%.
        + Version 5: frequency is 1KHz, duty cycle is 50%.
        + Version 6: frequency is 1Hz, duty cycle is 50%, blink led.
        + Version 7: frequency is 100Hz, duty cycle is 50%.
    
    - alert_Buzzer: activates buzzer when detecting failing edge from SPDT switch.

    - counter: uses switch to control to count up/down and displays on led 7-segment (count frequency is 2Hz).

    - div_frequency: uses button to control to divide frequency, mode 0 -> 4 correspond to 10KHz -> 625Hz.

    - matrix_led: scans led matrix 8x8 to display character.

    - calculator: 
        + Version 1: calculates sum of 2 numbers and displays on led 7-segment (SW7-SW4 is first number and SW3-SW0 is second number).
        + Version 2: calculates sum/diff of 2 numbers and displays on led 7-segment (SW7 indicates operator, SW6-SW4 is first number and SW2-SW0 is second number).