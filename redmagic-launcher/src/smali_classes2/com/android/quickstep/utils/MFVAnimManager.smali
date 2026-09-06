.class public final Lcom/android/quickstep/utils/MFVAnimManager;
.super Ljava/lang/Object;
.source "MFVAnimManager.java"


# static fields
.field static final $$delegatedProperties:[LB4/h;

.field public static final ANIM_TAG:Ljava/lang/String; = "MultiAppLaunchInterrupt"

.field public static final INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

.field private static final SUPPORT_INTERRUPT:Z = true

.field private static final TAG:Ljava/lang/String; = "MFVAnimManager"

.field public static final WINDOW_ANIM_TAG:Ljava/lang/String; = "LauncherRemoteAnim"

.field private static final mAnimationController:Lcom/android/quickstep/util/anim/BaseProperty;

.field private static final mAnimationSeqHelper:Lcom/android/quickstep/util/anim/BaseProperty;

.field private static final mAppOpenAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

.field private static final mInterceptKeyEventHelper:Lcom/android/quickstep/util/anim/BaseProperty;

.field private static final mMultiAppAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    const-class v0, Lcom/android/quickstep/utils/MFVAnimManager;

    .line 2
    .line 3
    const-string v1, "mAppOpenAnimMergeHelper"

    .line 4
    .line 5
    const-string v2, "getMAppOpenAnimMergeHelper()Lcom/mfv/quickstep/utils/DefaultAppOpenAnimMergeHelper;"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v0, v1, v2, v3}, Lcom/android/quickstep/util/MFVStringUtils;->getMutableProperty(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)LB4/h;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "mMultiAppAnimMergeHelper"

    .line 13
    .line 14
    const-string v4, "getMMultiAppAnimMergeHelper()Lcom/mfv/quickstep/utils/DefaultMultiAppAnimMergeHelper;"

    .line 15
    .line 16
    invoke-static {v0, v2, v4, v3}, Lcom/android/quickstep/util/MFVStringUtils;->getMutableProperty(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)LB4/h;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v4, "mAnimationController"

    .line 21
    .line 22
    const-string v5, "getMAnimationController()Lcom/mfv/quickstep/utils/DefaultAnimationController;"

    .line 23
    .line 24
    invoke-static {v0, v4, v5, v3}, Lcom/android/quickstep/util/MFVStringUtils;->getMutableProperty(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)LB4/h;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const-string v5, "mAnimationSeqHelper"

    .line 29
    .line 30
    const-string v6, "getMAnimationSeqHelper()Lcom/mfv/quickstep/utils/DefaultAnimationSeqHelper;"

    .line 31
    .line 32
    invoke-static {v0, v5, v6, v3}, Lcom/android/quickstep/util/MFVStringUtils;->getMutableProperty(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)LB4/h;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v6, "mInterceptKeyEventHelper"

    .line 37
    .line 38
    const-string v7, "getMInterceptKeyEventHelper()Lcom/mfv/quickstep/utils/DefalutInterceptKeyEventHelper;"

    .line 39
    .line 40
    invoke-static {v0, v6, v7, v3}, Lcom/android/quickstep/util/MFVStringUtils;->getMutableProperty(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)LB4/h;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v6, 0x5

    .line 45
    new-array v6, v6, [LB4/h;

    .line 46
    .line 47
    aput-object v1, v6, v3

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    aput-object v2, v6, v1

    .line 51
    .line 52
    const/4 v1, 0x2

    .line 53
    aput-object v4, v6, v1

    .line 54
    .line 55
    const/4 v1, 0x3

    .line 56
    aput-object v5, v6, v1

    .line 57
    .line 58
    const/4 v1, 0x4

    .line 59
    aput-object v0, v6, v1

    .line 60
    .line 61
    sput-object v6, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 62
    .line 63
    new-instance v0, Lcom/android/quickstep/utils/MFVAnimManager;

    .line 64
    .line 65
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;-><init>()V

    .line 66
    .line 67
    .line 68
    sput-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Lcom/android/quickstep/utils/MFVAnimManager$1;

    .line 75
    .line 76
    invoke-direct {v2, v1}, Lcom/android/quickstep/utils/MFVAnimManager$1;-><init>(Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;)V

    .line 77
    .line 78
    .line 79
    sput-object v2, Lcom/android/quickstep/utils/MFVAnimManager;->mAppOpenAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 80
    .line 81
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->createMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    new-instance v2, Lcom/android/quickstep/utils/MFVAnimManager$2;

    .line 86
    .line 87
    invoke-direct {v2, v1}, Lcom/android/quickstep/utils/MFVAnimManager$2;-><init>(Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;)V

    .line 88
    .line 89
    .line 90
    sput-object v2, Lcom/android/quickstep/utils/MFVAnimManager;->mMultiAppAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 91
    .line 92
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    new-instance v2, Lcom/android/quickstep/utils/MFVAnimManager$3;

    .line 97
    .line 98
    invoke-direct {v2, v1}, Lcom/android/quickstep/utils/MFVAnimManager$3;-><init>(Lcom/android/quickstep/utils/DefaultAnimationController;)V

    .line 99
    .line 100
    .line 101
    sput-object v2, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationController:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 102
    .line 103
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    new-instance v2, Lcom/android/quickstep/utils/MFVAnimManager$4;

    .line 108
    .line 109
    invoke-direct {v2, v1}, Lcom/android/quickstep/utils/MFVAnimManager$4;-><init>(Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V

    .line 110
    .line 111
    .line 112
    sput-object v2, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationSeqHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 113
    .line 114
    invoke-direct {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->createInterceptKeyEventHelper()Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Lcom/android/quickstep/utils/MFVAnimManager$5;

    .line 119
    .line 120
    invoke-direct {v1, v0}, Lcom/android/quickstep/utils/MFVAnimManager$5;-><init>(Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;)V

    .line 121
    .line 122
    .line 123
    sput-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->mInterceptKeyEventHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 124
    .line 125
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final createAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/utils/AnimationController;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAnimationController;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private final createAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/utils/AnimationSeqHelper;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationSeqHelper;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private final createAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private final createInterceptKeyEventHelper()Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private final createMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private final getMAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationController:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/util/anim/BaseProperty;->getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 9
    .line 10
    return-object p0
.end method

.method private final getMAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationSeqHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/util/anim/BaseProperty;->getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 9
    .line 10
    return-object p0
.end method

.method private final getMAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAppOpenAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/util/anim/BaseProperty;->getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 9
    .line 10
    return-object p0
.end method

.method private final getMInterceptKeyEventHelper()Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mInterceptKeyEventHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/util/anim/BaseProperty;->getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;

    .line 9
    .line 10
    return-object p0
.end method

.method private final getMMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mMultiAppAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/util/anim/BaseProperty;->getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 9
    .line 10
    return-object p0
.end method

.method private final setMAnimationController(Lcom/android/quickstep/utils/DefaultAnimationController;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationController:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    check-cast v1, Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1, p1}, Lcom/android/quickstep/util/anim/BaseProperty;->setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final setMAnimationSeqHelper(Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAnimationSeqHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    check-cast v1, Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1, p1}, Lcom/android/quickstep/util/anim/BaseProperty;->setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final setMAppOpenAnimMergeHelper(Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mAppOpenAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    check-cast v1, Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1, p1}, Lcom/android/quickstep/util/anim/BaseProperty;->setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final setMInterceptKeyEventHelper(Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mInterceptKeyEventHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    check-cast v1, Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1, p1}, Lcom/android/quickstep/util/anim/BaseProperty;->setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final setMMultiAppAnimMergeHelper(Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->mMultiAppAnimMergeHelper:Lcom/android/quickstep/util/anim/BaseProperty;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->$$delegatedProperties:[LB4/h;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    check-cast v1, Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1, p1}, Lcom/android/quickstep/util/anim/BaseProperty;->setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final cleanUpRecentsAnimation()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "MFVAnimManager"

    .line 8
    .line 9
    const-string v1, "cleanUpRecentsAnimation"

    .line 10
    .line 11
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->cleanUpRecentsAnim()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->setOnTaskAppearedTarget(Landroid/view/RemoteAnimationTarget;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->cleanUpRecentsAnim()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getInterceptKeyHelper()Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMInterceptKeyEventHelper()Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final matchAnimationId(II)Z
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, -0x1

    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    const-string p1, "MFVAnimManager"

    .line 13
    .line 14
    const-string p2, "Error animation id"

    .line 15
    .line 16
    invoke-static {p1, p2}, LM3/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return p0
.end method

.method public final recreateAnimHelper()V
    .locals 2

    .line 1
    const-string v0, "MFVAnimManager"

    .line 2
    .line 3
    const-string v1, "recreateAnimHelper"

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/MFVAnimManager;->setMAppOpenAnimMergeHelper(Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->createMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/MFVAnimManager;->setMMultiAppAnimMergeHelper(Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/MFVAnimManager;->setMAnimationController(Lcom/android/quickstep/utils/DefaultAnimationController;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->createAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/MFVAnimManager;->setMAnimationSeqHelper(Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final reset()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->reset()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->cleanUpRecentsAnim()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->reset()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final supportInterceptKeyEvent()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final supportInterruption()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final supportInterruption(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 2
    const-string v0, "itemInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    instance-of p1, p1, Lcom/android/launcher3/model/data/I;

    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 5
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 p1, 0x0

    .line 6
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final tryFinishOpenRemote(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->isRecentsMergeOpenRemote()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "tryFinishOpenRemote, isRecentsMergeOpenRemote = "

    .line 16
    .line 17
    const-string v2, "MFVAnimManager"

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMAnimationController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setAppLaunchAnimFinishCallback(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method
