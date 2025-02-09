# ☕ Arduino ESP32 with Load Cell - Data Transmission & Dashboard Setup

This repository provides everything needed to set up an **Arduino ESP32** with a **load cell** and visualize the collected data in a **Grafana dashboard**.

<img width="2552" alt="image" src="https://github.com/user-attachments/assets/e8bebe32-f4fb-4b25-a309-915e2f8d946b" />
---

## 📡 ESP32 Code Installation

Follow these steps to set up the **ESP32 with a load cell**:

1️⃣ **Download the ESP32Code**  
   - Clone this repository or download the **ESP32Code.ino** file.

2️⃣ **Connect ESP32 to your computer**  
   - Use a USB cable to connect your **ESP32** to your PC or Mac.

3️⃣ **Open the code in an IDE**  
   - Either use **Arduino IDE** or **Visual Studio Code** with the **Arduino Extension**.

4️⃣ **Install ESP32 Board Package**  
   - Open the **Board Manager** in the Arduino IDE.  
   - Search for **ESP32** and install the corresponding package.

5️⃣ **Install Required Libraries**  
   - Open **Library Manager** in the Arduino IDE.  
   - Install **HX711** for the load cell amplifier.
   - Install **PubSubClient** for MQTT communication.

6️⃣ **Upload the code to ESP32**  
   - Select the correct **board** and **port** in your IDE.  
   - Click **Upload** to flash the ESP32 with the code.

🎉 **Done! Your ESP32 is now ready to transmit data via MQTT.**

---

## 📊 Dashboard Setup  

### **Prerequisites**  
✅ **Docker** must be installed on your system.  

### **Installation Steps**  
1️⃣ **Download the CoffeeDashboard folder**  
   - Clone this repository or manually download the **CoffeeDashboard** directory.  

2️⃣ **Navigate to the folder**  
   - Open a terminal and run:  
     ```bash
     cd CoffeeDashboard
     ```

3️⃣ **Start the Docker container**  
   - Run the following command to start the dashboard:  
     ```bash
     docker-compose up -d
     ```

🎉 **Done!** The dashboard is now running and can be accessed at:  
👉 **[http://localhost:3000](http://localhost:3000)**  

---

## 🔍 How it Works (System Architecture)

### 🛠 **Data Flow**
1. **ESP32 → MQTT**  
   - The ESP32 collects weight measurements from the **load cell** via the **HX711 amplifier**.  
   - The ESP32 **sends the data via MQTT** to a broker (e.g., Mosquitto).

2. **Node-RED → Data Processing**  
   - **Node-RED subscribes to the MQTT topic** where ESP32 sends the weight data.  
   - It processes the data and **forwards it to InfluxDB** for storage.

3. **InfluxDB → Time-Series Database**  
   - Stores all incoming **weight data** as time-series data.  
   - Provides efficient querying and retrieval.

4. **Grafana → Visualization**  
   - Connects to **InfluxDB** to fetch stored data.  
   - Displays real-time data on an **interactive dashboard**.
   - Allows users to **analyze trends and patterns** over time.

### 🗄 **Key Components**
#### **1️⃣ MQTT (Message Broker)**
- Acts as a **communication bridge** between ESP32 and Node-RED.
- Uses a **publish-subscribe** model for efficient data transfer.

#### **2️⃣ Node-RED (Data Processing & Forwarding)**
- **Subscribes to the ESP32 MQTT topic** to receive live data.
- **Processes and formats the data** before sending it to InfluxDB.
- Can be extended with additional logic (e.g., alerts, notifications).

#### **3️⃣ InfluxDB (Database)**
- **Stores all weight data** as time-series data.
- Optimized for **fast queries and efficient storage**.

#### **4️⃣ Grafana (Visualization)**
- Retrieves data from **InfluxDB** and displays it in a **dashboard**.
- Enables **real-time monitoring** and analysis.

🎯 **End Result:** The **live weight data** is visualized in Grafana, updated in real-time! 🚀

---


Feel free to contribute or raise an issue if you encounter any problems! 🚀
