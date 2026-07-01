
Apps developed using the [Resident](https://resident.inanimate.tech/#try-it-now) prototyping framework.

# How does this work?

This repo does not contain the Resident library and repo, instead it is a fork of the `resident/examples/m5stack-demo` in order to reuse their built device drives.

# How to do things?

## Building 

1. You need to install `pio` ([PlatformIO](https://docs.platformio.org/en/stable/core/installation/index.html))
2. Plug in the M5StickS3
3. `cd device && pio run -e m5sticks3 -t upload`

## Update libraries?

Not sure how to do this 

---

# Rebuild firmware and flash

1. Plug in the M5StickS3
2. `cd device && pio run -e m5sticks3 -t upload`

# Deploy app through inanimate resident

On claude code, run `/resident:push-app <name of the app>` or 
`./send-app.sh device-apps/<name-of-app>.lua` 

Ensure the device ID is in `resident/.resident-device-id`.
