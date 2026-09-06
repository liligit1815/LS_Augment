.class public Landroid/os/HapticPlayer;
.super Ljava/lang/Object;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NotCloseable"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HapticPlayer"


# instance fields
.field mEffect:Landroid/os/DynamicEffect;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/DynamicEffect;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Landroid/os/HapticPlayer;-><init>()V

    const-string v0, "HapticPlayer"

    const-string v1, "new\u00a0player"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Landroid/os/HapticPlayer;->mEffect:Landroid/os/DynamicEffect;

    return-void
.end method

.method public static isAvailable()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method


# virtual methods
.method public start(I)V
    .locals 0

    .line 1
    const-string p0, "HapticPlayer"

    const-string p1, "not support Haptic player api, start with loop"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public start(III)V
    .locals 0

    .line 2
    const-string p0, "HapticPlayer"

    const-string p1, "not support Haptic player api, start with loop & interval & amplitude"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public start(IIII)V
    .locals 0

    .line 3
    const-string p0, "HapticPlayer"

    const-string p1, "not support Haptic player api, start with loop & interval & amplitude & freq"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const-string p0, "HapticPlayer"

    .line 2
    .line 3
    const-string v0, "not support Haptic player api, stop"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateAmplitude(I)V
    .locals 0

    .line 1
    const-string p0, "HapticPlayer"

    .line 2
    .line 3
    const-string p1, "not support Haptic player api, updateAmplitude with amplitude"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateFrequency(I)V
    .locals 0

    .line 1
    const-string p0, "HapticPlayer"

    .line 2
    .line 3
    const-string p1, "not support Haptic player api, updateFrequency with freq"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateInterval(I)V
    .locals 0

    .line 1
    const-string p0, "HapticPlayer"

    .line 2
    .line 3
    const-string p1, "not support Haptic player api, updateInterval with interval"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateParameter(III)V
    .locals 0

    .line 1
    const-string p0, "HapticPlayer"

    .line 2
    .line 3
    const-string p1, "not support Haptic player api, updateParameter with interval/amplitude/freq"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method
