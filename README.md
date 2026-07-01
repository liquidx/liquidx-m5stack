
Apps developed using the [Resident](https://resident.inanimate.tech/#try-it-now) prototyping framework.

# How does this work?

This repo does not contain the Resident library and repo, instead it is a fork of the `resident/examples/m5stack-demo` in order to reuse their built device drives.

# How to do things?

## Building 

1. You need to install `pio` ([PlatformIO](https://docs.platformio.org/en/stable/core/installation/index.html))
2. Plug in the M5StickS3
3. `cd device && pio run -e m5sticks3 -t upload`

## Device Initialization

1. First boot with no saved credentials → Courier's WiFiManager opens a captive-portal access point named Resident <deviceType> <id-suffix> (e.g. Resident stick a1b2c3d4).
2. Join that AP from your phone/laptop, the captive portal page prompts for your real WiFi SSID/password.
3. Credentials are saved to NVS (flash) — subsequent boots reconnect automatically, no portal.
4. Once WiFi is up, it opens a WebSocket to resident.inanimate.tech (or your RESIDENT_HOST) and the status display (your DisplayDriver) cycles WiFi → Connecting → Connected → <8-char device ID>.
5. From there, push apps with /resident:push-app --device-id <id> some-app.lua or ./send-app.sh --device-id <id> device-apps/hello.lua (device ID is also cached in .resident-device-id after the skill talks to it once).


## Build Dependencies

Using Platform IO, the dependencies are downloaded by `pio` to `device/.pio` and then the whole firmware is built from there. So there is not need to checkout any of the dependencies unless we are modifying it.

## Deploy app through inanimate resident

On claude code, run `/resident:push-app <name of the app>` or 
`./send-app.sh device-apps/<name-of-app>.lua` 

Ensure the device ID is in `resident/.resident-device-id`.
