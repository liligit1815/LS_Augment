.class Lcom/android/launcher3/taskbar/bubbles/o0$a;
.super LQ2/b;
.source "BubbleDismissController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/o0;->l(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LQ2/b<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/o0;Landroid/content/Context;Landroid/view/View;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4, p5}, LQ2/b;-><init>(Landroid/content/Context;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic g(Ljava/lang/Object;)F
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/o0$a;->u(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;[I)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/o0$a;->v(Landroid/view/View;[I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;)F
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/o0$a;->w(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    mul-float/2addr p0, p1

    .line 11
    return p0
.end method

.method public v(Landroid/view/View;[I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    mul-float/2addr p0, p1

    .line 11
    return p0
.end method
