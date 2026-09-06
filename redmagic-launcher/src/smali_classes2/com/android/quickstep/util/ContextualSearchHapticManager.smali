.class public final Lcom/android/quickstep/util/ContextualSearchHapticManager;
.super Ljava/lang/Object;
.source "ContextualSearchHapticManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/ContextualSearchHapticManager$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/ContextualSearchHapticManager$Companion;

.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/util/ContextualSearchHapticManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final context:Landroid/content/Context;

.field private final contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

.field private searchEffect:Landroid/os/VibrationEffect;

.field private final vibratorWrapper:Lcom/android/launcher3/util/V2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchHapticManager$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ContextualSearchHapticManager$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->Companion:Lcom/android/quickstep/util/ContextualSearchHapticManager$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/util/J;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/quickstep/util/J;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/launcher3/util/V2;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "contextualSearchStateManager"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "vibratorWrapper"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->context:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->vibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchHapticManager;->createSearchEffect()Landroid/os/VibrationEffect;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->searchEffect:Landroid/os/VibrationEffect;

    .line 30
    .line 31
    return-void
.end method

.method private final createSearchEffect()Landroid/os/VibrationEffect;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->context:Landroid/content/Context;

    .line 2
    .line 3
    const-class v0, Landroid/os/Vibrator;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/os/Vibrator;

    .line 13
    .line 14
    const/4 v0, 0x7

    .line 15
    filled-new-array {v0}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Landroid/os/VibrationEffect;->startComposition()Landroid/os/VibrationEffect$Composition;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IF)Landroid/os/VibrationEffect$Composition;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/os/VibrationEffect$Composition;->compose()Landroid/os/VibrationEffect;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x5

    .line 41
    invoke-static {p0}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :goto_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method


# virtual methods
.method public final vibrateForSearch()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->searchEffect:Landroid/os/VibrationEffect;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->vibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final vibrateForSearchHint()V
    .locals 12

    .line 1
    sget-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->context:Landroid/content/Context;

    .line 8
    .line 9
    const-class v2, Landroid/os/Vibrator;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    check-cast v1, Landroid/os/Vibrator;

    .line 19
    .line 20
    const/16 v2, 0x8

    .line 21
    .line 22
    filled-new-array {v2}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v1, v3}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getShouldPlayHapticOverride()Ljava/util/Optional;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/util/Optional;->isPresent()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getShouldPlayHapticOverride()Ljava/util/Optional;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    check-cast v1, Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getEnableSearchHapticHint()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move v1, v3

    .line 71
    :goto_0
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getLpnhHapticHintStartScalePercent()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    int-to-float v1, v1

    .line 78
    const/high16 v4, 0x42c80000    # 100.0f

    .line 79
    .line 80
    div-float/2addr v1, v4

    .line 81
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getLpnhHapticHintEndScalePercent()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    int-to-float v5, v5

    .line 86
    div-float/2addr v5, v4

    .line 87
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getLpnhHapticHintScaleExponent()I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getLpnhHapticHintIterations()I

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getLpnhHapticHintDelay()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {}, Landroid/os/VibrationEffect;->startComposition()Landroid/os/VibrationEffect$Composition;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    const-string v8, "startComposition(...)"

    .line 104
    .line 105
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :goto_1
    if-ge v3, v6, :cond_3

    .line 109
    .line 110
    int-to-float v8, v3

    .line 111
    int-to-float v9, v6

    .line 112
    const/high16 v10, 0x3f800000    # 1.0f

    .line 113
    .line 114
    sub-float/2addr v9, v10

    .line 115
    div-float/2addr v8, v9

    .line 116
    const/4 v9, 0x1

    .line 117
    int-to-float v9, v9

    .line 118
    sub-float/2addr v9, v8

    .line 119
    mul-float/2addr v9, v1

    .line 120
    mul-float/2addr v8, v5

    .line 121
    add-float/2addr v9, v8

    .line 122
    float-to-double v8, v9

    .line 123
    int-to-double v10, v4

    .line 124
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    .line 125
    .line 126
    .line 127
    move-result-wide v8

    .line 128
    double-to-float v8, v8

    .line 129
    if-nez v3, :cond_2

    .line 130
    .line 131
    invoke-virtual {v7, v2, v8, v0}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IFI)Landroid/os/VibrationEffect$Composition;

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_2
    invoke-virtual {v7, v2, v8}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IF)Landroid/os/VibrationEffect$Composition;

    .line 136
    .line 137
    .line 138
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->vibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 142
    .line 143
    invoke-virtual {v7}, Landroid/os/VibrationEffect$Composition;->compose()Landroid/os/VibrationEffect;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 148
    .line 149
    .line 150
    :cond_4
    return-void
.end method
