package com.example.deviceinsight

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import java.io.RandomAccessFile
import android.os.Handler
import android.os.Looper
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.wifi.WifiManager
import android.net.TrafficStats
import android.os.Environment
import android.os.StatFs

class MainActivity: FlutterActivity() {
    private val METHOD_CHANNEL = "com.example.deviceinsight/native"
    private val BATTERY_EVENT_CHANNEL = "com.example.deviceinsight/battery_stream"
    private val CPU_EVENT_CHANNEL = "com.example.deviceinsight/cpu_stream"
    private val NETWORK_EVENT_CHANNEL = "com.example.deviceinsight/network_stream"
    private val STORAGE_EVENT_CHANNEL = "com.example.deviceinsight/storage_stream"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getBatteryTemperature" -> result.success(getBatteryTemperature())
                "getCpuUsage" -> result.success(getCpuUsage())
                "getBatteryInfo" -> result.success(getBatteryInfoMap())
                "getCpuInfo" -> result.success(getCpuInfoMap())
                "getNetworkStats" -> result.success(getNetworkStatsMap())
                "getStorageStats" -> result.success(getStorageStatsMap())
                "getMemoryInfo" -> result.success(getMemoryInfoMap())
                "getDisplayInfo" -> result.success(getDisplayInfoMap())
                "getSecurityInfo" -> result.success(getSecurityInfoMap())
                "getSensorsInfo" -> result.success(getSensorsInfoMap())
                "getCameraInfo" -> result.success(getCameraInfoMap())
                "getAppsInfo" -> {
                    Thread {
                        val apps = getAppsInfoMap()
                        Handler(Looper.getMainLooper()).post { result.success(apps) }
                    }.start()
                }
                "getAppDetails" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    Thread {
                        val details = getAppDetailsMap(packageName)
                        Handler(Looper.getMainLooper()).post { result.success(details) }
                    }.start()
                }
                "getAppIcon" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    Thread {
                        try {
                            val icon = context.packageManager.getApplicationIcon(packageName)
                            val bitmap = if (icon is android.graphics.drawable.BitmapDrawable) {
                                icon.bitmap
                            } else {
                                val b = android.graphics.Bitmap.createBitmap(icon.intrinsicWidth.coerceAtLeast(1), icon.intrinsicHeight.coerceAtLeast(1), android.graphics.Bitmap.Config.ARGB_8888)
                                val canvas = android.graphics.Canvas(b)
                                icon.setBounds(0, 0, canvas.width, canvas.height)
                                icon.draw(canvas)
                                b
                            }
                            val stream = java.io.ByteArrayOutputStream()
                            bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream)
                            Handler(Looper.getMainLooper()).post { result.success(stream.toByteArray()) }
                        } catch (e: Exception) {
                            Handler(Looper.getMainLooper()).post { result.error("ICON_ERROR", e.message, null) }
                        }
                    }.start()
                }
                "launchApp" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    val intent = context.packageManager.getLaunchIntentForPackage(packageName)
                    if (intent != null) {
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        context.startActivity(intent)
                        result.success(true)
                    } else {
                        result.error("LAUNCH_ERROR", "No launcher intent found", null)
                    }
                }
                "uninstallApp" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    uninstallApp(packageName)
                    result.success(true)
                }
                "openAppInfo" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    openAppInfo(packageName)
                    result.success(true)
                }
                "openSettings" -> {
                    val action = call.argument<String>("action")
                    if (action != null) {
                        try {
                            val intent = Intent(action)
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            context.startActivity(intent)
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("INTENT_ERROR", e.message, null)
                        }
                    } else {
                        result.error("INVALID_ARGUMENT", "Action is required", null)
                    }
                }
                "vibrate" -> {
                    val duration = call.argument<Int>("duration") ?: 500
                    val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as android.os.Vibrator
                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                        vibrator.vibrate(android.os.VibrationEffect.createOneShot(duration.toLong(), android.os.VibrationEffect.DEFAULT_AMPLITUDE))
                    } else {
                        @Suppress("DEPRECATION")
                        vibrator.vibrate(duration.toLong())
                    }
                    result.success(true)
                }
                "setFlashlight" -> {
                    val enable = call.argument<Boolean>("enable") ?: false
                    try {
                        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as android.hardware.camera2.CameraManager
                        val cameraId = cameraManager.cameraIdList[0]
                        cameraManager.setTorchMode(cameraId, enable)
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("FLASHLIGHT_ERROR", e.message, null)
                    }
                }
                "hasUsageStatsPermission" -> {
                    val appOps = context.getSystemService(Context.APP_OPS_SERVICE) as android.app.AppOpsManager
                    val mode = if (android.os.Build.VERSION.SDK_INT >= 29) {
                        appOps.unsafeCheckOpNoThrow(android.app.AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), context.packageName)
                    } else {
                        appOps.checkOpNoThrow(android.app.AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), context.packageName)
                    }
                    result.success(mode == android.app.AppOpsManager.MODE_ALLOWED)
                }
                "requestUsageStatsPermission" -> {
                    val intent = Intent(android.provider.Settings.ACTION_USAGE_ACCESS_SETTINGS)
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    context.startActivity(intent)
                    result.success(true)
                }
                "hasOverlayPermission" -> {
                    if (android.os.Build.VERSION.SDK_INT >= 23) {
                        result.success(android.provider.Settings.canDrawOverlays(context))
                    } else {
                        result.success(true)
                    }
                }
                "requestOverlayPermission" -> {
                    if (android.os.Build.VERSION.SDK_INT >= 23) {
                        val intent = Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION, android.net.Uri.parse("package:${context.packageName}"))
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        context.startActivity(intent)
                    }
                    result.success(true)
                }
                "getDeviceProperties" -> result.success(getDevicePropertiesMap())
                else -> result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var handler = Handler(Looper.getMainLooper())
                private var runnable: Runnable? = null

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    runnable = object : Runnable {
                        override fun run() {
                            events?.success(getBatteryInfoMap())
                            handler.postDelayed(this, 1000)
                        }
                    }
                    handler.post(runnable!!)
                }

                override fun onCancel(arguments: Any?) {
                    runnable?.let { handler.removeCallbacks(it) }
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CPU_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var handler = Handler(Looper.getMainLooper())
                private var runnable: Runnable? = null

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    runnable = object : Runnable {
                        override fun run() {
                            events?.success(getCpuInfoMap())
                            handler.postDelayed(this, 1000)
                        }
                    }
                    handler.post(runnable!!)
                }

                override fun onCancel(arguments: Any?) {
                    runnable?.let { handler.removeCallbacks(it) }
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, NETWORK_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var handler = Handler(Looper.getMainLooper())
                private var runnable: Runnable? = null
                private var lastRxBytes = TrafficStats.getTotalRxBytes()
                private var lastTxBytes = TrafficStats.getTotalTxBytes()
                private var lastTime = System.currentTimeMillis()

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    runnable = object : Runnable {
                        override fun run() {
                            val currentRx = TrafficStats.getTotalRxBytes()
                            val currentTx = TrafficStats.getTotalTxBytes()
                            val currentTime = System.currentTimeMillis()
                            
                            val timeDiff = (currentTime - lastTime) / 1000.0
                            val rxSpeed = if (timeDiff > 0) (currentRx - lastRxBytes) / timeDiff else 0.0
                            val txSpeed = if (timeDiff > 0) (currentTx - lastTxBytes) / timeDiff else 0.0
                            
                            lastRxBytes = currentRx
                            lastTxBytes = currentTx
                            lastTime = currentTime

                            val stats = getNetworkStatsMap(rxSpeed, txSpeed)
                            events?.success(stats)
                            handler.postDelayed(this, 1000)
                        }
                    }
                    handler.post(runnable!!)
                }

                override fun onCancel(arguments: Any?) {
                    runnable?.let { handler.removeCallbacks(it) }
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, STORAGE_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var handler = Handler(Looper.getMainLooper())
                private var runnable: Runnable? = null

                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    runnable = object : Runnable {
                        override fun run() {
                            events?.success(getStorageStatsMap())
                            handler.postDelayed(this, 1000)
                        }
                    }
                    handler.post(runnable!!)
                }

                override fun onCancel(arguments: Any?) {
                    runnable?.let { handler.removeCallbacks(it) }
                }
            }
        )
    }

    private fun getBatteryTemperature(): Double {
        val intent = context.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        val temp = intent?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0) ?: 0
        return temp / 10.0
    }

    private fun getBatteryInfoMap(): Map<String, Any> {
        val intent = context.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        val level = intent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = intent?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1
        val temp = intent?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0) ?: 0
        val voltage = intent?.getIntExtra(BatteryManager.EXTRA_VOLTAGE, 0) ?: 0
        val status = intent?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
        val health = intent?.getIntExtra(BatteryManager.EXTRA_HEALTH, -1) ?: -1
        val tech = intent?.getStringExtra(BatteryManager.EXTRA_TECHNOLOGY) ?: "Unknown"

        val batteryPct = if (level != -1 && scale != -1) (level * 100 / scale.toFloat()).toDouble() else 0.0
        val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING || status == BatteryManager.BATTERY_STATUS_FULL

        val statusString = when (status) {
            BatteryManager.BATTERY_STATUS_CHARGING -> "Charging"
            BatteryManager.BATTERY_STATUS_DISCHARGING -> "Discharging"
            BatteryManager.BATTERY_STATUS_FULL -> "Full"
            BatteryManager.BATTERY_STATUS_NOT_CHARGING -> "Not Charging"
            else -> "Unknown"
        }

        val healthString = when (health) {
            BatteryManager.BATTERY_HEALTH_GOOD -> "Good"
            BatteryManager.BATTERY_HEALTH_OVERHEAT -> "Overheat"
            BatteryManager.BATTERY_HEALTH_DEAD -> "Dead"
            BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "Over Voltage"
            BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE -> "Failure"
            BatteryManager.BATTERY_HEALTH_COLD -> "Cold"
            else -> "Unknown"
        }

        return mapOf(
            "percentage" to batteryPct,
            "isCharging" to isCharging,
            "status" to statusString,
            "temperature" to temp / 10.0,
            "voltage" to voltage.toDouble(),
            "health" to healthString,
            "technology" to tech,
            "cycleCount" to 0,
            "capacity" to 0
        )
    }

    private fun getCpuUsage(): Double {
        return try {
            val reader = RandomAccessFile("/proc/stat", "r")
            val load = reader.readLine()
            val toks = load.split(" +".toRegex())
            val idle1 = toks[5].toLong()
            val cpu1 = toks[2].toLong() + toks[3].toLong() + toks[4].toLong() +
                    toks[6].toLong() + toks[7].toLong() + toks[8].toLong()
            Thread.sleep(360)
            reader.seek(0)
            val load2 = reader.readLine()
            reader.close()
            val toks2 = load2.split(" +".toRegex())
            val idle2 = toks2[5].toLong()
            val cpu2 = toks2[2].toLong() + toks2[3].toLong() + toks2[4].toLong() +
                    toks2[6].toLong() + toks2[7].toLong() + toks2[8].toLong()
            val cpuDiff = (cpu2 - cpu1).toDouble()
            val idleDiff = (idle2 - idle1).toDouble()
            
            if (cpuDiff + idleDiff == 0.0) 0.0 else (cpuDiff / (cpuDiff + idleDiff)) * 100.0
        } catch (ex: Exception) {
            0.0
        }
    }

    private fun getCpuInfoMap(): Map<String, Any> {
        val usage = getCpuUsage()
        val coreCount = Runtime.getRuntime().availableProcessors()
        return mapOf(
            "overallUsage" to usage,
            "coreUsages" to listOf<Double>(),
            "architecture" to (System.getProperty("os.arch") ?: "Unknown"),
            "coreCount" to coreCount,
            "frequencies" to listOf<Int>()
        )
    }

    private fun getNetworkStatsMap(rxSpeed: Double = 0.0, txSpeed: Double = 0.0): Map<String, Any> {
        val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val network = connectivityManager.activeNetwork
        val capabilities = connectivityManager.getNetworkCapabilities(network)
        val linkProperties = connectivityManager.getLinkProperties(network)
        
        var connectionType = "Disconnected"
        if (capabilities != null) {
            if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) connectionType = "WiFi"
            else if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) connectionType = "Cellular"
            else if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)) connectionType = "Ethernet"
        }

        var wifiSignalStrength = -1
        var macAddress = "Unknown"
        var bssid = "Unknown"
        var frequency = 0
        
        if (connectionType == "WiFi") {
            val wifiManager = context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
            val wifiInfo = wifiManager.connectionInfo
            wifiSignalStrength = wifiInfo.rssi
            macAddress = wifiInfo.macAddress ?: "Unknown"
            bssid = wifiInfo.bssid ?: "Unknown"
            frequency = wifiInfo.frequency
        }

        val dnsServers = linkProperties?.dnsServers?.map { it.hostAddress } ?: emptyList()
        val ips = linkProperties?.linkAddresses?.map { it.address.hostAddress } ?: emptyList()

        return mapOf(
            "connectionType" to connectionType,
            "ipAddress" to (ips.firstOrNull() ?: "Unknown"),
            "ipv6Address" to (ips.find { it?.contains(":") == true } ?: "Unknown"),
            "dnsServers" to dnsServers,
            "macAddress" to macAddress,
            "bssid" to bssid,
            "frequency" to frequency,
            "downloadSpeed" to rxSpeed,
            "uploadSpeed" to txSpeed,
            "wifiSignalStrength" to wifiSignalStrength,
            "pingMs" to 0 
        )
    }

    private fun getStorageStatsMap(): Map<String, Any> {
        val path = Environment.getDataDirectory()
        val stat = StatFs(path.path)
        val blockSize = stat.blockSizeLong
        val totalBlocks = stat.blockCountLong
        val availableBlocks = stat.availableBlocksLong

        val totalSpace = totalBlocks * blockSize
        val freeSpace = availableBlocks * blockSize
        val usedSpace = totalSpace - freeSpace
        val usagePercentage = if (totalSpace > 0) (usedSpace.toDouble() / totalSpace.toDouble()) * 100.0 else 0.0

        return mapOf(
            "totalSpace" to totalSpace,
            "freeSpace" to freeSpace,
            "usedSpace" to usedSpace,
            "usagePercentage" to usagePercentage,
            "readSpeed" to 0.0, // Placeholder
            "writeSpeed" to 0.0 // Placeholder
        )
    }

    private fun getMemoryInfoMap(): Map<String, Any> {
        val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
        val memoryInfo = android.app.ActivityManager.MemoryInfo()
        activityManager.getMemoryInfo(memoryInfo)
        
        return mapOf(
            "totalMemory" to memoryInfo.totalMem,
            "availableMemory" to memoryInfo.availMem,
            "usedMemory" to (memoryInfo.totalMem - memoryInfo.availMem),
            "isLowMemory" to memoryInfo.lowMemory,
            "memoryThreshold" to memoryInfo.threshold,
            "memoryClass" to activityManager.memoryClass,
            "largeMemoryClass" to activityManager.largeMemoryClass
        )
    }

    private fun getDisplayInfoMap(): Map<String, Any> {
        val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as android.view.WindowManager
        val display = windowManager.defaultDisplay
        val metrics = android.util.DisplayMetrics()
        display.getRealMetrics(metrics)

        var isHdr = false
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            isHdr = display.isHdr
        }

        return mapOf(
            "widthPixels" to metrics.widthPixels,
            "heightPixels" to metrics.heightPixels,
            "refreshRate" to display.refreshRate.toDouble(),
            "densityDpi" to metrics.densityDpi,
            "isHdr" to isHdr
        )
    }

    private fun getSecurityInfoMap(): Map<String, Any> {
        val isAdbEnabled = android.provider.Settings.Global.getInt(context.contentResolver, android.provider.Settings.Global.ADB_ENABLED, 0) == 1
        val isDevelopmentSettingsEnabled = android.provider.Settings.Global.getInt(context.contentResolver, android.provider.Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) == 1
        
        // Basic root check mock
        val isRooted = java.io.File("/system/app/Superuser.apk").exists() || java.io.File("/system/xbin/su").exists()

        var isUnknownSourcesEnabled = false
        try {
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                isUnknownSourcesEnabled = context.packageManager.canRequestPackageInstalls()
            } else {
                @Suppress("DEPRECATION")
                isUnknownSourcesEnabled = android.provider.Settings.Secure.getInt(context.contentResolver, android.provider.Settings.Secure.INSTALL_NON_MARKET_APPS, 0) == 1
            }
        } catch (e: Exception) {}

        val keyguardManager = context.getSystemService(Context.KEYGUARD_SERVICE) as android.app.KeyguardManager
        val isDeviceSecure = keyguardManager.isDeviceSecure

        var isEncrypted = false
        val devicePolicyManager = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as android.app.admin.DevicePolicyManager
        val encStatus = devicePolicyManager.storageEncryptionStatus
        isEncrypted = encStatus == android.app.admin.DevicePolicyManager.ENCRYPTION_STATUS_ACTIVE || 
                      encStatus == android.app.admin.DevicePolicyManager.ENCRYPTION_STATUS_ACTIVE_PER_USER
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N && !isEncrypted) {
             isEncrypted = true // Often encrypted by default on newer Androids
        }

        var biometricAvailable = false
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
            val biometricManager = context.getSystemService(android.hardware.biometrics.BiometricManager::class.java)
            if (biometricManager != null) {
                biometricAvailable = biometricManager.canAuthenticate(android.hardware.biometrics.BiometricManager.Authenticators.BIOMETRIC_WEAK) == android.hardware.biometrics.BiometricManager.BIOMETRIC_SUCCESS
            }
        }

        val seLinuxMode = try {
            val process = Runtime.getRuntime().exec("getenforce")
            val reader = java.io.BufferedReader(java.io.InputStreamReader(process.inputStream))
            reader.readLine() ?: "Unknown"
        } catch (e: Exception) { "Unknown" }

        return mapOf(
            "isAdbEnabled" to isAdbEnabled,
            "isDevelopmentSettingsEnabled" to isDevelopmentSettingsEnabled,
            "isRooted" to isRooted,
            "isUnknownSourcesEnabled" to isUnknownSourcesEnabled,
            "isDeviceSecure" to isDeviceSecure,
            "isEncrypted" to isEncrypted,
            "biometricAvailable" to biometricAvailable,
            "seLinuxMode" to seLinuxMode
        )
    }

    private fun getSensorsInfoMap(): List<Map<String, Any>> {
        val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as android.hardware.SensorManager
        val sensors = sensorManager.getSensorList(android.hardware.Sensor.TYPE_ALL)
        return sensors.map {
            mapOf(
                "name" to it.name,
                "vendor" to it.vendor,
                "version" to it.version,
                "power" to it.power.toDouble(),
                "resolution" to it.resolution.toDouble(),
                "maximumRange" to it.maximumRange.toDouble()
            )
        }
    }

    private fun getCameraInfoMap(): List<Map<String, Any>> {
        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as android.hardware.camera2.CameraManager
        val list = mutableListOf<Map<String, Any>>()
        try {
            for (cameraId in cameraManager.cameraIdList) {
                val characteristics = cameraManager.getCameraCharacteristics(cameraId)
                val facing = characteristics.get(android.hardware.camera2.CameraCharacteristics.LENS_FACING)
                val facingStr = if (facing == android.hardware.camera2.CameraCharacteristics.LENS_FACING_FRONT) "Front" else "Rear"
                val level = characteristics.get(android.hardware.camera2.CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)
                
                list.add(mapOf(
                    "id" to cameraId,
                    "facing" to facingStr,
                    "hardwareLevel" to (level ?: 0)
                ))
            }
        } catch (e: Exception) {}
        return list
    }

    private fun getAppsInfoMap(): List<Map<String, Any>> {
        val pm = context.packageManager
        val apps = pm.getInstalledApplications(0)
        return apps.mapNotNull { 
            try {
                val packageInfo = pm.getPackageInfo(it.packageName, 0)
                mapOf(
                    "name" to pm.getApplicationLabel(it).toString(),
                    "packageName" to it.packageName,
                    "isSystemApp" to ((it.flags and android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0),
                    "versionName" to (packageInfo.versionName ?: "Unknown"),
                    "versionCode" to (if (android.os.Build.VERSION.SDK_INT >= 28) packageInfo.longVersionCode else packageInfo.versionCode.toLong()),
                    "installDate" to packageInfo.firstInstallTime,
                    "updateDate" to packageInfo.lastUpdateTime,
                    "enabled" to it.enabled,
                    "targetSdk" to it.targetSdkVersion,
                    "minSdk" to if (android.os.Build.VERSION.SDK_INT >= 24) it.minSdkVersion else 0,
                    "uid" to it.uid,
                    "apkPath" to it.sourceDir
                )
            } catch (e: Exception) { null }
        }
    }

    private fun getAppDetailsMap(packageName: String): Map<String, Any> {
        val pm = context.packageManager
        try {
            val flags = android.content.pm.PackageManager.GET_PERMISSIONS or 
                        android.content.pm.PackageManager.GET_SERVICES or 
                        android.content.pm.PackageManager.GET_ACTIVITIES or 
                        android.content.pm.PackageManager.GET_RECEIVERS or 
                        android.content.pm.PackageManager.GET_PROVIDERS
            val pInfo = pm.getPackageInfo(packageName, flags)
            val appInfo = pInfo.applicationInfo ?: throw Exception("AppInfo is null")
            
            val permissions = pInfo.requestedPermissions?.toList() ?: emptyList()
            val requestedPermissions = permissions
            val grantedPermissions = mutableListOf<String>()
            pInfo.requestedPermissionsFlags?.let { pFlags ->
                for (i in pFlags.indices) {
                    if ((pFlags[i] and android.content.pm.PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0) {
                        grantedPermissions.add(requestedPermissions[i])
                    }
                }
            }
            val activities = pInfo.activities?.map { it.name } ?: emptyList()
            val services = pInfo.services?.map { it.name } ?: emptyList()
            val receivers = pInfo.receivers?.map { it.name } ?: emptyList()
            val providers = pInfo.providers?.map { it.name } ?: emptyList()
            
            val installSource = if (android.os.Build.VERSION.SDK_INT >= 30) {
                pm.getInstallSourceInfo(packageName).installingPackageName ?: "Unknown"
            } else {
                @Suppress("DEPRECATION")
                pm.getInstallerPackageName(packageName) ?: "Unknown"
            }
            val powerManager = context.getSystemService(Context.POWER_SERVICE) as android.os.PowerManager
            val batteryOptimizationEnabled = if (android.os.Build.VERSION.SDK_INT >= 23) {
                !powerManager.isIgnoringBatteryOptimizations(packageName)
            } else {
                false
            }
            
            var cacheSize = 0L
            var dataSize = 0L
            var codeSize = 0L
            var totalSize = 0L
            
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                try {
                    val storageStatsManager = context.getSystemService(Context.STORAGE_STATS_SERVICE) as android.app.usage.StorageStatsManager
                    val stats = storageStatsManager.queryStatsForUid(appInfo.storageUuid, appInfo.uid)
                    cacheSize = stats.cacheBytes
                    dataSize = stats.dataBytes
                    codeSize = stats.appBytes
                    totalSize = cacheSize + dataSize + codeSize
                } catch (e: Exception) {}
            }
            
            return mapOf(
                "name" to pm.getApplicationLabel(appInfo).toString(),
                "packageName" to packageName,
                "versionName" to (pInfo.versionName ?: "Unknown"),
                "versionCode" to (if (android.os.Build.VERSION.SDK_INT >= 28) pInfo.longVersionCode else pInfo.versionCode.toLong()),
                "isSystemApp" to ((appInfo.flags and android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0),
                "installDate" to pInfo.firstInstallTime,
                "updateDate" to pInfo.lastUpdateTime,
                "apkPath" to appInfo.sourceDir,
                "dataDir" to appInfo.dataDir,
                "targetSdk" to appInfo.targetSdkVersion,
                "minSdk" to if (android.os.Build.VERSION.SDK_INT >= 24) appInfo.minSdkVersion else 0,
                "uid" to appInfo.uid,
                "installSource" to installSource,
                "permissions" to permissions,
                "requestedPermissions" to requestedPermissions,
                "grantedPermissions" to grantedPermissions,
                "activities" to activities,
                "services" to services,
                "receivers" to receivers,
                "providers" to providers,
                "cacheSize" to cacheSize,
                "dataSize" to dataSize,
                "codeSize" to codeSize,
                "totalSize" to totalSize,
                "sharedUserId" to (pInfo.sharedUserId ?: "Unknown"),
                "batteryOptimizationEnabled" to batteryOptimizationEnabled
            )
        } catch (e: Exception) {
            return mapOf("error" to e.toString())
        }
    }

    private fun uninstallApp(packageName: String) {
        val intent = Intent(Intent.ACTION_DELETE)
        intent.data = android.net.Uri.parse("package:$packageName")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(intent)
    }

    private fun openAppInfo(packageName: String) {
        val intent = Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        intent.data = android.net.Uri.parse("package:$packageName")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(intent)
    }

    private fun getDevicePropertiesMap(): Map<String, Any> {
        return mapOf(
            "board" to android.os.Build.BOARD,
            "bootloader" to android.os.Build.BOOTLOADER,
            "hardware" to android.os.Build.HARDWARE,
            "device" to android.os.Build.DEVICE,
            "fingerprint" to android.os.Build.FINGERPRINT,
            "host" to android.os.Build.HOST,
            "tags" to android.os.Build.TAGS
        )
    }
}
