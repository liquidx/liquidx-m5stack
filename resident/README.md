Developing apps using the Resident prototyping framework.

This contains a fork of the `resident/examples/m5stack-demo` in order to reuse the device drivers and add my own device drivers.

---

# Rebuild firmware and flash

1. Plug in the M5StickS3
2. `cd device && pio run -e m5sticks3 -t upload`

# Deploy app through inanimate resident

On claude code, run `/resident:push-app <name of the app>` or 
`./send-app.sh device-apps/<name-of-app>.lua` 

Ensure the device ID is in `resident/.resident-device-id`.



