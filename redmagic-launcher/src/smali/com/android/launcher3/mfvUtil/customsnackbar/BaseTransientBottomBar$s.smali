.class public Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "s"
.end annotation


# instance fields
.field private a:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;


# direct methods
.method public constructor <init>(Lcom/google/android/material/behavior/SwipeDismissBehavior;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/behavior/SwipeDismissBehavior<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const p0, 0x3dcccccd    # 0.1f

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->Q(F)V

    .line 8
    .line 9
    .line 10
    const p0, 0x3f19999a    # 0.6f

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->O(F)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {p1, p0}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->R(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    return p0
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    if-eq v0, p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    if-eq v0, p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->k(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    float-to-int v0, v0

    .line 29
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    float-to-int p3, p3

    .line 34
    invoke-virtual {p1, p2, v0, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->B(Landroid/view/View;II)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->j(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public c(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 4
    .line 5
    return-void
.end method
