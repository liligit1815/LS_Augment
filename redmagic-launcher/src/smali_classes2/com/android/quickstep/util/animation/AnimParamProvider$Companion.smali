.class public final Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;
.super Ljava/lang/Object;
.source "AnimParamProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/AnimParamProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider;
    .locals 0

    .line 1
    const-string p0, "animType"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/util/animation/AnimParamProvider;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final getContentAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;
    .locals 0

    .line 1
    const-string p0, "animType"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final getSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
