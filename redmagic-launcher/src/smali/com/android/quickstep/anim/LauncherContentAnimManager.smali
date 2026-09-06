.class public final Lcom/android/quickstep/anim/LauncherContentAnimManager;
.super Ljava/lang/Object;
.source "LauncherContentAnimManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;
    }
.end annotation


# static fields
.field private static final DRAG_LAYER_FADE_ANIM_DURATION:J = 0xc8L

.field public static final INSTANCE:Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;

.field private static final MIN_SCALE:F = 0.9f

.field private static final SCRIM_FADE_ANIM_DURATION:J = 0x15eL

.field private static final TAG:Ljava/lang/String; = "LauncherContentAnimManager"


# instance fields
.field private allAppsAnimatorSet:Landroid/animation/AnimatorSet;

.field private hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

.field private mDrawerGuideListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

.field private mLastAnimId:I

.field private mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private mRecentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field private mZoomOutAnimEnable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->INSTANCE:Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mLauncher"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of v0, p1, Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mZoomOutAnimEnable:Z

    .line 27
    .line 28
    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLastAnimId:I

    .line 30
    .line 31
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/anim/LauncherContentAnimManager;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/anim/LauncherContentAnimManager;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method

.method private final doDepthAnim(ZLcom/android/quickstep/util/animation/MultiAnimatorSet;Z[F)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/BaseDepthController;->getBlurValue()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/util/BaseDepthController;->getMaxBlurRadius()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    div-float/2addr v2, v0

    .line 22
    move v5, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v5, v1

    .line 25
    :goto_0
    if-nez p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 40
    .line 41
    if-ne p1, v0, :cond_1

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    :goto_1
    move v1, p1

    .line 45
    goto :goto_2

    .line 46
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/android/launcher3/V3;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 59
    .line 60
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->getBlur(Landroid/content/Context;)F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_2
    move v6, v1

    .line 66
    if-nez p3, :cond_4

    .line 67
    .line 68
    cmpl-float p1, v5, v6

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget-object p3, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 77
    .line 78
    if-ne p1, p3, :cond_4

    .line 79
    .line 80
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, LP1/h;->z()Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const/4 p0, 0x0

    .line 91
    aget v7, p4, p0

    .line 92
    .line 93
    const/4 p0, 0x1

    .line 94
    aget v8, p4, p0

    .line 95
    .line 96
    const/4 v4, 0x1

    .line 97
    invoke-virtual/range {v3 .. v8}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->depthTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p2, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    const-string p0, "LauncherContentAnimManager"

    .line 106
    .line 107
    const-string p1, "Ignore depth animation"

    .line 108
    .line 109
    invoke-static {p0, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method private final getLauncherViewAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->getContentAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;->getParam()[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private final isDragLayerContentAnim()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->INSTANCE:Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;

    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0, p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;->isDragLayerContentAnim(Lcom/android/launcher3/C2;)Z

    move-result p0

    return p0
.end method

.method public static final isDragLayerContentAnim(Lcom/android/launcher3/C2;)Z
    .locals 1

    .line 2
    sget-object v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->INSTANCE:Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;

    invoke-virtual {v0, p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager$Companion;->isDragLayerContentAnim(Lcom/android/launcher3/C2;)Z

    move-result p0

    return p0
.end method

.method private final resetViewState(ZIZ)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLastAnimId:I

    .line 2
    .line 3
    const-string v1, ", animId: "

    .line 4
    .line 5
    const-string v2, "resetViewState, animDragLayer = "

    .line 6
    .line 7
    const-string v3, ", mLastAnimId: "

    .line 8
    .line 9
    invoke-static {v2, p1, v3, v0, v1}, Lcom/android/quickstep/util/MFVStringUtils;->newStringBuilder(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "LauncherContentAnimManager"

    .line 14
    .line 15
    invoke-static {v0, p2, v1}, Lcom/android/quickstep/util/MFVStringUtils;->appendAndLog(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 19
    .line 20
    iget v2, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLastAnimId:I

    .line 21
    .line 22
    invoke-virtual {v0, v2, p2}, Lcom/android/quickstep/utils/MFVAnimManager;->matchAnimationId(II)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_6

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const-string v0, "mLauncher.dragLayer"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v0, "mLauncher.workspace"

    .line 44
    .line 45
    :goto_0
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/high16 v0, 0x3f800000    # 1.0f

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isOverviewShowing()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const-string p1, "Cannot reset as overview state."

    .line 65
    .line 66
    invoke-static {v1, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isOverviewShowing()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_3

    .line 93
    .line 94
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 107
    .line 108
    .line 109
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 122
    .line 123
    .line 124
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 125
    .line 126
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 127
    .line 128
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_5

    .line 133
    .line 134
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 135
    .line 136
    const/4 v0, 0x1

    .line 137
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->getAnyView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    if-nez p1, :cond_5

    .line 142
    .line 143
    if-nez p3, :cond_5

    .line 144
    .line 145
    iget-boolean p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mZoomOutAnimEnable:Z

    .line 146
    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    iget-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const/4 p3, 0x0

    .line 156
    invoke-virtual {p1, p3}, LP1/h;->J(F)V

    .line 157
    .line 158
    .line 159
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isOverviewShowing()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_5

    .line 164
    .line 165
    const-string p1, "Cannot reset as overview state. depth"

    .line 166
    .line 167
    invoke-static {v1, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_5
    const/4 p1, 0x0

    .line 171
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->setLayerType(Landroid/view/View;I)V

    .line 172
    .line 173
    .line 174
    :cond_6
    return-void
.end method

.method private final setLayerType(Landroid/view/View;I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "setLayerType: "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, ", view:"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "LauncherContentAnimManager"

    .line 27
    .line 28
    invoke-static {v0, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {p1, p2, p0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static startLauncherContentAnim$default(Lcom/android/quickstep/anim/LauncherContentAnimManager;Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final startLauncherContentAnim$lambda$1(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZLjava/lang/Integer;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "it"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-direct {p0, v0, p2, p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->resetViewState(ZIZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static final startLauncherContentAnim$lambda$2(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZLjava/lang/Integer;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "it"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-direct {p0, v0, p2, p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->resetViewState(ZIZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static final startLauncherContentAnim$lambda$3(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZZLjava/lang/Integer;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "it"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    invoke-direct {p0, p1, p3, p2}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->resetViewState(ZIZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static final startLauncherContentAnim$lambda$4(Lcom/android/quickstep/anim/LauncherContentAnimManager;Lcom/android/quickstep/util/animation/SpringAnimation;Lcom/android/quickstep/util/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    const-string p2, "this$0"

    .line 2
    .line 3
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "$alphaAnim"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    if-nez p2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mDrawerGuideListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final cancelHideDragLayer()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    :cond_0
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "LauncherContentAnimManager"

    .line 15
    .line 16
    const-string v1, "cancelHideDragLayer cancel"

    .line 17
    .line 18
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final isOverviewShowing()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-string v0, "LauncherContentAnimManager"

    .line 6
    .line 7
    const-string v1, "isOverviewShowing mRecentsView is null"

    .line 8
    .line 9
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v1, v0, Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    iput-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 39
    .line 40
    sget-object v0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method public final resetHideDragLayer()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string v1, "LauncherContentAnimManager"

    .line 15
    .line 16
    const-string v2, "cancelHideDragLayer cancel"

    .line 17
    .line 18
    invoke-static {v1, v2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->cancelImmediately()V

    .line 35
    .line 36
    .line 37
    const/high16 v0, 0x3f800000    # 1.0f

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final startHideDragLayerOnGestureStart()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    const-string v1, "LauncherContentAnimManager"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "hideDragLayerWhenGestureStart is running"

    .line 14
    .line 15
    invoke-static {v1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string p0, "hideDragLayerWhenGestureStart: launcher already in NORMAL state! return"

    .line 30
    .line 31
    invoke-static {v1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isDragLayerContentAnim()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v2, 0x0

    .line 52
    cmpl-float v0, v0, v2

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->cancelDragLayerAlphaAnimImmediately()V

    .line 68
    .line 69
    .line 70
    const-string v0, "hideDragLayerWhenGestureStart start"

    .line 71
    .line 72
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    new-array v3, v3, [F

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    aput v2, v3, v4

    .line 88
    .line 89
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v1, "ofFloat(mLauncher.dragLa\u2026ncherAnimUtils.ALPHA, 0f)"

    .line 94
    .line 95
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const-wide/16 v1, 0xc8

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 101
    .line 102
    .line 103
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 106
    .line 107
    .line 108
    new-instance v1, Lcom/android/quickstep/anim/LauncherContentAnimManager$1;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager$1;-><init>(Lcom/android/quickstep/anim/LauncherContentAnimManager;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 119
    .line 120
    .line 121
    :cond_3
    :goto_0
    return-void
.end method

.method public final startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    const-string v4, "animatorSet"

    .line 10
    .line 11
    invoke-static {v1, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v4, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    const-string v5, "LauncherContentAnimManager"

    .line 17
    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    const-string v4, "startLauncherContentAnim hideDragLayerWhenGestureStart cancel"

    .line 29
    .line 30
    invoke-static {v5, v4}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v4, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->hideDragLayerWhenGestureStart:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimationId()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iput v4, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLastAnimId:I

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    new-instance v6, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v7, "startLauncherContentAnim, #"

    .line 53
    .line 54
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v4, ", #"

    .line 61
    .line 62
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget v4, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLastAnimId:I

    .line 66
    .line 67
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v4, ", "

    .line 71
    .line 72
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    new-instance v4, Lcom/android/quickstep/anim/LauncherContentAnimManager$2;

    .line 86
    .line 87
    invoke-direct {v4, v0}, Lcom/android/quickstep/anim/LauncherContentAnimManager$2;-><init>(Lcom/android/quickstep/anim/LauncherContentAnimManager;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v4}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-direct {v0, v4}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->getLauncherViewAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)[F

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iget-object v5, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 102
    .line 103
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    if-nez v3, :cond_1

    .line 108
    .line 109
    iget-object v6, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 110
    .line 111
    sget-object v7, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 112
    .line 113
    invoke-interface {v6, v7}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_1
    iget-object v6, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->allAppsAnimatorSet:Landroid/animation/AnimatorSet;

    .line 118
    .line 119
    if-eqz v6, :cond_2

    .line 120
    .line 121
    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->cancel()V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    sget-object v6, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 125
    .line 126
    invoke-virtual {v6}, Lcom/android/launcher3/anim/x$a;->b()Z

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    if-eqz v6, :cond_3

    .line 131
    .line 132
    goto/16 :goto_9

    .line 133
    .line 134
    :cond_3
    invoke-direct {v0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isDragLayerContentAnim()Z

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    new-instance v7, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;

    .line 139
    .line 140
    invoke-direct {v7, v0, v6, v3}, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;-><init>(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZZ)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v7}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->setViewStateResetRunnable(Ljava/util/function/Consumer;)V

    .line 144
    .line 145
    .line 146
    const v7, 0x3f666666    # 0.9f

    .line 147
    .line 148
    .line 149
    const/high16 v8, 0x3f800000    # 1.0f

    .line 150
    .line 151
    if-eqz v2, :cond_4

    .line 152
    .line 153
    move v11, v8

    .line 154
    goto :goto_1

    .line 155
    :cond_4
    move v11, v7

    .line 156
    :goto_1
    if-eqz v2, :cond_5

    .line 157
    .line 158
    move v12, v7

    .line 159
    goto :goto_2

    .line 160
    :cond_5
    move v12, v8

    .line 161
    :goto_2
    const/4 v7, 0x0

    .line 162
    if-eqz v2, :cond_6

    .line 163
    .line 164
    move v9, v8

    .line 165
    goto :goto_3

    .line 166
    :cond_6
    move v9, v7

    .line 167
    :goto_3
    if-eqz v2, :cond_7

    .line 168
    .line 169
    move/from16 v16, v7

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_7
    move/from16 v16, v8

    .line 173
    .line 174
    :goto_4
    iget-object v10, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 175
    .line 176
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    invoke-virtual {v10}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 181
    .line 182
    .line 183
    move-result v10

    .line 184
    cmpl-float v7, v10, v7

    .line 185
    .line 186
    if-lez v7, :cond_8

    .line 187
    .line 188
    cmpg-float v7, v10, v8

    .line 189
    .line 190
    if-gez v7, :cond_8

    .line 191
    .line 192
    iget-object v7, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 193
    .line 194
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 199
    .line 200
    .line 201
    move-result v9

    .line 202
    :cond_8
    move v15, v9

    .line 203
    const/4 v7, 0x2

    .line 204
    const/4 v8, 0x1

    .line 205
    const/16 v19, 0x0

    .line 206
    .line 207
    if-eqz v6, :cond_c

    .line 208
    .line 209
    if-eqz v3, :cond_9

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_9
    invoke-virtual {v5}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 213
    .line 214
    .line 215
    move-result-object v9

    .line 216
    aget v13, v4, v19

    .line 217
    .line 218
    aget v14, v4, v8

    .line 219
    .line 220
    const/4 v10, 0x1

    .line 221
    invoke-virtual/range {v9 .. v14}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    invoke-virtual {v1, v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 226
    .line 227
    .line 228
    :goto_5
    if-eqz v3, :cond_a

    .line 229
    .line 230
    if-nez v2, :cond_b

    .line 231
    .line 232
    :cond_a
    invoke-virtual {v5}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 233
    .line 234
    .line 235
    move-result-object v13

    .line 236
    aget v17, v4, v19

    .line 237
    .line 238
    aget v18, v4, v8

    .line 239
    .line 240
    const/4 v14, 0x1

    .line 241
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 242
    .line 243
    .line 244
    move-result-object v6

    .line 245
    invoke-virtual {v1, v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 246
    .line 247
    .line 248
    :cond_b
    const-string v6, "dragLayer"

    .line 249
    .line 250
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-direct {v0, v5, v7}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->setLayerType(Landroid/view/View;I)V

    .line 254
    .line 255
    .line 256
    goto/16 :goto_7

    .line 257
    .line 258
    :cond_c
    iget-object v6, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 259
    .line 260
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 261
    .line 262
    .line 263
    iget-object v6, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 264
    .line 265
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    invoke-virtual {v6}, Lcom/android/launcher3/Workspace;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    aget v13, v4, v19

    .line 274
    .line 275
    aget v14, v4, v8

    .line 276
    .line 277
    const/4 v10, 0x1

    .line 278
    invoke-virtual/range {v9 .. v14}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 279
    .line 280
    .line 281
    move-result-object v20

    .line 282
    invoke-virtual {v6}, Lcom/android/launcher3/Workspace;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 283
    .line 284
    .line 285
    move-result-object v13

    .line 286
    aget v17, v4, v19

    .line 287
    .line 288
    aget v18, v4, v8

    .line 289
    .line 290
    const/4 v14, 0x1

    .line 291
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 292
    .line 293
    .line 294
    move-result-object v21

    .line 295
    iget-object v9, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 296
    .line 297
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 298
    .line 299
    .line 300
    move-result-object v17

    .line 301
    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/Hotseat;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 302
    .line 303
    .line 304
    move-result-object v9

    .line 305
    aget v13, v4, v19

    .line 306
    .line 307
    aget v14, v4, v8

    .line 308
    .line 309
    move/from16 v22, v8

    .line 310
    .line 311
    move-object/from16 v8, v20

    .line 312
    .line 313
    move-object/from16 v7, v21

    .line 314
    .line 315
    invoke-virtual/range {v9 .. v14}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 316
    .line 317
    .line 318
    move-result-object v9

    .line 319
    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/Hotseat;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 320
    .line 321
    .line 322
    move-result-object v13

    .line 323
    aget v17, v4, v19

    .line 324
    .line 325
    aget v18, v4, v22

    .line 326
    .line 327
    const/4 v14, 0x1

    .line 328
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 329
    .line 330
    .line 331
    move-result-object v10

    .line 332
    iget-object v13, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 333
    .line 334
    invoke-static {v13}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 335
    .line 336
    .line 337
    move-result-object v13

    .line 338
    if-eqz v13, :cond_d

    .line 339
    .line 340
    invoke-virtual {v5}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 341
    .line 342
    .line 343
    move-result-object v9

    .line 344
    aget v13, v4, v19

    .line 345
    .line 346
    aget v14, v4, v22

    .line 347
    .line 348
    const/4 v10, 0x1

    .line 349
    invoke-virtual/range {v9 .. v14}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 350
    .line 351
    .line 352
    move-result-object v9

    .line 353
    invoke-virtual {v5}, Lcom/android/launcher3/dragndrop/DragLayer;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 354
    .line 355
    .line 356
    move-result-object v13

    .line 357
    aget v17, v4, v19

    .line 358
    .line 359
    aget v18, v4, v22

    .line 360
    .line 361
    const/4 v14, 0x1

    .line 362
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 363
    .line 364
    .line 365
    move-result-object v5

    .line 366
    filled-new-array {v8, v7, v9, v5}, [Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-virtual {v1, v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play([Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 371
    .line 372
    .line 373
    goto :goto_6

    .line 374
    :cond_d
    if-eqz v3, :cond_e

    .line 375
    .line 376
    filled-new-array {v8, v7, v9, v10}, [Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    invoke-virtual {v1, v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play([Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 381
    .line 382
    .line 383
    goto :goto_6

    .line 384
    :cond_e
    invoke-virtual {v6}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 385
    .line 386
    .line 387
    move-result-object v5

    .line 388
    move-object v13, v9

    .line 389
    invoke-virtual {v5}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 390
    .line 391
    .line 392
    move-result-object v9

    .line 393
    move-object v14, v13

    .line 394
    aget v13, v4, v19

    .line 395
    .line 396
    move-object/from16 v17, v14

    .line 397
    .line 398
    aget v14, v4, v22

    .line 399
    .line 400
    move-object/from16 v23, v10

    .line 401
    .line 402
    const/4 v10, 0x1

    .line 403
    move-object/from16 v20, v17

    .line 404
    .line 405
    invoke-virtual/range {v9 .. v14}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 406
    .line 407
    .line 408
    move-result-object v24

    .line 409
    invoke-virtual {v5}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 410
    .line 411
    .line 412
    move-result-object v13

    .line 413
    aget v17, v4, v19

    .line 414
    .line 415
    aget v18, v4, v22

    .line 416
    .line 417
    const/4 v14, 0x1

    .line 418
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 419
    .line 420
    .line 421
    move-result-object v25

    .line 422
    move-object/from16 v21, v7

    .line 423
    .line 424
    move-object/from16 v22, v20

    .line 425
    .line 426
    move-object/from16 v20, v8

    .line 427
    .line 428
    filled-new-array/range {v20 .. v25}, [Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 429
    .line 430
    .line 431
    move-result-object v5

    .line 432
    invoke-virtual {v1, v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play([Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 433
    .line 434
    .line 435
    :goto_6
    const-string v5, "workspace"

    .line 436
    .line 437
    invoke-static {v6, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    const/4 v5, 0x2

    .line 441
    invoke-direct {v0, v6, v5}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->setLayerType(Landroid/view/View;I)V

    .line 442
    .line 443
    .line 444
    :goto_7
    invoke-static {}, Lx1/O;->U2()Z

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    if-nez v5, :cond_13

    .line 449
    .line 450
    iget-object v5, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 451
    .line 452
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->R2()Z

    .line 453
    .line 454
    .line 455
    move-result v5

    .line 456
    if-nez v5, :cond_13

    .line 457
    .line 458
    iget-object v5, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 459
    .line 460
    sget-object v6, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 461
    .line 462
    invoke-interface {v5, v6}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 463
    .line 464
    .line 465
    move-result v5

    .line 466
    if-eqz v5, :cond_f

    .line 467
    .line 468
    goto :goto_9

    .line 469
    :cond_f
    iget-object v5, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 470
    .line 471
    invoke-interface {v5, v6}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 472
    .line 473
    .line 474
    move-result v5

    .line 475
    if-nez v5, :cond_10

    .line 476
    .line 477
    invoke-static {}, Lx1/O;->A2()Z

    .line 478
    .line 479
    .line 480
    move-result v5

    .line 481
    if-eqz v5, :cond_10

    .line 482
    .line 483
    invoke-direct {v0, v2, v1, v3, v4}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->doDepthAnim(ZLcom/android/quickstep/util/animation/MultiAnimatorSet;Z[F)V

    .line 484
    .line 485
    .line 486
    :cond_10
    iget-boolean v1, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mZoomOutAnimEnable:Z

    .line 487
    .line 488
    if-nez v1, :cond_13

    .line 489
    .line 490
    if-eqz v3, :cond_11

    .line 491
    .line 492
    goto :goto_9

    .line 493
    :cond_11
    if-eqz v2, :cond_12

    .line 494
    .line 495
    const-string v1, "app_launch"

    .line 496
    .line 497
    goto :goto_8

    .line 498
    :cond_12
    const-string v1, "app_exit"

    .line 499
    .line 500
    :goto_8
    iget-object v0, v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 501
    .line 502
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    invoke-virtual {v0, v2, v1}, LP1/h;->P(ZLjava/lang/String;)V

    .line 507
    .line 508
    .line 509
    :cond_13
    :goto_9
    return-void
.end method
