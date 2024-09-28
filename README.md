# chill

Permanently disable Intel Turbo Boost on macOS, so your MacBook doesn't act as a portable frying pan anymore.

## Usage

1. Partially disable System Integrity Protection (SIP) to allow unsigned kernel extensions:

    a. Reboot Mac into recovery mode by holding down cmd+R when booting

    b. While in recovery mode, open Terminal and execute `csrutil enable --without kext`

    c. Reboot back into normal mode

2. Install the kernel extension and the launcher by running and entering admin passwords

```shell
./do-chill.sh
```

3. macOS would prompt you to allow the kernel extension in the System Settings, do that.

4. Reboot

5. Check whether the kext is loaded:
```shell
kmutil showloaded | grep no.vtek.DisableTurboBoost
```

6. Check that the Turbo Boost is disabled:

```shell
sudo powermetrics | grep "CPU Average frequency"
```

should give CPU frequency not above 100%.


## How it works

This small kernel extension will enable bit 38 of the MSR register `MSR_IA32_MISC_ENABLE` which causes the CPU to disable turbo boost.

Take a look in the [manual](http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html) for more info.

## Disclamer

Authors take _no responsibility_ for whatever harm this kernel extension may cause your system.

## Credits

The kernel extension is written by Vegard Løkken (https://github.com/veloek/DisableTurboBoost.kext), and was based on an outdated repo (https://github.com/nanoant/DisableTurboBoost.kext) by Adam Strzelecki.

The kext binary build, lauch script, and automatic installation was produced by Ivan Markin (https://github.com/unkaktus/chill).
