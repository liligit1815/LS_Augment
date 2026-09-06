.class Lcom/android/launcher3/dragndrop/v$d$a;
.super Landroidx/dynamicanimation/animation/g;
.source "DragView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/v$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/g<",
        "Lcom/android/launcher3/dragndrop/v$d;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/dynamicanimation/animation/g;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/dragndrop/v$d;)F
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/dragndrop/v$d;->a(Lcom/android/launcher3/dragndrop/v$d;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/android/launcher3/dragndrop/v$d;F)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/dragndrop/v$d;->c(Lcom/android/launcher3/dragndrop/v$d;F)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/android/launcher3/dragndrop/v$d;->b(Lcom/android/launcher3/dragndrop/v$d;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic getValue(Ljava/lang/Object;)F
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/dragndrop/v$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/v$d$a;->a(Lcom/android/launcher3/dragndrop/v$d;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/dragndrop/v$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/dragndrop/v$d$a;->b(Lcom/android/launcher3/dragndrop/v$d;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
