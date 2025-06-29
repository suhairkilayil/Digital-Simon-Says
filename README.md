# 🎮 Digital Simon Says Game (Verilog Implementation)

This project implements a two-player "Simon Says" style digital game using Verilog HDL. It includes a pseudo-random direction generator, scoring logic, and win detection.

## 🧠 Game Rules
- A 2-bit random direction (`00`, `01`, `10`, `11`) is generated periodically.
- Each player has four directional input buttons: Up, Down, Left, Right, mapped as:
  - `00` → Up
  - `01` → Left
  - `10` → Right
  - `11` → Down
- Players must press the correct button matching the random direction.
- Correct responses increase a player’s score (displayed on LEDs in binary).
- The first to reach a score of 7 (`111`) wins the game.

## 📁 Project Structure

```
1_src/            → Verilog source code
2_sim/            → Testbench files
3_constraints/    → XDC constraint file for pin mapping
4_images/         → Screenshots (waveform, RTL view, floorplan)
README.md         → Project overview and instructions
```

## 🛠️ How to Run (Vivado)
1. Open Vivado → Create a new project
2. Add files from `1_src/`, `2_sim/`, and apply constraints from `3_constraints/`
3. Run simulation or synthesize the design
4. Observe output on waveform viewer and simulate testbench

## 📷 Screenshots
Images of RTL view, waveform output, and floorplan available in the `4_images/` folder.

## 📌 Tools Used
- **Vivado** (for design, simulation, synthesis)
- **Verilog HDL**
- Manual testbench for behavioral simulation

## 👤 Author
Suhair K  
B.Tech ECE, NSS College of Engineering

---
*This project is created for academic purposes and FPGA experimentation.*

