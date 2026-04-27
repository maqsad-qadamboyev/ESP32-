#include <Wire.h>
#include <AS5600.h>

TwoWire I2C_1 = TwoWire(0);
TwoWire I2C_2 = TwoWire(1);

AS5600 encoder1(&I2C_1);
AS5600 encoder2(&I2C_2);

unsigned long lastSend = 0;
const int interval = 10;   // 100 Hz

void setup() {
  Serial.begin(115200);

  I2C_1.begin(21, 22);
  I2C_2.begin(18, 19);

  encoder1.begin();
  encoder2.begin();
}

void loop() {

  unsigned long now = millis();

  if (now - lastSend < interval) return;
  lastSend = now;

  unsigned long t = now;

  uint16_t raw2 = (encoder1.readAngle() + encoder2.readAngle()) % 4095;
  uint16_t raw1 = encoder2.readAngle() % 4095;

  // 0–360° ga o'tkazish
  float angle2 = (raw2 * 360.0) / 4095.0;
  float angle1 = (raw1 * 360.0) / 4095.0;

  // --------- UNWRAP LOGIKA ---------
  static float prev1 = 0;
  static float prev2 = 0;
  static float offset1 = 0;
  static float offset2 = 0;

  float diff1 = angle1 - prev1;
  if (diff1 < -180) offset1 += 360;
  if (diff1 > 180)  offset1 -= 360;

  float angle1_cont = angle1 + offset1;
  prev1 = angle1;

  float diff2 = angle2 - prev2;
  if (diff2 < -180) offset2 += 360;
  if (diff2 > 180)  offset2 -= 360;

  float angle2_cont = angle2 + offset2;
  prev2 = angle2;

  // --------- BOSHLANG'ICHNI 0 GA TENGLASH ---------
  static bool initialized = false;
  static float zero1 = 0;
  static float zero2 = 0;

  if (!initialized) {
    zero1 = angle1_cont;
    zero2 = angle2_cont;
    initialized = true;
  }

  angle1_cont -= zero1;
  angle2_cont -= zero2;

  // --------- SERIALGA CHIQARISH ---------
  Serial.print(t);
  Serial.print(",");

  Serial.print(-angle1_cont);
  Serial.print(",");

  Serial.println(-angle2_cont);
}