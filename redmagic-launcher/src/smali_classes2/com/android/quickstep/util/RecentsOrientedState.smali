.class public Lcom/android/quickstep/util/RecentsOrientedState;
.super Ljava/lang/Object;
.source "RecentsOrientedState.java"

# interfaces
.implements Lcom/android/launcher3/F3;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/RecentsOrientedState$SurfaceRotation;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final FLAG_HOME_FIXED_LANDSCAPE_PREFS:I = 0x400

.field private static final FLAG_HOME_ROTATION_ALLOWED_IN_PREFS:I = 0x4

.field private static final FLAG_HOME_ROTATION_FORCE_ENABLED_FOR_TESTING:I = 0x80

.field private static final FLAG_IGNORE_ALLOW_HOME_ROTATION_PREF:I = 0x200

.field private static final FLAG_MULTIPLE_ORIENTATION_SUPPORTED_BY_ACTIVITY:I = 0x1

.field private static final FLAG_MULTIPLE_ORIENTATION_SUPPORTED_BY_DENSITY:I = 0x2

.field private static final FLAG_MULTIWINDOW_ROTATION_ALLOWED:I = 0x10

.field private static final FLAG_ROTATION_WATCHER_ENABLED:I = 0x40

.field private static final FLAG_ROTATION_WATCHER_SUPPORTED:I = 0x20

.field private static final FLAG_SWIPE_UP_NOT_RUNNING:I = 0x100

.field private static final FLAG_SYSTEM_ROTATION_ALLOWED:I = 0x8

.field private static final MASK_MULTIPLE_ORIENTATION_SUPPORTED_BY_DEVICE:I = 0x3

.field private static final TAG:Ljava/lang/String; = "RecentsOrientedState"

.field private static final VALUE_ROTATION_WATCHER_ENABLED:I = 0x16b


# instance fields
.field private final mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

.field private final mContext:Landroid/content/Context;

.field private mDisplayRotation:I

.field private mFlags:I

.field private mListenersInitialized:Z

.field private mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

.field private final mOrientationListener:Landroid/view/OrientationEventListener;

.field private mPreviousRotation:I

.field private mRecentsActivityRotation:I

.field private mRecentsRotation:I

.field private final mRotationChangeListener:Lcom/android/launcher3/util/p2$a;

.field private final mSettingsCache:Lcom/android/launcher3/util/p2;

.field private mStateId:I

.field private final mTmpMatrix:Landroid/graphics/Matrix;

.field private mTouchRotation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;Ljava/util/function/IntConsumer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 10
    .line 11
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 12
    .line 13
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 14
    .line 15
    const/4 v1, -0x1

    .line 16
    iput v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsRotation:I

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/util/y0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/y0;-><init>(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRotationChangeListener:Lcom/android/launcher3/util/p2$a;

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 31
    .line 32
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mPreviousRotation:I

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mListenersInitialized:Z

    .line 35
    .line 36
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mStateId:I

    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 41
    .line 42
    new-instance v0, Lcom/android/quickstep/util/RecentsOrientedState$1;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1, p3}, Lcom/android/quickstep/util/RecentsOrientedState$1;-><init>(Lcom/android/quickstep/util/RecentsOrientedState;Landroid/content/Context;Ljava/util/function/IntConsumer;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 48
    .line 49
    iget-boolean p2, p2, Lcom/android/quickstep/BaseContainerInterface;->rotationSupportedByActivity:Z

    .line 50
    .line 51
    or-int/lit16 p2, p2, 0x100

    .line 52
    .line 53
    iput p2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 54
    .line 55
    sget-object p2, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 56
    .line 57
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/android/launcher3/util/p2;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->initFlags()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->lambda$new$0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->lambda$setFlag$1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/RecentsOrientedState;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mPreviousRotation:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/RecentsOrientedState;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mPreviousRotation:I

    .line 2
    .line 3
    return-void
.end method

.method private destroyMultipleOrientationListeners()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v1, v1, [Lcom/android/launcher3/H1;

    .line 9
    .line 10
    sget-object v2, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput-object v2, v1, v3

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 19
    .line 20
    sget-object v1, Lcom/android/launcher3/util/p2;->j:Landroid/net/Uri;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRotationChangeListener:Lcom/android/launcher3/util/p2$a;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static getRotationForUserDegreesRotated(FI)I
    .locals 8

    .line 1
    const/high16 v0, -0x40800000    # -1.0f

    .line 2
    .line 3
    cmpl-float v0, p0, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    const/high16 v0, 0x43340000    # 180.0f

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    const/4 v2, 0x1

    .line 13
    const/16 v3, 0x46

    .line 14
    .line 15
    if-eqz p1, :cond_c

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/16 v5, 0x154

    .line 19
    .line 20
    const/high16 v6, 0x43b40000    # 360.0f

    .line 21
    .line 22
    const/4 v7, 0x2

    .line 23
    if-eq p1, v2, :cond_7

    .line 24
    .line 25
    const/16 v3, 0xfa

    .line 26
    .line 27
    if-eq p1, v7, :cond_5

    .line 28
    .line 29
    if-eq p1, v1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    const/16 v1, 0x14

    .line 34
    .line 35
    int-to-float v1, v1

    .line 36
    cmpg-float v1, p0, v1

    .line 37
    .line 38
    if-ltz v1, :cond_4

    .line 39
    .line 40
    int-to-float v1, v5

    .line 41
    cmpl-float v1, p0, v1

    .line 42
    .line 43
    if-lez v1, :cond_2

    .line 44
    .line 45
    cmpg-float v1, p0, v6

    .line 46
    .line 47
    if-gez v1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/16 v1, 0xa0

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    cmpl-float v1, p0, v1

    .line 54
    .line 55
    if-lez v1, :cond_3

    .line 56
    .line 57
    cmpg-float v0, p0, v0

    .line 58
    .line 59
    if-gez v0, :cond_3

    .line 60
    .line 61
    return v7

    .line 62
    :cond_3
    int-to-float v0, v3

    .line 63
    cmpl-float v0, p0, v0

    .line 64
    .line 65
    if-lez v0, :cond_e

    .line 66
    .line 67
    cmpg-float p0, p0, v6

    .line 68
    .line 69
    if-gez p0, :cond_e

    .line 70
    .line 71
    return v2

    .line 72
    :cond_4
    :goto_0
    return v4

    .line 73
    :cond_5
    const/16 v0, 0x6e

    .line 74
    .line 75
    int-to-float v0, v0

    .line 76
    cmpg-float v0, p0, v0

    .line 77
    .line 78
    if-gez v0, :cond_6

    .line 79
    .line 80
    return v1

    .line 81
    :cond_6
    int-to-float v0, v3

    .line 82
    cmpl-float p0, p0, v0

    .line 83
    .line 84
    if-lez p0, :cond_e

    .line 85
    .line 86
    return v2

    .line 87
    :cond_7
    const/16 v2, 0xc8

    .line 88
    .line 89
    int-to-float v2, v2

    .line 90
    cmpg-float v2, p0, v2

    .line 91
    .line 92
    if-gez v2, :cond_8

    .line 93
    .line 94
    const/high16 v2, 0x42b40000    # 90.0f

    .line 95
    .line 96
    cmpl-float v2, p0, v2

    .line 97
    .line 98
    if-lez v2, :cond_8

    .line 99
    .line 100
    return v7

    .line 101
    :cond_8
    int-to-float v2, v5

    .line 102
    cmpl-float v2, p0, v2

    .line 103
    .line 104
    if-lez v2, :cond_9

    .line 105
    .line 106
    cmpg-float v2, p0, v6

    .line 107
    .line 108
    if-ltz v2, :cond_a

    .line 109
    .line 110
    :cond_9
    const/4 v2, 0x0

    .line 111
    cmpl-float v2, p0, v2

    .line 112
    .line 113
    if-ltz v2, :cond_b

    .line 114
    .line 115
    int-to-float v2, v3

    .line 116
    cmpg-float v2, p0, v2

    .line 117
    .line 118
    if-gez v2, :cond_b

    .line 119
    .line 120
    :cond_a
    return v4

    .line 121
    :cond_b
    int-to-float v2, v3

    .line 122
    cmpl-float v2, p0, v2

    .line 123
    .line 124
    if-lez v2, :cond_e

    .line 125
    .line 126
    cmpg-float p0, p0, v0

    .line 127
    .line 128
    if-gez p0, :cond_e

    .line 129
    .line 130
    return v1

    .line 131
    :cond_c
    cmpl-float v4, p0, v0

    .line 132
    .line 133
    if-lez v4, :cond_d

    .line 134
    .line 135
    const/16 v4, 0x122

    .line 136
    .line 137
    int-to-float v4, v4

    .line 138
    cmpg-float v4, p0, v4

    .line 139
    .line 140
    if-gez v4, :cond_d

    .line 141
    .line 142
    return v2

    .line 143
    :cond_d
    cmpg-float v0, p0, v0

    .line 144
    .line 145
    if-gez v0, :cond_e

    .line 146
    .line 147
    int-to-float v0, v3

    .line 148
    cmpl-float p0, p0, v0

    .line 149
    .line 150
    if-lez p0, :cond_e

    .line 151
    .line 152
    return v1

    .line 153
    :cond_e
    :goto_1
    return p1
.end method

.method private inferRecentsActivityRotation(I)I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->shouldUseRealOrientation()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsRotation:I

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    return p1

    .line 12
    :cond_0
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private initFlags()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->canDetectOrientation()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20

    .line 8
    .line 9
    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateAutoRotateSetting()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateHomeRotationSetting()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateFixedLandscapeSetting()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private initMultipleOrientationListeners()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v1, v1, [Lcom/android/launcher3/H1;

    .line 9
    .line 10
    sget-object v2, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput-object v2, v1, v3

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 19
    .line 20
    sget-object v1, Lcom/android/launcher3/util/p2;->j:Landroid/net/Uri;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRotationChangeListener:Lcom/android/launcher3/util/p2$a;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateAutoRotateSetting()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic lambda$new$0(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateAutoRotateSetting()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$setFlag$1(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/OrientationEventListener;->enable()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/OrientationEventListener;->disable()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static nameAndAddress(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "@"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static postDisplayRotation(IFFLandroid/graphics/Matrix;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x3

    .line 9
    if-eq p0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/high16 p0, 0x42b40000    # 90.0f

    .line 13
    .line 14
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, p2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/high16 p0, 0x43340000    # 180.0f

    .line 22
    .line 23
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3, p2, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const/high16 p0, 0x43870000    # 270.0f

    .line 31
    .line 32
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static preDisplayRotation(IFFLandroid/graphics/Matrix;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x3

    .line 9
    if-eq p0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/high16 p0, 0x43870000    # 270.0f

    .line 13
    .line 14
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, v1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/high16 p0, 0x43340000    # 180.0f

    .line 22
    .line 23
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3, p2, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const/high16 p0, 0x42b40000    # 90.0f

    .line 31
    .line 32
    invoke-virtual {p3, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private setFlag(IZ)Z
    .locals 4

    .line 1
    sget-boolean v0, Lc2/b;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/16 v3, 0x16b

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 10
    .line 11
    and-int/2addr v0, v3

    .line 12
    if-ne v0, v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isRecentsActivityRotationAllowed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    move v0, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget p2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 26
    .line 27
    or-int/2addr p1, p2

    .line 28
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget p2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 32
    .line 33
    not-int p1, p1

    .line 34
    and-int/2addr p1, p2

    .line 35
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 36
    .line 37
    :goto_1
    sget-boolean p1, Lc2/b;->b:Z

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    iget p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 42
    .line 43
    and-int/2addr p1, v3

    .line 44
    if-ne p1, v3, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isRecentsActivityRotationAllowed()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    move v1, v2

    .line 53
    :cond_2
    if-eq v0, v1, :cond_3

    .line 54
    .line 55
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 56
    .line 57
    new-instance p2, Lcom/android/quickstep/util/z0;

    .line 58
    .line 59
    invoke-direct {p2, p0, v1}, Lcom/android/quickstep/util/z0;-><init>(Lcom/android/quickstep/util/RecentsOrientedState;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateHandler()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0
.end method

.method private shouldUseRealOrientation()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isRecentsActivityRotationAllowed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isLauncherFixedLandscape()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private updateAutoRotateSetting()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/p2;->j:Landroid/net/Uri;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private updateFixedLandscapeSetting()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v1, 0x400

    .line 26
    .line 27
    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private updateHandler()Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->inferRecentsActivityRotation(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 8
    .line 9
    iget v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eq v0, v1, :cond_3

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->shouldUseRealOrientation()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 23
    .line 24
    if-ne v0, v3, :cond_1

    .line 25
    .line 26
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    if-ne v0, v2, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->SEASCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    :goto_0
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 46
    .line 47
    :goto_1
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mStateId:I

    .line 48
    .line 49
    iget v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 50
    .line 51
    shl-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    iget v4, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 54
    .line 55
    or-int/2addr v1, v4

    .line 56
    shl-int/lit8 v1, v1, 0x2

    .line 57
    .line 58
    iget v4, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 59
    .line 60
    or-int/2addr v1, v4

    .line 61
    shl-int/2addr v1, v2

    .line 62
    iget v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsRotation:I

    .line 63
    .line 64
    if-gez v2, :cond_4

    .line 65
    .line 66
    const/4 v2, 0x7

    .line 67
    :cond_4
    or-int/2addr v1, v2

    .line 68
    iput v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mStateId:I

    .line 69
    .line 70
    if-eq v1, v0, :cond_5

    .line 71
    .line 72
    return v3

    .line 73
    :cond_5
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method private updateHomeRotationSetting()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->i(Lcom/android/launcher3/Y;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 21
    .line 22
    .line 23
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->setHomeRotationEnabled(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public destroyListeners()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mListenersInitialized:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isMultipleOrientationSupportedByDevice()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->destroyMultipleOrientationListeners()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->setRotationWatcherEnabled(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public flipVertical(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/high16 v2, -0x40800000    # -1.0f

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public forceAllowRotationForTesting(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDisplayRotation()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 9
    .line 10
    return p0
.end method

.method public getFullScreenScaleAndPivot(Landroid/graphics/Rect;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p2, p3}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    .line 4
    .line 5
    .line 6
    iget p0, p3, Landroid/graphics/PointF;->x:F

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    int-to-float p2, p2

    .line 13
    div-float/2addr p0, p2

    .line 14
    iget p2, p3, Landroid/graphics/PointF;->y:F

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    div-float/2addr p2, v0

    .line 22
    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/high16 p2, 0x3f800000    # 1.0f

    .line 27
    .line 28
    cmpl-float v0, p0, p2

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    int-to-float p2, p2

    .line 37
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-float p1, p1

    .line 42
    invoke-virtual {p3, p2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 43
    .line 44
    .line 45
    return p0

    .line 46
    :cond_0
    sub-float p2, p0, p2

    .line 47
    .line 48
    div-float p2, p0, p2

    .line 49
    .line 50
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    int-to-float v0, v0

    .line 53
    mul-float/2addr v0, p2

    .line 54
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    int-to-float p1, p1

    .line 57
    mul-float/2addr p1, p2

    .line 58
    invoke-virtual {p3, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 59
    .line 60
    .line 61
    return p0
.end method

.method public getLauncherDeviceProfile(I)Lcom/android/launcher3/h0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/android/launcher3/F1;

    .line 37
    .line 38
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mContext:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 53
    .line 54
    iget v1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    if-eq v1, v2, :cond_2

    .line 58
    .line 59
    const/4 v2, 0x3

    .line 60
    if-ne v1, v2, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 64
    .line 65
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 66
    .line 67
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 72
    .line 73
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 74
    .line 75
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    :goto_0
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 81
    .line 82
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 83
    .line 84
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 89
    .line 90
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 91
    .line 92
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    :goto_1
    int-to-float v1, v1

    .line 97
    int-to-float v0, v0

    .line 98
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 99
    .line 100
    invoke-virtual {p1, v1, v0, p0}, Lcom/android/launcher3/F1;->s0(FFI)Lcom/android/launcher3/h0;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method public getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecentsActivityRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getStateId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mStateId:I

    .line 2
    .line 3
    return p0
.end method

.method public getTouchRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public ignoreAllowHomeRotationPreference()V
    .locals 2

    .line 1
    const/16 v0, 0x200

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public initListeners()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mListenersInitialized:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isMultipleOrientationSupportedByDevice()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->initMultipleOrientationListeners()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->initFlags()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public isDisplayPhoneNatural()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public isLauncherFixedLandscape()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 2
    .line 3
    const/16 v0, 0x400

    .line 4
    .line 5
    and-int/2addr p0, v0

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isMultipleOrientationSupportedByDevice()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isRecentsActivityRotationAllowed()Z
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 2
    .line 3
    and-int/lit8 v0, p0, 0x3

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    and-int/lit16 p0, p0, 0x294

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public onPrefChanged(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/Y;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateHomeRotationSetting()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateFixedLandscapeSetting()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public bridge synthetic onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/F3;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDeviceProfile(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isMultipleOrientationSupportedByDevice()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 11
    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mListenersInitialized:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isMultipleOrientationSupportedByDevice()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eq p1, v0, :cond_1

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->initMultipleOrientationListeners()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->destroyMultipleOrientationListeners()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public setGestureActive(Z)Z
    .locals 1

    .line 1
    xor-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    const/16 v0, 0x100

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setMultiWindowMode(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRecentsRotation(I)Z
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsRotation:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateHandler()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setRotationWatcherEnabled(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setFlag(IZ)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "[this="

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->nameAndAddress(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, " mOrientationHandler="

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->nameAndAddress(Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, " mDisplayRotation="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, " mTouchRotation="

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v2, " mRecentsActivityRotation="

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, " mRecentsRotation="

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget v2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsRotation:I

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v2, " isRecentsActivityRotationAllowed="

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->isRecentsActivityRotationAllowed()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v2, " mSystemRotation="

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, " mStateId="

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mStateId:I

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, " mFlags="

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mFlags:I

    .line 117
    .line 118
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string p0, "]"

    .line 122
    .line 123
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public transformEvent(FLandroid/view/MotionEvent;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    neg-float p1, p1

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    invoke-virtual {p2, p0}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public update(II)Z
    .locals 3

    .line 1
    iput p2, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mDisplayRotation:I

    .line 2
    .line 3
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mTouchRotation:I

    .line 4
    .line 5
    iput p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mPreviousRotation:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->updateHandler()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "update: "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " , "

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget p1, p0, Lcom/android/quickstep/util/RecentsOrientedState;->mRecentsActivityRotation:I

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, ", "

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "RecentsOrientedState"

    .line 53
    .line 54
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return v0
.end method
