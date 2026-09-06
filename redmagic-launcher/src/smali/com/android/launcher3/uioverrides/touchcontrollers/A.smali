.class public Lcom/android/launcher3/uioverrides/touchcontrollers/A;
.super Lcom/android/launcher3/V3;
.source "SearchState.java"


# static fields
.field private static final D:I

.field private static final E:Lcom/android/launcher3/V3$f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/V3;->f:I

    .line 2
    .line 3
    sget v1, Lcom/android/launcher3/V3;->j:I

    .line 4
    .line 5
    or-int/2addr v0, v1

    .line 6
    sput v0, Lcom/android/launcher3/uioverrides/touchcontrollers/A;->D:I

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/A$a;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/anim/L;->j:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/A$a;-><init>(Landroid/view/animation/Interpolator;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/A;->E:Lcom/android/launcher3/V3$f;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x7

    .line 2
    sget v1, Lcom/android/launcher3/uioverrides/touchcontrollers/A;->D:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/V3;-><init>(III)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/A;->l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h(Lcom/android/launcher3/C2;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "slide to open search"

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 7
    .line 8
    return-object p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3fc00000    # 1.5f

    .line 2
    .line 3
    return p0
.end method

.method public shouldDisableRestore()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldDisableRestore()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public shouldPreserveDataStateOnReapply()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldPreserveDataStateOnReapply()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public showTaskThumbnailSplash()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->showTaskThumbnailSplash()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/uioverrides/touchcontrollers/A;->E:Lcom/android/launcher3/V3$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 p1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/V3$h;->a:F

    .line 10
    .line 11
    iget p1, p0, Lcom/android/launcher3/V3$h;->c:F

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/android/launcher3/V3$h;->c:F

    .line 18
    .line 19
    return-object p0
.end method
