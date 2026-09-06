.class Lcom/android/launcher3/V3$e;
.super Lcom/android/launcher3/V3$g;
.source "LauncherState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/V3;->w(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Lcom/android/launcher3/C2;

.field final synthetic c:F


# direct methods
.method constructor <init>(Lcom/android/launcher3/V3;Landroid/view/animation/Interpolator;Lcom/android/launcher3/C2;F)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/android/launcher3/V3$e;->b:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iput p4, p0, Lcom/android/launcher3/V3$e;->c:F

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/android/launcher3/V3$g;-><init>(Landroid/view/animation/Interpolator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V3$e;->b:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 8
    .line 9
    rem-int/lit8 p1, p1, 0x2

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    if-eqz p1, :cond_1

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    :cond_1
    if-nez p1, :cond_3

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    :cond_2
    iget p0, p0, Lcom/android/launcher3/V3$e;->c:F

    .line 25
    .line 26
    neg-float p0, p0

    .line 27
    return p0

    .line 28
    :cond_3
    iget p0, p0, Lcom/android/launcher3/V3$e;->c:F

    .line 29
    .line 30
    return p0
.end method
