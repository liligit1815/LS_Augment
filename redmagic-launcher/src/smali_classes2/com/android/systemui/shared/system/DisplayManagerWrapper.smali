.class public Lcom/android/systemui/shared/system/DisplayManagerWrapper;
.super Ljava/lang/Object;
.source "DisplayManagerWrapper.java"


# instance fields
.field private mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private final mMaximumBacklight:I

.field private final mMinimumBacklight:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "power"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/os/PowerManager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/os/PowerManager;->getMinimumScreenBrightnessSetting()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mMinimumBacklight:I

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/os/PowerManager;->getMaximumScreenBrightnessSetting()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mMaximumBacklight:I

    .line 23
    .line 24
    const-class v0, Landroid/hardware/display/DisplayManager;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/hardware/display/DisplayManager;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getDisplayInfo(Landroid/content/Context;)[I
    .locals 1

    .line 1
    new-instance p0, Landroid/view/DisplayInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/DisplayInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "window"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/view/WindowManager;

    .line 13
    .line 14
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p0}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    .line 19
    .line 20
    .line 21
    iget p1, p0, Landroid/view/DisplayInfo;->logicalHeight:I

    .line 22
    .line 23
    iget p0, p0, Landroid/view/DisplayInfo;->logicalWidth:I

    .line 24
    .line 25
    filled-new-array {p1, p0}, [I

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public getMaximumBacklight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mMaximumBacklight:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinimumBacklight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mMinimumBacklight:I

    .line 2
    .line 3
    return p0
.end method

.method public getRotation(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setBrightness(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Landroid/hardware/display/DisplayManager;->setTemporaryBrightness(IF)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setBrightnessAdj(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/system/DisplayManagerWrapper;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->setTemporaryAutoBrightnessAdjustment(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
