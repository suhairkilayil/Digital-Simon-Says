`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 21:08:25
// Design Name: 
// Module Name: simon_says_game
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module simon_says_game (
    input clk,
    input rst,
    input [1:0] P1_input,
    input [1:0] P2_input,
    output reg [1:0] random_dir,    // 2-bit random direction
    output reg [2:0] P1_score,      // Player 1 score
    output reg [2:0] P2_score,      // Player 2 score
    output reg [1:0] led_dir,       // Visual LED output
    output reg game_over,           // Game over flag
    output reg [1:0] winner         // Winner: 01 = P1, 10 = P2
);

    reg [26:0] timer;  // 1-second counter at 100 MHz
    reg [3:0] lfsr;     // 4-bit LFSR

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            timer <= 0;
            lfsr <= 4'b1011;  // Seed
            random_dir <= 0;
            led_dir <= 0;
            P1_score <= 0;
            P2_score <= 0;
            game_over <= 0;
            winner <= 0;
        end else if (!game_over) begin
            timer <= timer + 1;

            if (timer == 27'd100_000_000) begin  // ~1s interval
                timer <= 0;

                // LFSR next value: taps x⁴ + x³ + 1
                lfsr <= {lfsr[2:0], lfsr[3] ^ lfsr[2]};
                random_dir <= lfsr[1:0];
                led_dir <= lfsr[1:0];

                if (P1_input == lfsr[1:0])
                    P1_score <= (P1_score < 7) ? P1_score + 1 : P1_score;

                if (P2_input == lfsr[1:0])
                    P2_score <= (P2_score < 7) ? P2_score + 1 : P2_score;

                if (P1_score == 3'b111) begin
                    game_over <= 1;
                    winner <= 2'b01;
                end else if (P2_score == 3'b111) begin
                    game_over <= 1;
                    winner <= 2'b10;
                end
            end
        end
    end

endmodule

