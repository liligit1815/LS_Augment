.class public Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;
.super Ljava/lang/Object;
.source "AnimParamProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/AnimParamProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContentAnimParam"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam$WhenMappings;
    }
.end annotation


# instance fields
.field private mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

.field protected param:[F


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mAnimType"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->initParam()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->param:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public initParam()V
    .locals 4

    .line 1
    sget v0, Lcom/android/launcher3/anim/x;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 12
    .line 13
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    aget v1, v1, v3

    .line 18
    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq v1, v2, :cond_0

    .line 23
    .line 24
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getCONTENT_VIEW_PARAM()[[F

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    aget-object v0, v1, v0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getCONTENT_VIEW_PARAM()[[F

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    aget-object v0, v1, v0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getCONTENT_VIEW_PARAM()[[F

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    aget-object v0, v1, v0

    .line 49
    .line 50
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->setParam([F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final setMAnimType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 7
    .line 8
    return-void
.end method

.method public final setParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->param:[F

    .line 7
    .line 8
    return-void
.end method
