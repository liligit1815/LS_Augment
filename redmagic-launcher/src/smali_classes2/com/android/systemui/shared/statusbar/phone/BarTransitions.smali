.class public Lcom/android/systemui/shared/statusbar/phone/BarTransitions;
.super Ljava/lang/Object;
.source "BarTransitions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;,
        Lcom/android/systemui/shared/statusbar/phone/BarTransitions$TransitionMode;
    }
.end annotation


# static fields
.field public static final BACKGROUND_DURATION:I = 0xc8

.field private static final DEBUG:Z = false

.field private static final DEBUG_COLORS:Z = false

.field public static final LIGHTS_IN_DURATION:I = 0xfa

.field public static final LIGHTS_OUT_DURATION:I = 0x5dc

.field public static final MODE_LIGHTS_OUT:I = 0x3

.field public static final MODE_LIGHTS_OUT_TRANSPARENT:I = 0x6

.field public static final MODE_OPAQUE:I = 0x4

.field public static final MODE_SEMI_TRANSPARENT:I = 0x1

.field public static final MODE_TRANSLUCENT:I = 0x2

.field public static final MODE_TRANSPARENT:I = 0x0

.field public static final MODE_WARNING:I = 0x5

.field private static final SYSTEM_BAR_BACKGROUND_OPAQUE:I = -0x1000000

.field private static final SYSTEM_BAR_BACKGROUND_TRANSPARENT:I


# instance fields
.field protected DEBUG_MODE_ZTE:Z

.field private mAlwaysOpaque:Z

.field protected final mBarBackground:Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;

.field private mMode:I

.field private final mTag:Ljava/lang/String;

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->DEBUG_MODE_ZTE:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mAlwaysOpaque:Z

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "BarTransitions."

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mTag:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mView:Landroid/view/View;

    .line 37
    .line 38
    new-instance v0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1, p2}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;-><init>(Landroid/content/Context;I)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mBarBackground:Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static getColorAttrDefaultColor(Landroid/content/Context;II)I
    .locals 0

    .line 1
    filled-new-array {p1}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 15
    .line 16
    .line 17
    return p1
.end method

.method public static modeToString(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const-string p0, "MODE_OPAQUE"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_1

    .line 9
    .line 10
    const-string p0, "MODE_SEMI_TRANSPARENT"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 v0, 0x2

    .line 14
    if-ne p0, v0, :cond_2

    .line 15
    .line 16
    const-string p0, "MODE_TRANSLUCENT"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 v0, 0x3

    .line 20
    if-ne p0, v0, :cond_3

    .line 21
    .line 22
    const-string p0, "MODE_LIGHTS_OUT"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    if-nez p0, :cond_4

    .line 26
    .line 27
    const-string p0, "MODE_TRANSPARENT"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_4
    const/4 v0, 0x5

    .line 31
    if-ne p0, v0, :cond_5

    .line 32
    .line 33
    const-string p0, "MODE_WARNING"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_5
    const/4 v0, 0x6

    .line 37
    if-ne p0, v0, :cond_6

    .line 38
    .line 39
    const-string p0, "MODE_LIGHTS_OUT_TRANSPARENT"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v1, "Unknown mode "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method


# virtual methods
.method protected applyModeBackground(IIZ)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->DEBUG_MODE_ZTE:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mTag:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->modeToString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p2}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->modeToString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "applyModeBackground oldMode=%s newMode=%s animate=%s"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mBarBackground:Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;->applyModeBackground(IIZ)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public finishAnimations()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mBarBackground:Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions$BarBackgroundDrawable;->finishAnimation()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mMode:I

    .line 2
    .line 3
    return p0
.end method

.method public isAlwaysOpaque()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mAlwaysOpaque:Z

    .line 2
    .line 3
    return p0
.end method

.method protected isLightsOut(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    if-eq p1, p0, :cond_1

    .line 3
    .line 4
    const/4 p0, 0x6

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method protected onTransition(IIZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->applyModeBackground(IIZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAlwaysOpaque(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mAlwaysOpaque:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAutoDim(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public transitionTo(IZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->isAlwaysOpaque()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    :cond_0
    const/4 p1, 0x4

    .line 16
    :cond_1
    invoke-virtual {p0}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->isAlwaysOpaque()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x6

    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    :cond_2
    iget v0, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mMode:I

    .line 27
    .line 28
    if-ne v0, p1, :cond_3

    .line 29
    .line 30
    return-void

    .line 31
    :cond_3
    iput p1, p0, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->mMode:I

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->onTransition(IIZ)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
