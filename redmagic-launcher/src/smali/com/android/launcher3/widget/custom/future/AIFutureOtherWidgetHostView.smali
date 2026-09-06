.class public Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;
.super Lcom/android/launcher3/widget/T;
.source "AIFutureOtherWidgetHostView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView$MicStatusData;
    }
.end annotation


# instance fields
.field private W:Ljava/lang/String;

.field private final a0:Z

.field private final b0:Z

.field private final c0:Z

.field private d0:Landroid/view/ViewGroup;

.field private e0:Lcom/airbnb/lottie/LottieAnimationView;

.field private f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

.field private g0:Ljava/lang/Boolean;

.field private h0:Landroid/widget/FrameLayout;

.field private i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

.field private j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

.field private k0:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/launcher3/widget/U;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->g0:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->v(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->a0:Z

    .line 18
    .line 19
    invoke-static {p3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->u(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 24
    .line 25
    invoke-static {p3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->E(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    iput-boolean p3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->c0:Z

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v2, "AIFutureOtherWidgetHostView{"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ""

    .line 42
    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    const-string v3, "mic"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move-object v3, v2

    .line 49
    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const-string v3, "Assistant"

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move-object v3, v2

    .line 58
    :goto_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    const-string v2, "Personal"

    .line 64
    .line 65
    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p3, "}"

    .line 69
    .line 70
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p2, :cond_3

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    :cond_3
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setExecutor(Ljava/util/concurrent/Executor;)V

    .line 84
    .line 85
    .line 86
    :cond_4
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->k0()V

    .line 89
    .line 90
    .line 91
    :cond_5
    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->h0(ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b0(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->a0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/T;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    sget-boolean v0, Lcom/android/launcher3/widget/T;->V:Z

    .line 15
    .line 16
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/T;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sget-boolean v2, Lcom/android/launcher3/widget/T;->V:Z

    .line 21
    .line 22
    iget-boolean v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->a0:Z

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-boolean v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 32
    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->k0:Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v3, 0x0

    .line 41
    :goto_0
    new-instance v4, Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 44
    .line 45
    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 49
    .line 50
    .line 51
    :cond_3
    if-eqz v2, :cond_4

    .line 52
    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-lez v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-lez v0, :cond_4

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    float-to-int v0, v0

    .line 72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    float-to-int v2, v2

    .line 77
    invoke-virtual {v4, v0, v2}, Landroid/graphics/Rect;->contains(II)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 82
    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v3, "dispatchTouchEventInternal mIsClickWidget changed action="

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v3, " getRawX="

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v3, " getRawY="

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p1, " rect="

    .line 125
    .line 126
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string p1, " contains="

    .line 133
    .line 134
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    if-nez v0, :cond_4

    .line 148
    .line 149
    const/4 p0, 0x0

    .line 150
    sput-boolean p0, Lcom/android/launcher3/widget/T;->V:Z

    .line 151
    .line 152
    :cond_4
    return v1
.end method

.method private c0(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->getWidgetPkgName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    if-eqz p4, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-ne p4, v0, :cond_1

    .line 53
    .line 54
    :cond_0
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    :goto_0
    move-object v1, p1

    .line 63
    check-cast v1, Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-ge v0, v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-direct {p0, v1, p2, p3, p4}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->c0(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/Class;)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    return-void
.end method

.method private getWidgetPkgName()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method

.method private synthetic h0(ZI)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->g0:Ljava/lang/Boolean;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    move p1, p2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->t0(ZZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private k0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->h0:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "onInitForAiAssistantFutureDesktopWidget init mAiAssistantLayout"

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const v1, 0x7f0e0048

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    const v0, 0x7f0b009b

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/widget/FrameLayout;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->h0:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    const v0, 0x7f0b009a

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 53
    .line 54
    const v0, 0x7f0b009c

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Landroid/view/ViewGroup;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->k0:Landroid/view/ViewGroup;

    .line 64
    .line 65
    const v0, 0x7f0b009d

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 75
    .line 76
    :cond_1
    :goto_0
    return-void
.end method

.method private q0(Landroid/widget/RemoteViews;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->getAiAssistantAIOutputDataTextView()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v4, "updateAppWidgetForAiAssistantFutureDesktopWidget aiOutputDataTextView="

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, 0x1

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    move v6, v5

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move v6, v4

    .line 47
    :goto_0
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v6, " remoteViews="

    .line 51
    .line 52
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    move v4, v5

    .line 58
    :cond_2
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 76
    .line 77
    if-nez p1, :cond_4

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 81
    .line 82
    if-eqz p1, :cond_5

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->setAIOutputDataTagTextView(Landroid/widget/TextView;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->p(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_5
    :goto_1
    return-void
.end method

.method private r0(Landroid/widget/RemoteViews;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->getAiAssistantMicDataTextView()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_0
    :try_start_0
    new-instance v2, Lcom/google/gson/f;

    .line 29
    .line 30
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 31
    .line 32
    .line 33
    const-class v3, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView$MicStatusData;

    .line 34
    .line 35
    invoke-virtual {v2, v1, v3}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView$MicStatusData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v2

    .line 43
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 44
    .line 45
    new-instance v4, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v5, "updateAppWidgetForAiAssistantMic parse micDataJsonStr error, micDataJsonStr="

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 63
    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 67
    .line 68
    new-instance v4, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v5, "updateAppWidgetForAiAssistantMic micDataTextView="

    .line 74
    .line 75
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    const/4 v6, 0x1

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    move v7, v6

    .line 83
    goto :goto_1

    .line 84
    :cond_1
    move v7, v5

    .line 85
    :goto_1
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v7, " micStatusData="

    .line 89
    .line 90
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v7, " micDataJsonStr="

    .line 97
    .line 98
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, " remoteViews="

    .line 105
    .line 106
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    move p1, v6

    .line 112
    goto :goto_2

    .line 113
    :cond_2
    move p1, v5

    .line 114
    :goto_2
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    if-nez v2, :cond_3

    .line 127
    .line 128
    goto/16 :goto_3

    .line 129
    .line 130
    :cond_3
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 135
    .line 136
    if-nez p1, :cond_4

    .line 137
    .line 138
    goto/16 :goto_3

    .line 139
    .line 140
    :cond_4
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Landroid/view/ViewGroup;

    .line 145
    .line 146
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 147
    .line 148
    if-nez v0, :cond_5

    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 151
    .line 152
    const-string v1, "updateAppWidgetForAiAssistantMic init mVoiceMicLayout"

    .line 153
    .line 154
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const v1, 0x7f0e004c

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    const v0, 0x7f0b00a8

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Landroid/view/ViewGroup;

    .line 179
    .line 180
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 181
    .line 182
    const v0, 0x7f0b00a9

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 190
    .line 191
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 192
    .line 193
    const v0, 0x7f0b00aa

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 201
    .line 202
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 203
    .line 204
    if-eqz v0, :cond_5

    .line 205
    .line 206
    new-instance v1, Lcom/android/launcher3/widget/custom/future/c;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/c;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->setOnTextColorChangedCallback(Lcom/android/launcher3/widget/custom/CustomWidgetTextView$a;)V

    .line 212
    .line 213
    .line 214
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 215
    .line 216
    if-eqz v0, :cond_6

    .line 217
    .line 218
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 223
    .line 224
    if-eqz v0, :cond_6

    .line 225
    .line 226
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 227
    .line 228
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    if-eq v0, p1, :cond_6

    .line 233
    .line 234
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 235
    .line 236
    const-string v1, "updateAppWidgetForAiAssistantMic replace mVoiceMicLayout parent"

    .line 237
    .line 238
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 242
    .line 243
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, Landroid/view/ViewGroup;

    .line 248
    .line 249
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 250
    .line 251
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0:Landroid/view/ViewGroup;

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 257
    .line 258
    .line 259
    :cond_6
    iget-boolean p1, v2, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView$MicStatusData;->input:Z

    .line 260
    .line 261
    invoke-direct {p0, p1, v5}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->t0(ZZ)V

    .line 262
    .line 263
    .line 264
    :cond_7
    :goto_3
    return-void
.end method

.method private s0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "com.zte.mifavor.launcher"

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    const/16 v2, 0x8

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    :goto_1
    return-void
.end method

.method private t0(ZZ)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->g0:Ljava/lang/Boolean;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-ne p1, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->g0:Ljava/lang/Boolean;

    .line 19
    .line 20
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "updateVoiceMicState isUserSpeak="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 43
    .line 44
    if-eqz p2, :cond_5

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_1
    if-eqz p1, :cond_3

    .line 52
    .line 53
    const-string p1, "ai_future_widget/images/"

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Lcom/airbnb/lottie/LottieAnimationView;->setImageAssetsFolder(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 59
    .line 60
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->a()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    const-string p2, "ai_future_widget/mic_light.json"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const-string p2, "ai_future_widget/mic_dark.json"

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->v()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-virtual {p2}, Lcom/airbnb/lottie/LottieAnimationView;->m()V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->a()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_4

    .line 92
    .line 93
    const p1, 0x7f08075e

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    const p1, 0x7f08075d

    .line 98
    .line 99
    .line 100
    :goto_1
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p2, p0}, Lcom/airbnb/lottie/LottieAnimationView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_5
    :goto_2
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 115
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string p1, " view error return, mVoiceMicIconLottieView="

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0:Lcom/airbnb/lottie/LottieAnimationView;

    .line 133
    .line 134
    const/4 v1, 0x0

    .line 135
    const/4 v2, 0x1

    .line 136
    if-eqz p1, :cond_6

    .line 137
    .line 138
    move p1, v2

    .line 139
    goto :goto_3

    .line 140
    :cond_6
    move p1, v1

    .line 141
    :goto_3
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string p1, " mVoiceMicTextView="

    .line 145
    .line 146
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 150
    .line 151
    if-eqz p0, :cond_7

    .line 152
    .line 153
    move v1, v2

    .line 154
    :cond_7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    return-void
.end method


# virtual methods
.method protected S(FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected d0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected e0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    return p0
.end method

.method protected f0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->a0:Z

    .line 2
    .line 3
    return p0
.end method

.method protected g0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public getAiAssistantAIOutputDataTextView()Landroid/widget/TextView;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "aiassistant_ai_output_text_view"

    .line 7
    .line 8
    const-class v2, Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-direct {p0, p0, v0, v1, v2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->c0(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/Class;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/widget/TextView;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public getAiAssistantMicDataTextView()Landroid/widget/TextView;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "aiassistant_mic_status_text_view"

    .line 7
    .line 8
    const-class v2, Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-direct {p0, p0, v0, v1, v2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->c0(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/Class;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/widget/TextView;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->getBgBlurImageView()Lcom/android/launcher3/blur/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/widget/T;->getBgBlurImageView()Lcom/android/launcher3/blur/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method protected i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onAIFutureScreenWidgetHostViewRemoved"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method protected j0(ZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->o(ZZ)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method protected l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->p()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method protected m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->q()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method protected n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherResumed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->r()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method protected o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherStarted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->s()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/widget/T;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    sub-long/2addr p1, v0

    .line 13
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0xa

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "onMeasure hao="

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, "ms info="

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->getLauncherAppWidgetProviderInfo()Lcom/android/launcher3/widget/U;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method protected p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->W:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherStopped"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->o()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->t()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    .line 1
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->a0:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->r0(Landroid/widget/RemoteViews;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->b0:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->s0()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->q0(Landroid/widget/RemoteViews;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method
