.class Lcom/android/launcher3/V3$d;
.super Lcom/android/launcher3/V3$f;
.source "LauncherState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/V3;->v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:I


# direct methods
.method constructor <init>(Lcom/android/launcher3/V3;Landroid/view/animation/Interpolator;I)V
    .locals 0

    .line 1
    iput p3, p0, Lcom/android/launcher3/V3$d;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/android/launcher3/V3$f;-><init>(Landroid/view/animation/Interpolator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V3$d;->b:I

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    return p0
.end method
