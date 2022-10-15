//------------------------------------------------------------------------------
// SPDX-License-Identifier: MPL-2.0
// SPDX-FileType: SOURCE
// SPDX-FileCopyrightText: (c) 2022 Marcus Andrade
//------------------------------------------------------------------------------
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
//
//------------------------------------------------------------------------------
// Generic Gamepad interface for the Analogue Pocket
//------------------------------------------------------------------------------

module pocket_gamepad
    (
        input  wire        iCLK,   //! Clock to Sync To (eg: clk_sys)
        input  wire [31:0] iJOY,   //! Pocket Joystick Interface

        output wire        PAD_U,  PAD_D, PAD_L, PAD_R,                    //! D-PAD
        output wire        BTN_A,  BTN_B, BTN_X, BTN_Y,                    //! Face Buttons
        output wire        BTN_L1, BTN_R1, BTN_L2, BTN_R2, BTN_L3, BTN_R3, //! Shoulder/Trigger Buttons
        output wire        BTN_SE, BTN_ST                                  //! Select and Start Buttons
    );

    // D-PAD
    assign PAD_U  = rJOY_KEY[0];  assign PAD_D  = rJOY_KEY[1];
    assign PAD_L  = rJOY_KEY[2];  assign PAD_R  = rJOY_KEY[3];

    // Face Buttons
    assign BTN_B  = rJOY_KEY[5];  assign BTN_A  = rJOY_KEY[4];
    assign BTN_Y  = rJOY_KEY[7];  assign BTN_X  = rJOY_KEY[6];

    // Shoulder/Trigger Buttons
    assign BTN_L1 = rJOY_KEY[8];  assign BTN_R1 = rJOY_KEY[9];
    assign BTN_L2 = rJOY_KEY[10]; assign BTN_R2 = rJOY_KEY[11];
    assign BTN_L3 = rJOY_KEY[12]; assign BTN_R3 = rJOY_KEY[13];

    // Select and Start Buttons
    assign BTN_SE = rJOY_KEY[14]; assign BTN_ST = rJOY_KEY[15];

    reg [31:0] rJOY_KEY; //! Synced Joystick Register
    reg [31:0] S1, S2;   //! Register for 2 Stages Sync

    always @(posedge iCLK) begin
        {rJOY_KEY, S2, S1} <= {S2, S1, iJOY};
    end

endmodule
